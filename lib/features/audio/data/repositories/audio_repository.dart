import 'dart:io';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../core/network/network_response.dart';
import '../../../../core/result/result.dart';
import '../../../../core/datasources/audio_remote_datasource.dart';
import '../dtos/audio_item_dto.dart';
import '../dtos/audio_response_dto.dart';
import '../models/audio_model.dart';

// ─────────────────────────────────────────
// Isolate 通訊資料結構（必須是 top-level，才能被 Isolate.spawn 引用）
// ─────────────────────────────────────────

/// 傳入 download isolate 的參數
class _IsolateDownloadArgs {
  const _IsolateDownloadArgs({
    required this.url,
    required this.savePath,
    required this.sendPort,
  });

  final String url;
  final String savePath;

  /// 用於把進度 / 結果送回 main isolate
  final SendPort sendPort;
}

/// Download isolate 的進入點（top-level function）
///
/// 訊息協定（送回 main isolate）：
/// - `double` 0.0～1.0   → 下載進度（-1.0 = indeterminate）
/// - `'done'`            → 下載完成
/// - `'error:<message>'` → 下載失敗
@pragma('vm:entry-point')
Future<void> _isolateDownloadEntry(_IsolateDownloadArgs args) async {
  try {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(minutes: 5),
        followRedirects: true,
        maxRedirects: 5,
        headers: {'Accept': 'application/octet-stream'},
      ),
    );

    await dio.download(
      args.url,
      args.savePath,
      onReceiveProgress: (received, total) {
        // total == -1 代表伺服器沒回 Content-Length
        final progress = total > 0 ? received / total : -1.0;
        args.sendPort.send(progress);
      },
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: true,
      ),
    );

    args.sendPort.send('done');
  } catch (e) {
    args.sendPort.send('error:${e.toString()}');
  }
}

// ─────────────────────────────────────────
// Repository
// ─────────────────────────────────────────

/// 語音導覽 Repository
///
/// 職責：
/// 1. 呼叫 [AudioRemoteDataSource] 取得 [NetworkResponse]
/// 2. 將 [NetworkResponse] 轉換為 [Result]（含 DTO → domain model）
/// 3. 管理本地音訊檔案（下載、查詢、路徑解析）
///    - [downloadAudio] 在獨立 [Isolate] 中執行下載，不阻塞 UI 線程
class AudioRepository {
  const AudioRepository({required AudioRemoteDataSource dataSource})
      : _dataSource = dataSource;

  final AudioRemoteDataSource _dataSource;

  // ─────────────────────────────────────────
  // 列表 API
  // ─────────────────────────────────────────

  /// 取得語音導覽列表（分頁）
  Future<Result<({List<AudioModel> items, int total})>> fetchAudios({
    int page = 1,
  }) async {
    final response = await _dataSource.fetchAudios(page: page);
    return switch (response) {
      NetworkSuccess<AudioResponseDto>(:final data) => ResultSuccess(
          (
            items: data.data
                .where((dto) => dto.url.isNotEmpty)
                .map(_dtoToModel)
                .toList(),
            total: data.total,
          ),
        ),
      NetworkError<AudioResponseDto>(:final message) => ResultFailure(message),
    };
  }

  // ─────────────────────────────────────────
  // 本地檔案管理
  // ─────────────────────────────────────────

  /// 取得特定 [fileName] 的本地完整路徑
  Future<String> getLocalFilePath(String fileName) async {
    final dir = await _getAudioDir();
    return '${dir.path}/$fileName';
  }

  /// 判斷特定 [fileName] 是否已下載至本地
  Future<bool> isDownloaded(String fileName) async {
    final path = await getLocalFilePath(fileName);
    return File(path).exists();
  }

  /// 將音訊檔下載至本地 audio_files 資料夾（在獨立 Isolate 中執行）
  ///
  /// 回傳 `Stream<Result<void>>`：
  /// - [ResultLoading]（progress: 0.0～1.0 / null）→ 下載進行中，攜帶進度
  /// - [ResultSuccess] → 下載完成
  /// - [ResultFailure] → 下載失敗，攜帶錯誤訊息
  ///
  /// 注意：[path_provider] 使用 platform channel，
  /// 必須在 main isolate 取得路徑後再傳入 download isolate。
  Stream<Result<void>> downloadAudio({
    required String url,
    required String fileName,
  }) async* {
    yield const ResultLoading<void>();

    // ① path_provider 只能在 main isolate 呼叫
    final savePath = await getLocalFilePath(fileName);

    final receivePort = ReceivePort();
    Isolate? isolate;

    try {
      // ② 啟動 download isolate，傳入 SendPort 供回傳訊息
      isolate = await Isolate.spawn(
        _isolateDownloadEntry,
        _IsolateDownloadArgs(
          url: url,
          savePath: savePath,
          sendPort: receivePort.sendPort,
        ),
        errorsAreFatal: false,
      );

      // ③ 監聽 isolate 傳回的訊息
      await for (final message in receivePort) {
        if (message is double) {
          // progress：-1.0 表示 indeterminate
          yield ResultLoading<void>(
            progress: message < 0 ? null : message,
          );
        } else if (message == 'done') {
          yield ResultSuccess<void>(null);
          break;
        } else if (message is String && message.startsWith('error:')) {
          yield ResultFailure<void>(message.substring(6));
          break;
        }
      }
    } finally {
      // ④ 無論成功 / 失敗，都關閉 port 並終止 isolate
      receivePort.close();
      isolate?.kill(priority: Isolate.immediate);
    }
  }

  // ─────────────────────────────────────────
  // 私有輔助
  // ─────────────────────────────────────────

  Future<Directory> _getAudioDir() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final dir = Directory('${docsDir.path}/audio_files');
    if (!dir.existsSync()) await dir.create(recursive: true);
    return dir;
  }

  AudioModel _dtoToModel(AudioItemDto dto) => AudioModel(
        id: dto.id,
        title: dto.title,
        url: dto.url,
        modified: dto.modified,
      );
}

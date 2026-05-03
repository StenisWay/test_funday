import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/audio_model.dart';

part 'audio_list_state.freezed.dart';

enum AudioListStatus { initial, loading, loadingMore, success, failure }

enum DownloadStatus { notDownloaded, downloading, downloaded, error }

@freezed
abstract class AudioListState with _$AudioListState {
  const AudioListState._(); // 允許自訂方法

  const factory AudioListState({
    @Default(AudioListStatus.initial) AudioListStatus status,
    @Default(<AudioModel>[]) List<AudioModel> items,
    @Default(<int, DownloadStatus>{}) Map<int, DownloadStatus> downloadStatuses,
    @Default(true) bool hasMore,
    @Default(1) int currentPage,
    @Default(0) int total,
    String? errorMessage,
  }) = _AudioListState;

  /// 取得指定 item 的下載狀態
  DownloadStatus getDownloadStatus(int id) =>
      downloadStatuses[id] ?? DownloadStatus.notDownloaded;
}

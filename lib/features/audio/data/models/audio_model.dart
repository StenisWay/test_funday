import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_model.freezed.dart';

/// 語音導覽 domain model（純業務邏輯，不含 JSON 相依）
///
/// JSON 解析由 [AudioItemDto] 負責，
/// DTO → Model 轉換由 [AudioRemoteDataSource] 負責。
@freezed
abstract class AudioModel with _$AudioModel {
  const AudioModel._(); // 允許自訂 getter

  const factory AudioModel({
    required int id,
    @Default('') String title,
    @Default('') String url,
    /// API 回傳的 modified 時間戳（ISO 8601），可為 null
    String? modified,
  }) = _AudioModel;

  /// 將 [modified] 格式化為 `M/dd HH:mm`，例如 `12/22 14:00`
  /// 若 [modified] 為 null 或解析失敗則回傳空字串
  String get formattedDate {
    if (modified == null || modified!.isEmpty) return '';
    try {
      final dt = DateTime.parse(modified!).toLocal();
      final mm = dt.month.toString();
      final dd = dt.day.toString().padLeft(2, '0');
      final hh = dt.hour.toString().padLeft(2, '0');
      final min = dt.minute.toString().padLeft(2, '0');
      return '$mm/$dd $hh:$min';
    } catch (_) {
      return '';
    }
  }

  /// 從 URL 萃取本地檔名，確保副檔名為 .mp3
  String get fileName {
    try {
      final uri = Uri.parse(url);
      final segments = uri.pathSegments.where((s) => s.isNotEmpty).toList();
      if (segments.isNotEmpty) {
        var name = segments.last;
        if (name.isNotEmpty) {
          if (!name.toLowerCase().endsWith('.mp3')) name = '$name.mp3';
          return name;
        }
      }
    } catch (_) {}
    return 'audio_$id.mp3';
  }
}

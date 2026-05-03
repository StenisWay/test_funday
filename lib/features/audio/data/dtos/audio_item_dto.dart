import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_item_dto.freezed.dart';
part 'audio_item_dto.g.dart';

/// 語音導覽 API 單筆回傳的原始 DTO（對應 API JSON 欄位）
///
/// 實際回傳欄位（全小寫）：
/// ```json
/// { "id": 28, "title": "北投圖書館", "url": "https://www.travel.taipei/audio/28",
///   "summary": null, "file_ext": null, "modified": "..." }
/// ```
@freezed
abstract class AudioItemDto with _$AudioItemDto {
  const factory AudioItemDto({
    @Default(0) int id,
    @Default('') String title,
    @Default('') String url,
    String? modified,
  }) = _AudioItemDto;

  factory AudioItemDto.fromJson(Map<String, dynamic> json) =>
      _$AudioItemDtoFromJson(json);
}

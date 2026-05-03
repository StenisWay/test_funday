import 'package:freezed_annotation/freezed_annotation.dart';
import 'audio_item_dto.dart';

part 'audio_response_dto.freezed.dart';
part 'audio_response_dto.g.dart';

/// 語音導覽 API 分頁回傳包裝 DTO
/// ```json
/// { "total": 140, "data": [ { "id": 28, "title": "...", "url": "..." } ] }
/// ```
@freezed
abstract class AudioResponseDto with _$AudioResponseDto {
  const factory AudioResponseDto({
    @Default(0) int total,
    @Default(<AudioItemDto>[]) List<AudioItemDto> data,
  }) = _AudioResponseDto;

  factory AudioResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AudioResponseDtoFromJson(json);
}

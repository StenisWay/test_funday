// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AudioResponseDto _$AudioResponseDtoFromJson(Map<String, dynamic> json) =>
    _AudioResponseDto(
      total: (json['total'] as num?)?.toInt() ?? 0,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => AudioItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AudioItemDto>[],
    );

Map<String, dynamic> _$AudioResponseDtoToJson(_AudioResponseDto instance) =>
    <String, dynamic>{'total': instance.total, 'data': instance.data};

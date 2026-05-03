// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AudioItemDto _$AudioItemDtoFromJson(Map<String, dynamic> json) =>
    _AudioItemDto(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      url: json['url'] as String? ?? '',
      modified: json['modified'] as String?,
    );

Map<String, dynamic> _$AudioItemDtoToJson(_AudioItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'modified': instance.modified,
    };

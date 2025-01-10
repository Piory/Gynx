// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/entities/t_post_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TPostMediaImpl _$$TPostMediaImplFromJson(Map<String, dynamic> json) =>
    _$TPostMediaImpl(
      id: json['id'] as String,
      postId: (json['post_id'] as num).toInt(),
      displayOrder: (json['display_order'] as num).toInt(),
      type: $enumDecode(_$MediaTypeEnumMap, json['type']),
      url: json['url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$$TPostMediaImplToJson(_$TPostMediaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'display_order': instance.displayOrder,
      'type': _$MediaTypeEnumMap[instance.type]!,
      'url': instance.url,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

const _$MediaTypeEnumMap = {
  MediaType.image: 'image',
  MediaType.video: 'video',
};

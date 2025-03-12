// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/entities/t_post_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TPostMedia _$TPostMediaFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TPostMedia',
      json,
      ($checkedConvert) {
        final val = TPostMedia(
          id: $checkedConvert('id', (v) => v as String),
          postId: $checkedConvert('post_id', (v) => (v as num).toInt()),
          displayOrder:
              $checkedConvert('display_order', (v) => (v as num).toInt()),
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$MediaTypeEnumMap, v)),
          url: $checkedConvert('url', (v) => v as String),
          createdAt:
              $checkedConvert('created_at', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updated_at', (v) => DateTime.parse(v as String)),
          deletedAt: $checkedConvert('deleted_at',
              (v) => v == null ? null : DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'postId': 'post_id',
        'displayOrder': 'display_order',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'deletedAt': 'deleted_at'
      },
    );

Map<String, dynamic> _$TPostMediaToJson(TPostMedia instance) =>
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

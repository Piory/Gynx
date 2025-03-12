// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/entities/t_user_timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TUserTimeline _$TUserTimelineFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TUserTimeline',
      json,
      ($checkedConvert) {
        final val = TUserTimeline(
          id: $checkedConvert('id', (v) => v as String),
          userId: $checkedConvert('user_id', (v) => v as String),
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$TimelineTypeEnumMap, v)),
          postId: $checkedConvert('post_id', (v) => (v as num).toInt()),
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
        'userId': 'user_id',
        'postId': 'post_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'deletedAt': 'deleted_at'
      },
    );

Map<String, dynamic> _$TUserTimelineToJson(TUserTimeline instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'type': _$TimelineTypeEnumMap[instance.type]!,
      'post_id': instance.postId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

const _$TimelineTypeEnumMap = {
  TimelineType.follow: 'follow',
};

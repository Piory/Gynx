// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/entities/t_user_timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TUserTimelineImpl _$$TUserTimelineImplFromJson(Map<String, dynamic> json) =>
    _$TUserTimelineImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      type: $enumDecode(_$TimelineTypeEnumMap, json['type']),
      postId: (json['post_id'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$$TUserTimelineImplToJson(_$TUserTimelineImpl instance) =>
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

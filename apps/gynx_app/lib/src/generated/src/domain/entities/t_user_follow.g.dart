// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/entities/t_user_follow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TUserFollowImpl _$$TUserFollowImplFromJson(Map<String, dynamic> json) =>
    _$TUserFollowImpl(
      id: (json['id'] as num).toInt(),
      userId: json['user_id'] as String,
      followUserId: json['follow_user_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$$TUserFollowImplToJson(_$TUserFollowImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'follow_user_id': instance.followUserId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

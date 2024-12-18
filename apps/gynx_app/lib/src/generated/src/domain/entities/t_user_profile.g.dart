// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/entities/t_user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TUserProfileImpl _$$TUserProfileImplFromJson(Map<String, dynamic> json) =>
    _$TUserProfileImpl(
      userId: json['user_id'] as String,
      username: json['username'] as String,
      avatarUrl: json['avatar_url'] as String?,
      selfIntroduction: json['self_introduction'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$$TUserProfileImplToJson(_$TUserProfileImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'username': instance.username,
      'avatar_url': instance.avatarUrl,
      'self_introduction': instance.selfIntroduction,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

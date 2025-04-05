// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/entities/t_user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TUserProfile _$TUserProfileFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TUserProfile',
      json,
      ($checkedConvert) {
        final val = TUserProfile(
          userId: $checkedConvert('user_id', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String),
          avatarUrl: $checkedConvert('avatar_url', (v) => v as String?),
          selfIntroduction:
              $checkedConvert('self_introduction', (v) => v as String),
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
        'avatarUrl': 'avatar_url',
        'selfIntroduction': 'self_introduction',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'deletedAt': 'deleted_at'
      },
    );

Map<String, dynamic> _$TUserProfileToJson(TUserProfile instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'username': instance.username,
      'avatar_url': instance.avatarUrl,
      'self_introduction': instance.selfIntroduction,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

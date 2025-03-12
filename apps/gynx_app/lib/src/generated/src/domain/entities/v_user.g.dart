// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/entities/v_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VUser _$VUserFromJson(Map<String, dynamic> json) => $checkedCreate(
      'VUser',
      json,
      ($checkedConvert) {
        final val = VUser(
          userId: $checkedConvert('user_id', (v) => v as String),
          gynxId: $checkedConvert('gynx_id', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String),
          avatarUrl: $checkedConvert('avatar_url', (v) => v as String?),
          createdAt:
              $checkedConvert('created_at', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updated_at', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'userId': 'user_id',
        'gynxId': 'gynx_id',
        'avatarUrl': 'avatar_url',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at'
      },
    );

Map<String, dynamic> _$VUserToJson(VUser instance) => <String, dynamic>{
      'user_id': instance.userId,
      'gynx_id': instance.gynxId,
      'username': instance.username,
      'avatar_url': instance.avatarUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

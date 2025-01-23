// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/entities/v_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VUserImpl _$$VUserImplFromJson(Map<String, dynamic> json) => _$VUserImpl(
      userId: json['user_id'] as String,
      gynxId: json['gynx_id'] as String,
      username: json['username'] as String,
      avatarUrl: json['avatar_url'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$VUserImplToJson(_$VUserImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'gynx_id': instance.gynxId,
      'username': instance.username,
      'avatar_url': instance.avatarUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

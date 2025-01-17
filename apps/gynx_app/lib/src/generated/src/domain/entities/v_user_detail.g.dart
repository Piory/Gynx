// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/entities/v_user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VUserDetailImpl _$$VUserDetailImplFromJson(Map<String, dynamic> json) =>
    _$VUserDetailImpl(
      userId: json['user_id'] as String,
      gynxId: json['gynx_id'] as String,
      username: json['username'] as String,
      avatarUrl: json['avatar_url'] as String?,
      selfIntroduction: json['self_introduction'] as String,
      latestPosts: (json['latest_posts'] as List<dynamic>)
          .map((e) => VPost.fromJson(e as Map<String, dynamic>))
          .toList(),
      followCount: (json['follow_count'] as num).toInt(),
      followerCount: (json['follower_count'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$$VUserDetailImplToJson(_$VUserDetailImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'gynx_id': instance.gynxId,
      'username': instance.username,
      'avatar_url': instance.avatarUrl,
      'self_introduction': instance.selfIntroduction,
      'latest_posts': instance.latestPosts,
      'follow_count': instance.followCount,
      'follower_count': instance.followerCount,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

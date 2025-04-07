// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/entities/v_user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VUserDetail _$VUserDetailFromJson(Map<String, dynamic> json) => $checkedCreate(
      'VUserDetail',
      json,
      ($checkedConvert) {
        final val = VUserDetail(
          userId: $checkedConvert('user_id', (v) => v as String),
          screenName: $checkedConvert('screen_name', (v) => v as String),
          displayName: $checkedConvert('display_name', (v) => v as String),
          avatarUrl: $checkedConvert('avatar_url', (v) => v as String?),
          selfIntroduction:
              $checkedConvert('self_introduction', (v) => v as String),
          latestPosts: $checkedConvert(
              'latest_posts',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => VPost.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          favoritePosts: $checkedConvert(
              'favorite_posts',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => VPost.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          followCount:
              $checkedConvert('follow_count', (v) => (v as num).toInt()),
          followerCount:
              $checkedConvert('follower_count', (v) => (v as num).toInt()),
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
        'screenName': 'screen_name',
        'displayName': 'display_name',
        'avatarUrl': 'avatar_url',
        'selfIntroduction': 'self_introduction',
        'latestPosts': 'latest_posts',
        'favoritePosts': 'favorite_posts',
        'followCount': 'follow_count',
        'followerCount': 'follower_count',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'deletedAt': 'deleted_at'
      },
    );

Map<String, dynamic> _$VUserDetailToJson(VUserDetail instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'screen_name': instance.screenName,
      'display_name': instance.displayName,
      'avatar_url': instance.avatarUrl,
      'self_introduction': instance.selfIntroduction,
      'latest_posts': instance.latestPosts,
      'favorite_posts': instance.favoritePosts,
      'follow_count': instance.followCount,
      'follower_count': instance.followerCount,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/entities/v_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VPost _$VPostFromJson(Map<String, dynamic> json) => $checkedCreate(
      'VPost',
      json,
      ($checkedConvert) {
        final val = VPost(
          postId: $checkedConvert('post_id', (v) => (v as num).toInt()),
          userId: $checkedConvert('user_id', (v) => v as String),
          repost: $checkedConvert(
              'repost',
              (v) =>
                  v == null ? null : VPost.fromJson(v as Map<String, dynamic>)),
          text: $checkedConvert('text', (v) => v as String?),
          medias: $checkedConvert(
              'medias',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map(
                          (e) => TPostMedia.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          repostCount:
              $checkedConvert('repost_count', (v) => (v as num).toInt()),
          favoriteCount:
              $checkedConvert('favorite_count', (v) => (v as num).toInt()),
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
        'userId': 'user_id',
        'repostCount': 'repost_count',
        'favoriteCount': 'favorite_count',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'deletedAt': 'deleted_at'
      },
    );

Map<String, dynamic> _$VPostToJson(VPost instance) => <String, dynamic>{
      'post_id': instance.postId,
      'user_id': instance.userId,
      'repost': instance.repost,
      'text': instance.text,
      'medias': instance.medias,
      'repost_count': instance.repostCount,
      'favorite_count': instance.favoriteCount,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

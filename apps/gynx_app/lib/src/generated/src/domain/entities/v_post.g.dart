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
          originalPostId:
              $checkedConvert('original_post_id', (v) => (v as num?)?.toInt()),
          originalUserId:
              $checkedConvert('original_user_id', (v) => v as String?),
          repostType: $checkedConvert(
              'repost_type', (v) => $enumDecode(_$RepostTypeEnumMap, v)),
          displayText: $checkedConvert('display_text', (v) => v as String?),
          displayMedias: $checkedConvert(
              'display_medias',
              (v) => (v as List<dynamic>)
                  .map((e) => TPostMedia.fromJson(e as Map<String, dynamic>))
                  .toList()),
          quoteText: $checkedConvert('quote_text', (v) => v as String?),
          quoteMedias: $checkedConvert(
              'quote_medias',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => TPostMedia.fromJson(e as Map<String, dynamic>))
                  .toList()),
          isReposted: $checkedConvert('is_reposted', (v) => v as bool),
          repostCount:
              $checkedConvert('repost_count', (v) => (v as num).toInt()),
          isFavorited: $checkedConvert('is_favorited', (v) => v as bool),
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
        'originalPostId': 'original_post_id',
        'originalUserId': 'original_user_id',
        'repostType': 'repost_type',
        'displayText': 'display_text',
        'displayMedias': 'display_medias',
        'quoteText': 'quote_text',
        'quoteMedias': 'quote_medias',
        'isReposted': 'is_reposted',
        'repostCount': 'repost_count',
        'isFavorited': 'is_favorited',
        'favoriteCount': 'favorite_count',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'deletedAt': 'deleted_at'
      },
    );

Map<String, dynamic> _$VPostToJson(VPost instance) => <String, dynamic>{
      'post_id': instance.postId,
      'user_id': instance.userId,
      'original_post_id': instance.originalPostId,
      'original_user_id': instance.originalUserId,
      'repost_type': _$RepostTypeEnumMap[instance.repostType]!,
      'display_text': instance.displayText,
      'display_medias': instance.displayMedias,
      'quote_text': instance.quoteText,
      'quote_medias': instance.quoteMedias,
      'is_reposted': instance.isReposted,
      'repost_count': instance.repostCount,
      'is_favorited': instance.isFavorited,
      'favorite_count': instance.favoriteCount,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

const _$RepostTypeEnumMap = {
  RepostType.none: 'none',
  RepostType.repost: 'repost',
  RepostType.quote: 'quote',
};

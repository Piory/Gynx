// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/entities/v_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VPostImpl _$$VPostImplFromJson(Map<String, dynamic> json) => _$VPostImpl(
      postId: (json['post_id'] as num).toInt(),
      userId: json['user_id'] as String,
      repost: json['repost'] == null
          ? null
          : VPost.fromJson(json['repost'] as Map<String, dynamic>),
      text: json['text'] as String?,
      medias: (json['medias'] as List<dynamic>?)
              ?.map((e) => TPostMedia.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      repostCount: (json['repost_count'] as num).toInt(),
      favoriteCount: (json['favorite_count'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$$VPostImplToJson(_$VPostImpl instance) =>
    <String, dynamic>{
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/entities/t_user_post_favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TUserPostFavorite _$TUserPostFavoriteFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TUserPostFavorite',
      json,
      ($checkedConvert) {
        final val = TUserPostFavorite(
          id: $checkedConvert('id', (v) => v as String),
          userId: $checkedConvert('user_id', (v) => v as String),
          postId: $checkedConvert('post_id', (v) => (v as num).toInt()),
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
        'postId': 'post_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'deletedAt': 'deleted_at'
      },
    );

Map<String, dynamic> _$TUserPostFavoriteToJson(TUserPostFavorite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'post_id': instance.postId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

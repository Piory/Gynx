// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/entities/t_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TPost _$TPostFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TPost',
      json,
      ($checkedConvert) {
        final val = TPost(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          userId: $checkedConvert('user_id', (v) => v as String),
          text: $checkedConvert('text', (v) => v as String),
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
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'deletedAt': 'deleted_at'
      },
    );

Map<String, dynamic> _$TPostToJson(TPost instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'text': instance.text,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

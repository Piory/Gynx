// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/entities/t_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TPostImpl _$$TPostImplFromJson(Map<String, dynamic> json) => _$TPostImpl(
      id: (json['id'] as num).toInt(),
      userId: json['user_id'] as String,
      text: json['text'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$$TPostImplToJson(_$TPostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'text': instance.text,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

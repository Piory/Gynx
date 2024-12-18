// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/entities/t_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TUserImpl _$$TUserImplFromJson(Map<String, dynamic> json) => _$TUserImpl(
      id: json['id'] as String,
      gynxId: json['gynx_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$$TUserImplToJson(_$TUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gynx_id': instance.gynxId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

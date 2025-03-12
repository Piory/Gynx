// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/entities/t_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TUser _$TUserFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TUser',
      json,
      ($checkedConvert) {
        final val = TUser(
          id: $checkedConvert('id', (v) => v as String),
          gynxId: $checkedConvert('gynx_id', (v) => v as String),
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
        'gynxId': 'gynx_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'deletedAt': 'deleted_at'
      },
    );

Map<String, dynamic> _$TUserToJson(TUser instance) => <String, dynamic>{
      'id': instance.id,
      'gynx_id': instance.gynxId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

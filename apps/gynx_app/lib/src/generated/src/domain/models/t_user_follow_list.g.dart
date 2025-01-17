// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/models/t_user_follow_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TUserFollowListImpl _$$TUserFollowListImplFromJson(
        Map<String, dynamic> json) =>
    _$TUserFollowListImpl(
      (json['tUserFollows'] as List<dynamic>)
          .map((e) => TUserFollow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TUserFollowListImplToJson(
        _$TUserFollowListImpl instance) =>
    <String, dynamic>{
      'tUserFollows': instance.tUserFollows,
    };

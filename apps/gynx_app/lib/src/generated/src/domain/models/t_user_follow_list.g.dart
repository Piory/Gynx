// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/models/t_user_follow_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TUserFollowList _$TUserFollowListFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TUserFollowList',
      json,
      ($checkedConvert) {
        final val = TUserFollowList(
          $checkedConvert(
              'tUserFollows',
              (v) => (v as List<dynamic>)
                  .map((e) => TUserFollow.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$TUserFollowListToJson(TUserFollowList instance) =>
    <String, dynamic>{
      'tUserFollows': instance.tUserFollows,
    };

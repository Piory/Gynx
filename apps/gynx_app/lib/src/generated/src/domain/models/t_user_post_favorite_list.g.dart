// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/models/t_user_post_favorite_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TUserPostFavoriteList _$TUserPostFavoriteListFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TUserPostFavoriteList',
      json,
      ($checkedConvert) {
        final val = TUserPostFavoriteList(
          $checkedConvert(
              'tUserPostFavorites',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      TUserPostFavorite.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$TUserPostFavoriteListToJson(
        TUserPostFavoriteList instance) =>
    <String, dynamic>{
      'tUserPostFavorites': instance.tUserPostFavorites,
    };

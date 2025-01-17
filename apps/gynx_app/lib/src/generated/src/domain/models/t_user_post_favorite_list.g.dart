// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/models/t_user_post_favorite_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TUserPostFavoriteListImpl _$$TUserPostFavoriteListImplFromJson(
        Map<String, dynamic> json) =>
    _$TUserPostFavoriteListImpl(
      (json['tUserPostFavorites'] as List<dynamic>)
          .map((e) => TUserPostFavorite.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TUserPostFavoriteListImplToJson(
        _$TUserPostFavoriteListImpl instance) =>
    <String, dynamic>{
      'tUserPostFavorites': instance.tUserPostFavorites,
    };

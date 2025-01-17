// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/models/t_post_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TPostListImpl _$$TPostListImplFromJson(Map<String, dynamic> json) =>
    _$TPostListImpl(
      (json['tPosts'] as List<dynamic>)
          .map((e) => TPost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TPostListImplToJson(_$TPostListImpl instance) =>
    <String, dynamic>{
      'tPosts': instance.tPosts,
    };

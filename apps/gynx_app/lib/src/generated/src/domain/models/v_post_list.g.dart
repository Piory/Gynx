// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/models/v_post_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VPostListImpl _$$VPostListImplFromJson(Map<String, dynamic> json) =>
    _$VPostListImpl(
      (json['vPosts'] as List<dynamic>)
          .map((e) => VPost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VPostListImplToJson(_$VPostListImpl instance) =>
    <String, dynamic>{
      'vPosts': instance.vPosts,
    };

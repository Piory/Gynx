// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/models/t_post_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TPostList _$TPostListFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TPostList',
      json,
      ($checkedConvert) {
        final val = TPostList(
          $checkedConvert(
              'tPosts',
              (v) => (v as List<dynamic>)
                  .map((e) => TPost.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$TPostListToJson(TPostList instance) => <String, dynamic>{
      'tPosts': instance.tPosts,
    };

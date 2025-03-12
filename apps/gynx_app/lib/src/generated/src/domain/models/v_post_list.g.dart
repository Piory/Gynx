// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/models/v_post_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VPostList _$VPostListFromJson(Map<String, dynamic> json) => $checkedCreate(
      'VPostList',
      json,
      ($checkedConvert) {
        final val = VPostList(
          $checkedConvert(
              'vPosts',
              (v) => (v as List<dynamic>)
                  .map((e) => VPost.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$VPostListToJson(VPostList instance) => <String, dynamic>{
      'vPosts': instance.vPosts,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/models/t_post_media_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TPostMediaList _$TPostMediaListFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TPostMediaList',
      json,
      ($checkedConvert) {
        final val = TPostMediaList(
          $checkedConvert(
              'tPostMedias',
              (v) => (v as List<dynamic>)
                  .map((e) => TPostMedia.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$TPostMediaListToJson(TPostMediaList instance) =>
    <String, dynamic>{
      'tPostMedias': instance.tPostMedias,
    };

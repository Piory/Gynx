// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/models/t_post_media_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TPostMediaListImpl _$$TPostMediaListImplFromJson(Map<String, dynamic> json) =>
    _$TPostMediaListImpl(
      (json['tPostMedias'] as List<dynamic>)
          .map((e) => TPostMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TPostMediaListImplToJson(
        _$TPostMediaListImpl instance) =>
    <String, dynamic>{
      'tPostMedias': instance.tPostMedias,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/models/t_user_timeline_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TUserTimelineListImpl _$$TUserTimelineListImplFromJson(
        Map<String, dynamic> json) =>
    _$TUserTimelineListImpl(
      (json['tUserTimelines'] as List<dynamic>)
          .map((e) => TUserTimeline.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TUserTimelineListImplToJson(
        _$TUserTimelineListImpl instance) =>
    <String, dynamic>{
      'tUserTimelines': instance.tUserTimelines,
    };

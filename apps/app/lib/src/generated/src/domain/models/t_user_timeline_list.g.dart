// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../domain/models/t_user_timeline_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TUserTimelineList _$TUserTimelineListFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TUserTimelineList',
      json,
      ($checkedConvert) {
        final val = TUserTimelineList(
          $checkedConvert(
              'tUserTimelines',
              (v) => (v as List<dynamic>)
                  .map((e) => TUserTimeline.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$TUserTimelineListToJson(TUserTimelineList instance) =>
    <String, dynamic>{
      'tUserTimelines': instance.tUserTimelines,
    };

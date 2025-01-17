import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/t_user_timeline.dart';

part '../../generated/src/domain/models/t_user_timeline_list.freezed.dart';
part '../../generated/src/domain/models/t_user_timeline_list.g.dart';

@freezed
class TUserTimelineList with _$TUserTimelineList {
  const factory TUserTimelineList(List<TUserTimeline> tUserTimelines) =
      _TUserTimelineList;

  const TUserTimelineList._();

  factory TUserTimelineList.fromJson(List<Map<String, dynamic>> json) =>
      _$TUserTimelineListFromJson({'tUserTimelines': json});

  static const empty = TUserTimelineList([]);
}

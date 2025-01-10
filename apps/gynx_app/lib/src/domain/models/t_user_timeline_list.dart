import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/t_user_timeline.dart';

part '../../generated/src/domain/models/t_user_timeline_list.freezed.dart';

@freezed
class TUserTimelineList with _$TUserTimelineList {
  const factory TUserTimelineList(List<TUserTimeline> tUserTimelines) =
      _TUserTimelineList;

  factory TUserTimelineList.fromIterator(
    Iterator<Map<String, dynamic>> iterator,
  ) {
    final list = <TUserTimeline>[];
    while (iterator.moveNext()) {
      list.add(TUserTimeline.fromJson(iterator.current));
    }
    return TUserTimelineList(list);
  }

  const TUserTimelineList._();

  static const empty = TUserTimelineList([]);
}

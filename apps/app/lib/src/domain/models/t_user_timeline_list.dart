import 'package:app/src/domain/entities/t_user_timeline.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/models/t_user_timeline_list.freezed.dart';
part '../../generated/src/domain/models/t_user_timeline_list.g.dart';

@freezed
@JsonSerializable()
class TUserTimelineList with _$TUserTimelineList {
  const TUserTimelineList(this.tUserTimelines);

  factory TUserTimelineList.fromJson(List<Map<String, dynamic>> json) => _$TUserTimelineListFromJson({'tUserTimelines': json});

  static const empty = TUserTimelineList([]);

  @override
  final List<TUserTimeline> tUserTimelines;
}

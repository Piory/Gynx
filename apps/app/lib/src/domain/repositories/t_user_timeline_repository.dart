import 'package:app/src/domain/entities/t_user_timeline.dart';
import 'package:app/src/domain/enums/timeline_type.dart';
import 'package:app/src/domain/models/t_user_timeline_list.dart';

abstract interface class TUserTimelineRepository {
  Future<void> create(TUserTimeline tUserTimeline);

  Future<TUserTimeline> findByPrimaryKey(String id);

  Future<TUserTimelineList> findByUserIdAndType(
    String userId,
    TimelineType type,
  );
}

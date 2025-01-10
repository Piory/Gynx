import 'package:gynx_app/src/domain/entities/t_user_timeline.dart';
import 'package:gynx_app/src/domain/enums/timeline_type.dart';
import 'package:gynx_app/src/domain/models/t_user_timeline_list.dart';

abstract interface class TUserTimelineRepository {
  Future<void> create(TUserTimeline tUserTimeline);

  Future<TUserTimeline> findByPrimaryKey(String id);

  Future<TUserTimelineList> findByUserIdAndType(
    String userId,
    TimelineType type,
  );
}

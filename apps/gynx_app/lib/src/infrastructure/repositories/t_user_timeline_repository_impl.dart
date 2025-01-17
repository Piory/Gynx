import 'package:gynx_app/src/domain/entities/t_user_timeline.dart';
import 'package:gynx_app/src/domain/enums/timeline_type.dart';
import 'package:gynx_app/src/domain/models/t_user_timeline_list.dart';
import 'package:gynx_app/src/domain/repositories/t_user_timeline_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Singleton(as: TUserTimelineRepository)
class TUserTimelineRepositoryImpl implements TUserTimelineRepository {
  const TUserTimelineRepositoryImpl(this._client);

  final SupabaseClient _client;
  static const tableName = 't_user_timelines';

  @override
  Future<void> create(TUserTimeline tUserTimeline) async {
    await _client.from(tableName).insert(tUserTimeline.toJson());
  }

  @override
  Future<TUserTimeline> findByPrimaryKey(String id) async {
    final res = await _client.from(tableName).select().eq('id', id).single();
    return TUserTimeline.fromJson(res);
  }

  @override
  Future<TUserTimelineList> findByUserIdAndType(
    String userId,
    TimelineType type,
  ) async {
    final res = await _client
        .from(tableName)
        .select()
        .eq('user_id', userId)
        .eq('type', type);
    return TUserTimelineList.fromJson(res);
  }
}

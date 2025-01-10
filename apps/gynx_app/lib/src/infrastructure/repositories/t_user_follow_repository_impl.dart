import 'package:gynx_app/src/domain/entities/t_user_follow.dart';
import 'package:gynx_app/src/domain/models/t_user_follow_list.dart';
import 'package:gynx_app/src/domain/repositories/t_user_follow_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Singleton(as: TUserFollowRepository)
class TUserFollowRepositoryImpl implements TUserFollowRepository {
  const TUserFollowRepositoryImpl(this._client);

  final SupabaseClient _client;
  static const tableName = 't_user_follows';

  @override
  Future<void> create(TUserFollow tUserFollow) async {
    await _client.from(tableName).insert(tUserFollow.toJson());
  }

  @override
  Future<TUserFollow> findByPrimaryKey(int id) async {
    final res =
        await _client.from(tableName).select().eq('id', id).maybeSingle();
    return TUserFollow.fromJson(res!);
  }

  @override
  Future<TUserFollowList> findByUserId(String userId) async {
    final res = await _client.from(tableName).select().eq('user_id', userId);
    return TUserFollowList.fromIterator(res.iterator);
  }

  @override
  Future<TUserFollowList> findByFollowUserId(String followUserId) async {
    final res = await _client
        .from(tableName)
        .select()
        .eq('follow_user_id', followUserId);
    return TUserFollowList.fromIterator(res.iterator);
  }
}

import 'package:gynx_app/src/domain/entities/t_user_post_favorite.dart';
import 'package:gynx_app/src/domain/models/t_user_post_favorite_list.dart';
import 'package:gynx_app/src/domain/repositories/t_user_post_favorite_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: TUserPostFavoriteRepository)
class TUserPostFavoriteRepositoryImpl implements TUserPostFavoriteRepository {
  const TUserPostFavoriteRepositoryImpl(this._client);

  final SupabaseClient _client;
  static const tableName = 't_user_post_favorites';

  @override
  Future<void> create(TUserPostFavorite tPost) async {
    await _client.from(tableName).insert(tPost.toJson());
  }

  @override
  Future<TUserPostFavorite> findByPrimaryKey(String id) async {
    final res = await _client.from(tableName).select().eq('id', id).single();
    return TUserPostFavorite.fromJson(res);
  }

  @override
  Future<TUserPostFavoriteList> findByUserId(String userId) async {
    final res = await _client.from(tableName).select().eq('user_id', userId);
    return TUserPostFavoriteList.fromJson(res);
  }

  @override
  Future<TUserPostFavoriteList> findByPostId(int postId) async {
    final res = await _client.from(tableName).select().eq('post_id', postId);
    return TUserPostFavoriteList.fromJson(res);
  }

  @override
  Future<TUserPostFavoriteList> findByUserIdAndLatest(
    String userId,
    int count,
  ) async {
    final res = await _client
        .from(tableName)
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false)
        .limit(count);
    return TUserPostFavoriteList.fromJson(res);
  }

  @override
  Future<TUserPostFavoriteList> findByUserIdAndLatestAt(
    String userId,
    DateTime sinceAt,
    int count,
  ) async {
    final res = await _client
        .from(tableName)
        .select()
        .eq('user_id', userId)
        .gt('created_at', sinceAt.toIso8601String())
        .order('created_at', ascending: true)
        .limit(count);
    return TUserPostFavoriteList.fromJson(res);
  }

  @override
  Future<TUserPostFavoriteList> findByUserIdAndOldestAt(
    String userId,
    DateTime maxAt,
    int count,
  ) async {
    final res = await _client
        .from(tableName)
        .select()
        .eq('user_id', userId)
        .lt('created_at', maxAt.toIso8601String())
        .order('created_at', ascending: false)
        .limit(count);
    return TUserPostFavoriteList.fromJson(res);
  }
}

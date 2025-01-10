import 'package:gynx_app/src/domain/entities/t_user_post_favorite.dart';
import 'package:gynx_app/src/domain/models/t_user_post_favorite_list.dart';
import 'package:gynx_app/src/domain/repositories/t_user_post_favorite_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Singleton(as: TUserPostFavoriteRepository)
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
    final res =
        await _client.from(tableName).select().eq('id', id).maybeSingle();
    return TUserPostFavorite.fromJson(res!);
  }

  @override
  Future<TUserPostFavoriteList> findByUserId(String userId) async {
    final res = await _client.from(tableName).select().eq('user_id', userId);
    return TUserPostFavoriteList.fromIterator(res.iterator);
  }

  @override
  Future<TUserPostFavoriteList> findByPostId(int postId) async {
    final res = await _client.from(tableName).select().eq('post_id', postId);
    return TUserPostFavoriteList.fromIterator(res.iterator);
  }
}

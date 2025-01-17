import 'package:gynx_app/src/domain/entities/t_post.dart';
import 'package:gynx_app/src/domain/models/t_post_list.dart';
import 'package:gynx_app/src/domain/repositories/t_post_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Singleton(as: TPostRepository)
class TPostRepositoryImpl implements TPostRepository {
  const TPostRepositoryImpl(this._client);

  final SupabaseClient _client;
  static const tableName = 't_posts';

  @override
  Future<void> create(TPost tPost) async {
    await _client.from(tableName).insert(tPost.toJson());
  }

  @override
  Future<TPost> findByPrimaryKey(num id) async {
    final res = await _client.from(tableName).select().eq('id', id).single();
    return TPost.fromJson(res);
  }

  @override
  Future<TPostList> findByUserId(String userId) async {
    final res = await _client.from(tableName).select().eq('user_id', userId);
    return TPostList.fromJson(res);
  }
}

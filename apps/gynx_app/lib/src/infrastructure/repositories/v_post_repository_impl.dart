import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/domain/models/v_post_list.dart';
import 'package:gynx_app/src/domain/repositories/v_post_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Singleton(as: VPostRepository)
class VPostRepositoryImpl implements VPostRepository {
  const VPostRepositoryImpl(this._client);

  final SupabaseClient _client;
  static const viewName = 'v_posts';

  @override
  Future<VPost> findByPostId(int postId) async {
    final res =
        await _client.from(viewName).select().eq('post_id', postId).single();
    return VPost.fromJson(res);
  }

  @override
  Future<VPostList> findBySincePostId(int sincePostId, int count) async {
    final res = await _client
        .from(viewName)
        .select()
        .gt('post_id', sincePostId)
        .limit(count);
    return VPostList.fromJson(res);
  }

  @override
  Future<VPostList> findByMaxPostId(int maxPostId, int count) async {
    final res = await _client
        .from(viewName)
        .select()
        .lt('post_id', maxPostId)
        .limit(count);
    return VPostList.fromJson(res);
  }
}

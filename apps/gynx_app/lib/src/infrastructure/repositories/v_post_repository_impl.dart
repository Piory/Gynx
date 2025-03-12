import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/domain/models/post_id_list.dart';
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
  Future<VPost> findByPostId(
    int postId,
  ) async {
    final res =
        await _client.from(viewName).select().eq('post_id', postId).single();
    return VPost.fromJson(res);
  }

  @override
  Future<VPostList> findByPostIdList(
    PostIdList postIdList,
  ) async {
    final res = await _client
        .from(viewName)
        .select()
        .inFilter('post_id', postIdList.postIds);
    return VPostList.fromJson(res);
  }

  @override
  Future<VPostList> findByLatest(
    int count,
  ) async {
    final res = await _client
        .from(viewName)
        .select()
        .order('post_id', ascending: false)
        .limit(count);
    return VPostList.fromJson(res);
  }

  @override
  Future<VPostList> findBySincePostId(
    int sincePostId,
    int count,
  ) async {
    final res = await _client
        .from(viewName)
        .select()
        .gt('post_id', sincePostId)
        .order('post_id', ascending: true)
        .limit(count);
    return VPostList.fromJson(res);
  }

  @override
  Future<VPostList> findByMaxPostId(
    int maxPostId,
    int count,
  ) async {
    final res = await _client
        .from(viewName)
        .select()
        .lt('post_id', maxPostId)
        .order('post_id', ascending: false)
        .limit(count);
    return VPostList.fromJson(res);
  }

  @override
  Future<VPostList> findByUserIdAndLatest(
    String userId,
    int count,
  ) async {
    final res = await _client
        .from(viewName)
        .select()
        .eq('user_id', userId)
        .order('post_id', ascending: false)
        .limit(count);
    return VPostList.fromJson(res);
  }

  @override
  Future<VPostList> findByUserIdAndSincePostId(
    String userId,
    int sincePostId,
    int count,
  ) async {
    final res = await _client
        .from(viewName)
        .select()
        .gt('post_id', sincePostId)
        .eq('user_id', userId)
        .order('post_id', ascending: true)
        .limit(count);
    return VPostList.fromJson(res);
  }

  @override
  Future<VPostList> findByUserIdAndMaxPostId(
    String userId,
    int maxPostId,
    int count,
  ) async {
    final res = await _client
        .from(viewName)
        .select()
        .lt('post_id', maxPostId)
        .eq('user_id', userId)
        .order('post_id', ascending: false)
        .limit(count);
    return VPostList.fromJson(res);
  }
}

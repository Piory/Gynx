import 'package:gynx_app/src/domain/entities/t_post_media.dart';
import 'package:gynx_app/src/domain/models/t_post_media_list.dart';
import 'package:gynx_app/src/domain/repositories/t_post_media_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: TPostMediaRepository)
class TPostMediaRepositoryImpl implements TPostMediaRepository {
  const TPostMediaRepositoryImpl(this._client);

  final SupabaseClient _client;
  static const tableName = 't_post_medias';

  @override
  Future<void> create(TPostMedia tPost) async {
    await _client.from(tableName).insert(tPost.toJson());
  }

  @override
  Future<TPostMedia> findByPrimaryKey(String id) async {
    final res = await _client.from(tableName).select().eq('id', id).single();
    return TPostMedia.fromJson(res);
  }

  @override
  Future<TPostMediaList> findByPostId(int postId) async {
    final res = await _client.from(tableName).select().eq('post_id', postId);
    return TPostMediaList.fromJson(res);
  }
}

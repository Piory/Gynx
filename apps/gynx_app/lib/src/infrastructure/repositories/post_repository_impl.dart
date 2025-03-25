import 'package:gynx_app/src/domain/enums/timeline_type.dart';
import 'package:gynx_app/src/domain/models/media_list.dart';
import 'package:gynx_app/src/domain/repositories/post_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  const PostRepositoryImpl(
    this._client,
  );

  final SupabaseClient _client;

  @override
  Future<int> create(
    String userId,
    TimelineType timelineType,
    String text,
    MediaList mediaList,
  ) async {
    return await _client.rpc<int>(
      'create_post',
      params: {
        'post_user_id': userId,
        'timeline_type': timelineType.name,
        'text': text,
        'medias': mediaList.map((media) {
          return {
            'type': media.type.name,
            'url': media.url,
          };
        }).toList(),
      },
    );
  }
}

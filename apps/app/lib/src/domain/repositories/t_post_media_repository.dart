import 'package:app/src/domain/entities/t_post_media.dart';
import 'package:app/src/domain/models/t_post_media_list.dart';

abstract interface class TPostMediaRepository {
  Future<void> create(TPostMedia tPostMedia);

  Future<TPostMedia> findByPrimaryKey(String id);

  Future<TPostMediaList> findByPostId(int postId);
}

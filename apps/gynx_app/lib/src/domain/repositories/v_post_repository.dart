import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/domain/models/v_post_list.dart';

abstract interface class VPostRepository {
  Future<VPost> findByPostId(int postId);
  Future<VPostList> findBySincePostId(int sincePostId, int count);
  Future<VPostList> findByMaxPostId(int maxPostId, int count);
}

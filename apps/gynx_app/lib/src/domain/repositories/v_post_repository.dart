import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/domain/models/post_id_list.dart';
import 'package:gynx_app/src/domain/models/v_post_list.dart';

abstract interface class VPostRepository {
  Future<VPost> findByPostId(
    int postId,
  );

  Future<VPostList> findByPostIdList(
    PostIdList postIdList,
  );

  Future<VPostList> findByLatest(
    int count,
  );

  Future<VPostList> findBySincePostId(
    int sincePostId,
    int count,
  );

  Future<VPostList> findByMaxPostId(
    int maxPostId,
    int count,
  );

  Future<VPostList> findByUserIdAndLatest(
    String userId,
    int count,
  );

  Future<VPostList> findByUserIdAndSincePostId(
    String userId,
    int sincePostId,
    int count,
  );

  Future<VPostList> findByUserIdAndMaxPostId(
    String userId,
    int maxPostId,
    int count,
  );
}

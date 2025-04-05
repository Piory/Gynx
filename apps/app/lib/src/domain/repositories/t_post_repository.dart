import 'package:app/src/domain/entities/t_post.dart';
import 'package:app/src/domain/models/t_post_list.dart';

abstract interface class TPostRepository {
  Future<void> create(TPost tPost);

  Future<TPost> findByPrimaryKey(int id);

  Future<TPostList> findByUserId(String userId);
}

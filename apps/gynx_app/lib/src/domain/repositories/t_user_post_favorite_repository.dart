import 'package:gynx_app/src/domain/entities/t_user_post_favorite.dart';
import 'package:gynx_app/src/domain/models/t_user_post_favorite_list.dart';

abstract interface class TUserPostFavoriteRepository {
  Future<void> create({
    required String userId,
    required int postId,
  });

  Future<TUserPostFavorite> findByPrimaryKey(
    String id,
  );

  Future<TUserPostFavorite?> findByUniqueKey(
    String userId,
    int postId,
  );

  Future<TUserPostFavoriteList> findByUserId(
    String userId,
  );

  Future<TUserPostFavoriteList> findByPostId(
    int postId,
  );

  Future<TUserPostFavoriteList> findByUserIdAndLatest(
    String userId,
    int count,
  );

  Future<TUserPostFavoriteList> findByUserIdAndLatestAt(
    String userId,
    DateTime latestAt,
    int count,
  );

  Future<TUserPostFavoriteList> findByUserIdAndOldestAt(
    String userId,
    DateTime oldestAt,
    int count,
  );

  Future<void> deleteByUniqueKey(
    String userId,
    int postId,
  );
}

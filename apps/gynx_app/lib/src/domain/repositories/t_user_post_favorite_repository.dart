import 'package:gynx_app/src/domain/entities/t_user_post_favorite.dart';
import 'package:gynx_app/src/domain/models/t_user_post_favorite_list.dart';

abstract interface class TUserPostFavoriteRepository {
  Future<void> create(TUserPostFavorite tPostFavorite);

  Future<TUserPostFavorite> findByPrimaryKey(String id);

  Future<TUserPostFavoriteList> findByUserId(String userId);

  Future<TUserPostFavoriteList> findByPostId(int postId);
}

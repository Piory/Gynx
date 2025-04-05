import 'package:app/src/domain/entities/t_user_follow.dart';
import 'package:app/src/domain/models/t_user_follow_list.dart';

abstract interface class TUserFollowRepository {
  Future<void> create(TUserFollow tUserFollow);

  Future<TUserFollow> findByPrimaryKey(int id);

  Future<TUserFollowList> findByUserId(String userId);

  Future<TUserFollowList> findByFollowUserId(String followUserId);
}

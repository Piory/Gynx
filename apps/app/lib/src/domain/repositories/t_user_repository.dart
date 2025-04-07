import 'package:app/src/domain/entities/t_user.dart';

abstract interface class TUserRepository {
  Future<TUser> findByPrimaryKey(String id);

  Future<TUser> findByScreenName(String screenName);

  Future<bool> existsByScreenName(String screenName);

  Future<void> updateByPrimaryKey({
    required String id,
    required String screenName,
  });
}

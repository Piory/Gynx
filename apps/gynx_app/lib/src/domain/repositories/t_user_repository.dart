import 'package:gynx_app/src/domain/entities/t_user.dart';

abstract interface class TUserRepository {
  Future<TUser> findByPrimaryKey(String id);

  Future<TUser> findByGynxId(String gynxId);

  Future<void> updateByPrimaryKey({
    required String id,
    required String gynxId,
  });
}

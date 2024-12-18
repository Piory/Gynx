import 'package:gynx_app/src/domain/entities/t_user.dart';

abstract interface class TUserRepository {
  Future<void> update(TUser tUser);

  Future<TUser> findById(String id);

  Future<TUser> findByGynxId(String gynxId);
}

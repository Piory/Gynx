import 'package:gynx_app/src/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<void> create(User user);

  Future<void> update(User user);

  Future<User> findById(String id);

  Future<User> findByAuthUserId(String authUserId);
}

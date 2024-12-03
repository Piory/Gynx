import 'package:gynx_core/src/domain/entities/user.dart';
import 'package:gynx_core/src/domain/repositories/user_reposirory.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this._client);

  final SupabaseClient _client;
  static const _tableName = 't_users';

  @override
  Future<void> create(User user) async {
    await _client.from(_tableName).insert(user.toJson());
  }

  @override
  Future<void> update(User user) async {
    await _client.from(_tableName).update(user.toJson());
  }

  @override
  Future<User> findById(String id) async {
    final res = await _client.from(_tableName).select().eq('id', id);
    return User.fromJson(res.single);
  }

  @override
  Future<User> findByAuthUserId(String authUserId) async {
    final res =
        await _client.from(_tableName).select().eq('auth_user_id', authUserId);
    return User.fromJson(res.single);
  }
}

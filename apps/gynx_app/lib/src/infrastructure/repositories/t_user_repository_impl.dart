import 'package:gynx_app/src/domain/entities/t_user.dart';
import 'package:gynx_app/src/domain/repositories/t_user_reposirory.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

@Singleton(as: TUserRepository)
class TUserRepositoryImpl implements TUserRepository {
  const TUserRepositoryImpl(this._client);

  final SupabaseClient _client;
  static const tableName = 't_users';

  @override
  Future<void> update(TUser tUser) async {
    await _client.from(tableName).update(tUser.toJson());
  }

  @override
  Future<TUser> findById(String id) async {
    final res = await _client.from(tableName).select().eq('id', id);
    return TUser.fromJson(res.single);
  }

  @override
  Future<TUser> findByGynxId(String gynxId) async {
    final res = await _client.from(tableName).select().eq('gynx_id', gynxId);
    return TUser.fromJson(res.single);
  }
}

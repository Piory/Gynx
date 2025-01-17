import 'package:gynx_app/src/domain/entities/t_user.dart';
import 'package:gynx_app/src/domain/repositories/t_user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

@Singleton(as: TUserRepository)
class TUserRepositoryImpl implements TUserRepository {
  const TUserRepositoryImpl(this._client);

  final SupabaseClient _client;
  static const tableName = 't_users';

  @override
  Future<TUser> findByPrimaryKey(String id) async {
    final res = await _client.from(tableName).select().eq('id', id).single();
    return TUser.fromJson(res);
  }

  @override
  Future<TUser> findByGynxId(String gynxId) async {
    final res =
        await _client.from(tableName).select().eq('gynx_id', gynxId).single();
    return TUser.fromJson(res);
  }

  @override
  Future<bool> existsById(String gynxId) async {
    final res = await _client
        .from(tableName)
        .select('gynx_id')
        .eq('gynx_id', gynxId)
        .maybeSingle();
    return res != null;
  }

  @override
  Future<void> updateByPrimaryKey({
    required String id,
    required String gynxId,
  }) async {
    await _client.from(tableName).update({
      'gynx_id': gynxId,
    }).eq('id', id);
  }
}

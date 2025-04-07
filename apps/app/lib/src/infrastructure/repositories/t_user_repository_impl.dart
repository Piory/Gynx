import 'package:app/src/domain/entities/t_user.dart';
import 'package:app/src/domain/repositories/t_user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

@LazySingleton(as: TUserRepository)
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
  Future<TUser> findByScreenName(String screenName) async {
    final res = await _client.from(tableName).select().eq('screen_name', screenName).single();
    return TUser.fromJson(res);
  }

  @override
  Future<bool> existsByScreenName(String screenName) async {
    final res = await _client.from(tableName).select('screen_name').eq('screen_name', screenName).maybeSingle();
    return res != null;
  }

  @override
  Future<void> updateByPrimaryKey({
    required String id,
    required String screenName,
  }) async {
    await _client.from(tableName).update({
      'screen_name': screenName,
    }).eq('id', id);
  }
}

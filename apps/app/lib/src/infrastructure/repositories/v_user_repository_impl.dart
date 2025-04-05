import 'package:app/src/domain/entities/v_user.dart';
import 'package:app/src/domain/repositories/v_user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: VUserRepository)
class VUserRepositoryImpl implements VUserRepository {
  const VUserRepositoryImpl(this._client);

  final SupabaseClient _client;
  static const viewName = 'v_users';

  @override
  Future<VUser> findByUserId(String userId) async {
    final res = await _client.from(viewName).select().eq('user_id', userId).single();
    return VUser.fromJson(res);
  }

  @override
  Future<VUser> findByGynxId(String gynxId) async {
    final res = await _client.from(viewName).select().eq('gynx_id', gynxId).single();
    return VUser.fromJson(res);
  }
}

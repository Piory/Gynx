import 'package:gynx_app/src/domain/entities/t_user_profile.dart';
import 'package:gynx_app/src/domain/repositories/t_user_profile_reposirory.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

@Singleton(as: TUserProfileRepository)
class TUserProfileRepositoryImpl implements TUserProfileRepository {
  const TUserProfileRepositoryImpl(this._client);

  final SupabaseClient _client;
  static const tableName = 't_user_profiles';

  @override
  Future<void> update(TUserProfile tUserProfile) async {
    await _client.from(tableName).update(tUserProfile.toJson());
  }

  @override
  Future<TUserProfile> findByUserId(String userId) async {
    final res = await _client.from(tableName).select().eq('user_id', userId);
    return TUserProfile.fromJson(res.single);
  }
}

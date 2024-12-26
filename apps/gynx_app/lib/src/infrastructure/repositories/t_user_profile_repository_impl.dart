import 'package:gynx_app/src/domain/entities/t_user_profile.dart';
import 'package:gynx_app/src/domain/repositories/t_user_profile_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

@Singleton(as: TUserProfileRepository)
class TUserProfileRepositoryImpl implements TUserProfileRepository {
  const TUserProfileRepositoryImpl(this._client);

  final SupabaseClient _client;
  static const tableName = 't_user_profiles';

  @override
  Future<TUserProfile> findByPrimaryKey(String userId) async {
    final res = await _client.from(tableName).select().eq('user_id', userId);
    return TUserProfile.fromJson(res.single);
  }

  @override
  Future<void> updateByPrimaryKeySelective({
    required String userId,
    required String? username,
    required String? avatarUrl,
    bool isDeleteAvatarUrl = false,
    required String? selfIntroduction,
  }) async {
    final updateMap = <String, dynamic>{};
    if (username != null) {
      updateMap['username'] = username;
    }
    if (isDeleteAvatarUrl) {
      updateMap['avatar_url'] = null;
    } else if (avatarUrl != null) {
      updateMap['avatar_url'] = avatarUrl;
    }
    if (selfIntroduction != null) {
      updateMap['self_introduction'] = selfIntroduction;
    }
    await _client.from(tableName).update(updateMap).eq('user_id', userId);
  }
}

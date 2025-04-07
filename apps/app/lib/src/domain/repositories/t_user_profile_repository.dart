import 'package:app/src/domain/entities/t_user_profile.dart';

abstract interface class TUserProfileRepository {
  Future<TUserProfile> findByPrimaryKey(String userId);

  Future<void> updateByPrimaryKeySelective({
    required String userId,
    required String? displayName,
    required String? avatarUrl,
    bool isDeleteAvatarUrl = false,
    required String? selfIntroduction,
  });
}

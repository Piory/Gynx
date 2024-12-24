import 'package:gynx_app/src/domain/entities/t_user_profile.dart';

abstract interface class TUserProfileRepository {
  Future<TUserProfile> findByPrimaryKey(String userId);

  Future<void> updateByPrimaryKeySelective({
    required String userId,
    required String? username,
    required String? avatarUrl,
    required bool isDeleteAvatarUrl,
    required String? selfIntroduction,
  });
}

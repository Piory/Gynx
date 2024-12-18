import 'package:gynx_app/src/domain/entities/t_user_profile.dart';

abstract interface class TUserProfileRepository {
  Future<void> update(TUserProfile tUserProfile);

  Future<TUserProfile> findByUserId(String userId);
}

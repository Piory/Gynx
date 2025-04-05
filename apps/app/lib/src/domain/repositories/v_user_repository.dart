import 'package:app/src/domain/entities/v_user.dart';

abstract interface class VUserRepository {
  Future<VUser> findByUserId(String userId);
  Future<VUser> findByGynxId(String gynxId);
}

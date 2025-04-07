import 'package:app/src/domain/entities/v_user_detail.dart';

abstract interface class VUserDetailRepository {
  Future<VUserDetail> findByUserId(String userId);
  Future<VUserDetail> findByScreenName(String screenName);
}

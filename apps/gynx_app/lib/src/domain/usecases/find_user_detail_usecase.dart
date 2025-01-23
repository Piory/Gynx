// ignore_for_file: one_member_abstracts

import 'package:gynx_app/src/domain/entities/v_user_detail.dart';

abstract interface class FindUserDetailUseCase {
  Future<VUserDetail> execute(String userId);
}

// ignore_for_file: one_member_abstracts

import 'package:app/src/domain/entities/v_user.dart';

abstract interface class FindUserUseCase {
  Future<VUser> execute(String userId);
}

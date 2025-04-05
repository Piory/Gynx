// ignore_for_file: one_member_abstracts

import 'package:app/src/domain/models/suite_user.dart';

abstract interface class SuiteUserUseCase {
  Future<SuiteUser> execute();
}

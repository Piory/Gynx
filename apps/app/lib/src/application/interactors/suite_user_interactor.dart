import 'dart:async';

import 'package:app/src/domain/exceptions/user_not_signed_in_exception.dart';
import 'package:app/src/domain/models/suite_user.dart';
import 'package:app/src/domain/repositories/auth_repository.dart';
import 'package:app/src/domain/repositories/v_user_detail_repository.dart';
import 'package:app/src/domain/usecases/suite_user_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SuiteUserUseCase)
class SuiteUserInteractor implements SuiteUserUseCase {
  const SuiteUserInteractor(
    this._authRepository,
    this._vUserDetailRepository,
  );

  final AuthRepository _authRepository;
  final VUserDetailRepository _vUserDetailRepository;

  @override
  Future<SuiteUser> execute() async {
    final userId = _authRepository.currentUser?.id;
    if (userId == null) {
      throw const UserNotSignedInException();
    }
    return SuiteUser(
      vUserDetail: await _vUserDetailRepository.findByUserId(userId),
    );
  }
}

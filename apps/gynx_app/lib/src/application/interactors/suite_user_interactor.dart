import 'dart:async';

import 'package:gynx_app/src/domain/exceptions/user_not_signed_in_exception.dart';
import 'package:gynx_app/src/domain/models/suite_user.dart';
import 'package:gynx_app/src/domain/repositories/auth_repository.dart';
import 'package:gynx_app/src/domain/repositories/t_user_profile_repository.dart';
import 'package:gynx_app/src/domain/repositories/t_user_repository.dart';
import 'package:gynx_app/src/domain/usecases/suite_user_usecase.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: SuiteUserUseCase)
class SuiteUserInteractor implements SuiteUserUseCase {
  const SuiteUserInteractor(
    this._authRepository,
    this._tUserRepository,
    this._tUserProfileRepository,
  );

  final AuthRepository _authRepository;
  final TUserRepository _tUserRepository;
  final TUserProfileRepository _tUserProfileRepository;

  @override
  Future<SuiteUser> execute() async {
    final userId = _authRepository.currentUser?.id;
    if (userId == null) {
      throw const UserNotSignedInException();
    }
    return SuiteUser(
      tUser: await _tUserRepository.findByPrimaryKey(userId),
      tUserProfile: await _tUserProfileRepository.findByPrimaryKey(userId),
    );
  }
}

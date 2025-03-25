import 'dart:async';

import 'package:gynx_app/src/domain/repositories/auth_repository.dart';
import 'package:gynx_app/src/domain/usecases/sign_out_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SignOutUseCase)
class SignOutInteractor implements SignOutUseCase {
  const SignOutInteractor(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<void> execute() async {
    await _authRepository.signOut();
  }
}

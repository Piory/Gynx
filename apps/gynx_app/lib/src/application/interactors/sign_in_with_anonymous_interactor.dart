import 'dart:async';

import 'package:gynx_app/src/domain/repositories/auth_repository.dart';
import 'package:gynx_app/src/domain/usecases/sign_in_with_anonymous_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SignInWithAnonymousUseCase)
class SignInWithAnonymousInteractor implements SignInWithAnonymousUseCase {
  const SignInWithAnonymousInteractor(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<void> execute() async {
    try {
      await _authRepository.signInWithAnonymous();
    } on Exception catch (_) {
      await _authRepository.signOut();
      rethrow;
    }
  }
}

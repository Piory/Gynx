import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_core/src/application/usecase/params/sign_in_param.dart';
import 'package:gynx_core/src/domain/repositories/auth_reposirory.dart';

class SignInInteractor extends CompletableUseCase<SignInParam> {
  SignInInteractor(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Stream<void>> buildUseCaseStream(SignInParam? params) async {
    final streamController = StreamController<void>();
    try {
      await _authRepository.signIn(
        email: params!.email,
        password: params.password,
      );
      logger.finest('Sign in successful interactor');
      streamController.close();
    } on Exception catch (e) {
      logger.severe('Sign in failed', e);
      streamController.addError(e);
    }
    return streamController.stream;
  }
}

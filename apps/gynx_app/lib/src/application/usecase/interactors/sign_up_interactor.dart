import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_app/src/application/usecase/params/sign_up_param.dart';
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart';
import 'package:injectable/injectable.dart';

@singleton
class SignUpInteractor extends CompletableUseCase<SignUpParam> {
  SignUpInteractor(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Stream<void>> buildUseCaseStream(SignUpParam? params) async {
    final streamController = StreamController<void>();
    try {
      await _authRepository.signUp(
        email: params!.email,
        password: params.password,
      );
      unawaited(streamController.close());
    } on Exception catch (e) {
      streamController.addError(e);
    }
    return streamController.stream;
  }
}

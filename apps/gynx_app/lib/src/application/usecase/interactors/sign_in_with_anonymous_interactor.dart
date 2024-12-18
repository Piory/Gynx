import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart';
import 'package:injectable/injectable.dart';

@singleton
class SignInWithAnonymousInteractor extends CompletableUseCase<void> {
  SignInWithAnonymousInteractor(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Stream<void>> buildUseCaseStream(void params) async {
    final streamController = StreamController<void>();
    try {
      await _authRepository.signInWithAnonymous();
      unawaited(streamController.close());
    } on Exception catch (e) {
      await _authRepository.signOut();
      streamController.addError(e);
    }
    return streamController.stream;
  }
}

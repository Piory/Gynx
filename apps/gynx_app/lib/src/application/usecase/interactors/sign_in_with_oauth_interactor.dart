import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_app/src/application/usecase/params/sign_in_with_oauth_param.dart';
import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart';
import 'package:injectable/injectable.dart';

@singleton
class SignInWithOAuthInteractor
    extends CompletableUseCase<SignInWithOAuthParam> {
  SignInWithOAuthInteractor(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Stream<void>> buildUseCaseStream(SignInWithOAuthParam? params) async {
    final streamController = StreamController<void>();
    try {
      final providerType = params!.oauthProviderType;
      switch (providerType) {
        case OAuthProviderType.apple:
          await _authRepository.signInWithApple();
        case OAuthProviderType.google:
          await _authRepository.signInWithGoogle();
        case OAuthProviderType.x:
        case OAuthProviderType.twitch:
        case OAuthProviderType.discord:
          throw UnimplementedError('Unsupported provider. $providerType');
      }
      unawaited(streamController.close());
    } on Exception catch (e) {
      await _authRepository.signOut();
      streamController.addError(e);
    }
    return streamController.stream;
  }
}

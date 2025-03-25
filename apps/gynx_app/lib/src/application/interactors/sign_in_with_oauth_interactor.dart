import 'dart:async';

import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';
import 'package:gynx_app/src/domain/repositories/auth_repository.dart';
import 'package:gynx_app/src/domain/usecases/sign_in_with_oauth_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SignInWithOAuthUseCase)
class SignInWithOAuthInteractor implements SignInWithOAuthUseCase {
  const SignInWithOAuthInteractor(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<void> execute(OAuthProviderType oAuthProviderType) async {
    try {
      switch (oAuthProviderType) {
        case OAuthProviderType.apple:
          await _authRepository.signInWithApple();
        case OAuthProviderType.google:
          await _authRepository.signInWithGoogle();
        case OAuthProviderType.x:
        case OAuthProviderType.twitch:
        case OAuthProviderType.discord:
          throw UnimplementedError('Unsupported provider. $oAuthProviderType');
      }
    } on Exception catch (_) {
      await _authRepository.signOut();
      rethrow;
    }
  }
}

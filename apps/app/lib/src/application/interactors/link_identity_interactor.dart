import 'package:app/src/domain/enums/oauth_provider_type.dart';
import 'package:app/src/domain/repositories/auth_repository.dart';
import 'package:app/src/domain/usecases/link_identity_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LinkIdentityUseCase)
class LinkIdentityInteractor implements LinkIdentityUseCase {
  const LinkIdentityInteractor(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<void> execute(OAuthProviderType oauthProviderType) async {
    switch (oauthProviderType) {
      case OAuthProviderType.apple:
        await _authRepository.linkWithApple();
      case OAuthProviderType.google:
        await _authRepository.linkWithGoogle();
      case OAuthProviderType.x:
        await _authRepository.linkWithX();
      case OAuthProviderType.twitch:
        await _authRepository.linkWithTwitch();
      case OAuthProviderType.discord:
        await _authRepository.linkWithDiscord();
    }
  }
}

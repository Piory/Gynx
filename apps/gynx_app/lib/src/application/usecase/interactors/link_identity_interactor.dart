import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_app/src/application/usecase/params/link_identity_param.dart';
import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart';
import 'package:injectable/injectable.dart';

@singleton
class LinkIdentityInteractor extends CompletableUseCase<LinkIdentityParam> {
  LinkIdentityInteractor(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Stream<void>> buildUseCaseStream(LinkIdentityParam? params) async {
    final streamController = StreamController<void>();
    try {
      switch (params!.oauthProviderType) {
        case OAuthProviderType.apple:
          await _authRepository.linkWithApple();
        case OAuthProviderType.google:
          // await _authRepository.linkWithGoogle();
          await _authRepository.signInWithGoogle();
        case OAuthProviderType.x:
          await _authRepository.linkWithX();
        case OAuthProviderType.twitch:
          await _authRepository.linkWithTwitch();
        case OAuthProviderType.discord:
          await _authRepository.linkWithDiscord();
      }
      unawaited(streamController.close());
    } on Exception catch (e) {
      streamController.addError(e);
    }
    return streamController.stream;
  }
}

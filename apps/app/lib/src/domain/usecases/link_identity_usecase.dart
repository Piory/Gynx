// ignore_for_file: one_member_abstracts
import 'package:app/src/domain/enums/oauth_provider_type.dart';

abstract interface class LinkIdentityUseCase {
  Future<void> execute(OAuthProviderType oauthProviderType);
}

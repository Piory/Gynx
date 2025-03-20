import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';

part '../../../generated/src/application/usecase/params/sign_in_with_oauth_param.freezed.dart';

@freezed
class SignInWithOAuthParam with _$SignInWithOAuthParam {
  const factory SignInWithOAuthParam({
    required OAuthProviderType oauthProviderType,
  }) = _SignInWithOAuthParam;
}

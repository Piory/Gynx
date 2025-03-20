import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';

part '../../../generated/src/application/usecase/params/link_identity_param.freezed.dart';

@freezed
class LinkIdentityParam with _$LinkIdentityParam {
  const factory LinkIdentityParam({
    required OAuthProviderType oauthProviderType,
  }) = _LinkIdentityParam;
}

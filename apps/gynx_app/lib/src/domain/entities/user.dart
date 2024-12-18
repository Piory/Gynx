import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';

part '../../generated/src/domain/entities/user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String displayName,
    required String email,
    required List<OAuthProviderType> providers,
    required bool isAnonymous,
    required DateTime createdAt,
    required DateTime lastSignInAt,
  }) = _User;
}

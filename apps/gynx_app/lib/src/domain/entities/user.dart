import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';

part '../../generated/src/domain/entities/user.freezed.dart';

@freezed
class User with _$User {
  const User({
    required this.id,
    required this.displayName,
    required this.email,
    required this.providers,
    required this.isAnonymous,
    required this.createdAt,
    required this.lastSignInAt,
  });

  @override
  final String id;
  @override
  final String displayName;
  @override
  final String email;
  @override
  final List<OAuthProviderType> providers;
  @override
  final bool isAnonymous;
  @override
  final DateTime createdAt;
  @override
  final DateTime lastSignInAt;
}

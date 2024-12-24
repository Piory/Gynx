import 'package:google_sign_in/google_sign_in.dart';
import 'package:gynx_app/src/domain/entities/user.dart' as entities;
import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';
import 'package:gynx_app/src/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._client, this._googleSignIn);

  static const _redirectTo = 'com.piory.gynx.local://oauth2-callback/';

  final SupabaseClient _client;
  final GoogleSignIn _googleSignIn;

  @override
  entities.User? get currentUser {
    final auth = _client.auth;
    final currentUser = auth.currentUser;
    if (currentUser == null) {
      return null;
    }
    return entities.User(
      id: currentUser.id,
      displayName: currentUser.userMetadata!['display_name'] as String? ?? '',
      email: currentUser.email ?? '',
      providers: currentUser.identities!.map((identity) {
        switch (identity.provider) {
          case 'apple':
            return OAuthProviderType.apple;
          case 'google':
            return OAuthProviderType.google;
          case 'twitter':
            return OAuthProviderType.x;
          case 'twitch':
            return OAuthProviderType.twitch;
          case 'discord':
            return OAuthProviderType.discord;
          default:
            throw Exception('Unknown provider: ${identity.provider}');
        }
      }).toList(),
      isAnonymous: currentUser.isAnonymous,
      createdAt: DateTime.parse(currentUser.createdAt),
      lastSignInAt: DateTime.parse(currentUser.lastSignInAt!),
    );
  }

  @override
  bool isSignedIn() {
    return _client.auth.currentUser != null;
  }

  @override
  Future<void> signInWithAnonymous() async {
    final auth = _client.auth;
    await auth.signInAnonymously();
  }

  @override
  Future<void> signInWithApple() async {
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return;
    }
    final googleAuth = await googleUser.authentication;
    final idToken = googleAuth.idToken;
    if (idToken == null) {
      throw Exception('Google sign in failed. idToken is null');
    }
    final accessToken = googleAuth.accessToken;
    if (accessToken == null) {
      throw Exception('Google sign in failed. accessToken is null');
    }
    await _client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  @override
  Future<void> linkWithApple() async {
    await _client.auth.linkIdentity(
      OAuthProvider.apple,
      redirectTo: _redirectTo,
    );
  }

  @override
  Future<void> linkWithGoogle() async {
    await _client.auth.linkIdentity(
      OAuthProvider.google,
      redirectTo: _redirectTo,
      authScreenLaunchMode: LaunchMode.externalApplication,
    );
  }

  @override
  Future<void> linkWithX() async {
    await _client.auth.linkIdentity(
      OAuthProvider.twitter,
      redirectTo: _redirectTo,
      authScreenLaunchMode: LaunchMode.externalApplication,
    );
  }

  @override
  Future<void> linkWithTwitch() async {
    await _client.auth.linkIdentity(
      OAuthProvider.twitch,
      redirectTo: _redirectTo,
      authScreenLaunchMode: LaunchMode.externalApplication,
    );
  }

  @override
  Future<void> linkWithDiscord() async {
    await _client.auth.linkIdentity(
      OAuthProvider.discord,
      redirectTo: _redirectTo,
      authScreenLaunchMode: LaunchMode.externalApplication,
    );
  }

  @override
  Future<void> signOut() async {
    await _client.auth.signOut();
    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.signOut();
    }
  }
}

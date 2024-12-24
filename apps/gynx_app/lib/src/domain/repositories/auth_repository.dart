import 'package:gynx_app/src/domain/entities/user.dart';

abstract interface class AuthRepository {
  User? get currentUser;

  bool isSignedIn();

  Future<void> signInWithAnonymous();

  Future<void> signInWithApple();

  Future<void> signInWithGoogle();

  Future<void> linkWithApple();

  Future<void> linkWithGoogle();

  Future<void> linkWithX();

  Future<void> linkWithTwitch();

  Future<void> linkWithDiscord();

  Future<void> signOut();
}

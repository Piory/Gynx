abstract interface class AuthRepository {
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

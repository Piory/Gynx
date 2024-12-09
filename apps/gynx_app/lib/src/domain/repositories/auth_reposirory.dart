abstract interface class AuthRepository {
  Future<void> signUp({
    required String email,
    required String password,
  });

  Future<void> signInWithAnonymous();

  Future<void> signInWithPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
}

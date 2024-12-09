import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._client);

  final SupabaseClient _client;

  @override
  Future<void> signUp({
    required String email,
    required String password,
  }) {
    return _client.auth.signUp(email: email, password: password);
  }

  @override
  Future<void> signInWithAnonymous() async {
    final auth = _client.auth;
    await auth.signInAnonymously();
  }

  @override
  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) async {
    await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() {
    return _client.auth.signOut();
  }
}

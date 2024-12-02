import 'package:gynx_core/src/domain/repositories/auth_reposirory.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final auth = Supabase.instance.client.auth;

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl();

  @override
  Future<void> signUp({
    required String email,
    required String password,
  }) {
    return auth.signUp(email: email, password: password);
  }

  @override
  Future<void> signInWithAnonymous() async {
    await auth.signInAnonymously();
  }

  @override
  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) async {
    await auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() {
    return auth.signOut();
  }
}

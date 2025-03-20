import 'package:gynx_core/src/domain/repositories/auth_reposirory.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl();

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) {
    print('Sign in with email: $email, password: $password');
    return Future.value();
  }

  @override
  Future<void> signUp({
    required String email,
    required String password,
  }) {
    print('Sign up with email: $email, password: $password');
    return Future.value();
  }

  @override
  Future<void> signOut() {
    print('Sign out');
    return Future.value();
  }
}

import 'package:faker/faker.dart';
import 'package:gynx_core/src/infrastructure/repositories/auth_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;
import 'package:test/test.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SupabaseClient>(),
  MockSpec<GoTrueClient>(),
  MockSpec<AuthResponse>(),
])
void main() {
  final faker = Faker();
  final mockSupabaseClient = MockSupabaseClient();
  final mockGoTrueClient = MockGoTrueClient();
  final authRepository = AuthRepositoryImpl(mockSupabaseClient);

  setUp(() {
    when(mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
  });

  tearDown(() {
    verify(mockSupabaseClient.auth);
    verifyNoMoreInteractions(mockSupabaseClient);
    verifyNoMoreInteractions(mockGoTrueClient);
    reset(mockSupabaseClient);
    reset(mockGoTrueClient);
  });

  group('#signUp', () {
    group('正常系', () {
      test('GoTrueClient#signUp が呼ばれること', () async {
        final email = faker.internet.email();
        final password = faker.guid.guid();
        when(
          mockGoTrueClient.signUp(
            email: email,
            password: password,
          ),
        ).thenAnswer((_) async => MockAuthResponse());
        await authRepository.signUp(
          email: email,
          password: password,
        );
        verify(
          mockGoTrueClient.signUp(
            email: email,
            password: password,
          ),
        );
      });
    });
  });

  group('#signInWithAnonymous', () {
    group('正常系', () {
      test('GoTrueClient#signInAnonymously が呼ばれること', () async {
        when(mockGoTrueClient.signInAnonymously())
            .thenAnswer((_) async => MockAuthResponse());
        await authRepository.signInWithAnonymous();
        verify(mockGoTrueClient.signInAnonymously());
      });
    });
  });

  group('#signInWithPassword', () {
    group('正常系', () {
      test('GoTrueClient#signIn が呼ばれること', () async {
        final email = faker.internet.email();
        final password = faker.guid.guid();
        when(
          mockGoTrueClient.signInWithPassword(
            email: email,
            password: password,
          ),
        ).thenAnswer((_) async => MockAuthResponse());
        await authRepository.signInWithPassword(
          email: email,
          password: password,
        );
        verify(
          mockGoTrueClient.signInWithPassword(
            email: email,
            password: password,
          ),
        );
      });
    });
  });

  group('#signOut', () {
    group('正常系', () {
      test('GoTrueClient#signOut が呼ばれること', () async {
        when(mockGoTrueClient.signOut()).thenAnswer((_) async => {});
        await authRepository.signOut();
        verify(mockGoTrueClient.signOut());
      });
    });
  });
}

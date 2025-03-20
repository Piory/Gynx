// ignore_for_file: lines_longer_than_80_chars
import 'package:faker/faker.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gynx_app/src/infrastructure/repositories/auth_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;
import 'package:test/test.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SupabaseClient>(),
  MockSpec<GoTrueClient>(),
  MockSpec<AuthResponse>(),
  MockSpec<GoogleSignIn>(),
  MockSpec<GoogleSignInAccount>(),
  MockSpec<GoogleSignInAuthentication>(),
])
void main() {
  final mockSupabaseClient = MockSupabaseClient();
  final mockGoTrueClient = MockGoTrueClient();
  final mockGoogleSignIn = MockGoogleSignIn();
  final authRepository =
      AuthRepositoryImpl(mockSupabaseClient, mockGoogleSignIn);

  setUp(() {
    when(mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
  });

  tearDown(() {
    verify(mockSupabaseClient.auth);
    verifyNoMoreInteractions(mockSupabaseClient);
    verifyNoMoreInteractions(mockGoTrueClient);
    verifyNoMoreInteractions(mockGoogleSignIn);
    reset(mockSupabaseClient);
    reset(mockGoTrueClient);
    reset(mockGoogleSignIn);
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

  group('#signInWithGoogle', () {
    group('正常系', () {
      test(
        'GoogleSignIn#signIn の結果で取得できた、idToken, accessToken が GoTrueClient#signInWithIdToken に渡されていること',
        () async {
          final idToken = faker.guid.guid();
          final accessToken = faker.guid.guid();
          final googleSignInAccount = MockGoogleSignInAccount();
          final googleSignInAuthentication = MockGoogleSignInAuthentication();
          when(googleSignInAccount.authentication)
              .thenAnswer((_) async => googleSignInAuthentication);
          when(googleSignInAuthentication.idToken).thenReturn(idToken);
          when(googleSignInAuthentication.accessToken).thenReturn(accessToken);
          when(mockGoogleSignIn.signIn()).thenAnswer((_) async {
            return googleSignInAccount;
          });
          when(
            mockGoTrueClient.signInWithIdToken(
              provider: OAuthProvider.google,
              idToken: idToken,
              accessToken: accessToken,
            ),
          ).thenAnswer((_) async => MockAuthResponse());
          await authRepository.signInWithGoogle();
          verify(mockGoogleSignIn.signIn());
          verify(googleSignInAccount.authentication);
          verify(googleSignInAuthentication.idToken);
          verify(googleSignInAuthentication.accessToken);
          verify(
            mockGoTrueClient.signInWithIdToken(
              provider: OAuthProvider.google,
              idToken: idToken,
              accessToken: accessToken,
            ),
          );
        },
      );
    });
  });

  group(
    '#linkWithApple',
    () {
      group('正常系', () {
        test(
          'GoTrueClient#linkIdentity に OAuthProvider.apple が渡されて呼ばれること',
          () async {
            final b = faker.randomGenerator.boolean();
            when(
              mockGoTrueClient.linkIdentity(
                OAuthProvider.apple,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            ).thenAnswer((_) async => b);
            await authRepository.linkWithApple();
            verify(
              mockGoTrueClient.linkIdentity(
                OAuthProvider.apple,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            );
          },
        );
      });
    },
    skip: 'Extension である GoTrueClientSignInProvider を Mockito でモックできないためスキップ',
  );

  group(
    '#linkWithGoogle',
    () {
      group('正常系', () {
        test(
          'GoTrueClient#linkIdentity に OAuthProvider.google が渡されて呼ばれること',
          () async {
            final b = faker.randomGenerator.boolean();
            when(
              mockGoTrueClient.linkIdentity(
                OAuthProvider.google,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            ).thenAnswer((_) async => b);
            await authRepository.linkWithGoogle();
            verify(
              mockGoTrueClient.linkIdentity(
                OAuthProvider.google,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            );
          },
        );
      });
    },
    skip: 'Extension である GoTrueClientSignInProvider を Mockito でモックできないためスキップ',
  );

  group(
    '#linkWithX',
    () {
      group('正常系', () {
        test(
          'GoTrueClient#linkIdentity に OAuthProvider.twitter が渡されて呼ばれること',
          () async {
            final b = faker.randomGenerator.boolean();
            when(
              mockGoTrueClient.linkIdentity(
                OAuthProvider.twitter,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            ).thenAnswer((_) async => b);
            await authRepository.linkWithX();
            verify(
              mockGoTrueClient.linkIdentity(
                OAuthProvider.twitter,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            );
          },
        );
      });
    },
    skip: 'Extension である GoTrueClientSignInProvider を Mockito でモックできないためスキップ',
  );

  group(
    '#linkWithTwitch',
    () {
      group('正常系', () {
        test(
          'GoTrueClient#linkIdentity に OAuthProvider.twitch が渡されて呼ばれること',
          () async {
            final b = faker.randomGenerator.boolean();
            when(
              mockGoTrueClient.linkIdentity(
                OAuthProvider.twitch,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            ).thenAnswer((_) async => b);
            await authRepository.linkWithTwitch();
            verify(
              mockGoTrueClient.linkIdentity(
                OAuthProvider.twitch,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            );
          },
        );
      });
    },
    skip: 'Extension である GoTrueClientSignInProvider を Mockito でモックできないためスキップ',
  );

  group(
    '#linkWithDiscord',
    () {
      group('正常系', () {
        test(
          'GoTrueClient#linkIdentity に OAuthProvider.apple が渡されて呼ばれること',
          () async {
            final b = faker.randomGenerator.boolean();
            when(
              mockGoTrueClient.linkIdentity(
                OAuthProvider.discord,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            ).thenAnswer((_) async => b);
            await authRepository.linkWithDiscord();
            verify(
              mockGoTrueClient.linkIdentity(
                OAuthProvider.discord,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            );
          },
        );
      });
    },
    skip: 'Extension である GoTrueClientSignInProvider を Mockito でモックできないためスキップ',
  );

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

// ignore_for_file: lines_longer_than_80_chars
import 'package:faker/faker.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gynx_app/src/infrastructure/repositories/auth_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/test.dart';

import 'auth_repository_impl_test.mocks.dart';

class MockGoTrueClientWithCurrentUserMock extends MockGoTrueClient {
  MockGoTrueClientWithCurrentUserMock(this._mockCurrentUser);

  final User? _mockCurrentUser;

  @override
  User? get currentUser => _mockCurrentUser;
}

@GenerateNiceMocks([
  MockSpec<SupabaseClient>(),
  MockSpec<GoTrueClient>(),
  MockSpec<User>(),
  MockSpec<AuthResponse>(),
  MockSpec<GoogleSignIn>(),
  MockSpec<GoogleSignInAccount>(),
  MockSpec<GoogleSignInAuthentication>(),
])
void main() {
  final mockSupabaseClient = MockSupabaseClient();
  final mockGoTrueClient = MockGoTrueClient();
  final mockGoogleSignIn = MockGoogleSignIn();
  final repository = AuthRepositoryImpl(
    mockSupabaseClient,
    mockGoogleSignIn,
  );

  tearDown(() {
    verifyNoMoreInteractions(mockSupabaseClient);
    verifyNoMoreInteractions(mockGoTrueClient);
    verifyNoMoreInteractions(mockGoogleSignIn);
    reset(mockSupabaseClient);
    reset(mockGoTrueClient);
    reset(mockGoogleSignIn);
  });

  group('#isSignedIn', () {
    group('正常系', () {
      test('GoTrueClient#currentUser が null でない場合、true が返ること', () {
        final mockGoTrueClient =
            MockGoTrueClientWithCurrentUserMock(MockUser());
        when(mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
        expect(repository.isSignedIn(), isTrue);
        verify(mockSupabaseClient.auth);
      });

      test('GoTrueClient#currentUser が null の場合、false が返ること', () {
        final mockGoTrueClient = MockGoTrueClientWithCurrentUserMock(null);
        when(mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
        expect(repository.isSignedIn(), isFalse);
        verify(mockSupabaseClient.auth);
      });
    });
  });

  group('#signInWithAnonymous', () {
    group('正常系', () {
      test('GoTrueClient#signInAnonymously が呼ばれること', () async {
        when(mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
        when(mockGoTrueClient.signInAnonymously())
            .thenAnswer((_) async => MockAuthResponse());
        await repository.signInWithAnonymous();
        verifyInOrder([
          mockSupabaseClient.auth,
          mockGoTrueClient.signInAnonymously(),
        ]);
      });
    });
  });

  group('#signInWithGoogle', () {
    group('正常系', () {
      test(
        'GoogleSignIn#signIn で結果が取得できなかった場合は、それ以降なにも呼ばれないこと',
        () async {
          when(mockGoogleSignIn.signIn()).thenAnswer((_) async => null);
          await repository.signInWithGoogle();
          verify(mockGoogleSignIn.signIn());
          verifyZeroInteractions(mockSupabaseClient);
          verifyZeroInteractions(mockGoTrueClient);
        },
      );

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
          when(mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
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
          await repository.signInWithGoogle();
          verifyInOrder([
            mockGoogleSignIn.signIn(),
            googleSignInAccount.authentication,
            googleSignInAuthentication.idToken,
            googleSignInAuthentication.accessToken,
            mockSupabaseClient.auth,
            mockGoTrueClient.signInWithIdToken(
              provider: OAuthProvider.google,
              idToken: idToken,
              accessToken: accessToken,
            ),
          ]);
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
            when(mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
            final b = faker.randomGenerator.boolean();
            when(
              mockGoTrueClient.linkIdentity(
                OAuthProvider.apple,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            ).thenAnswer((_) async => b);
            await repository.linkWithApple();
            verifyInOrder([
              mockSupabaseClient.auth,
              mockGoTrueClient.linkIdentity(
                OAuthProvider.apple,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            ]);
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
            when(mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
            final b = faker.randomGenerator.boolean();
            when(
              mockGoTrueClient.linkIdentity(
                OAuthProvider.google,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            ).thenAnswer((_) async => b);
            await repository.linkWithGoogle();
            verifyInOrder([
              mockSupabaseClient.auth,
              mockGoTrueClient.linkIdentity(
                OAuthProvider.google,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            ]);
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
            when(mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
            final b = faker.randomGenerator.boolean();
            when(
              mockGoTrueClient.linkIdentity(
                OAuthProvider.twitter,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            ).thenAnswer((_) async => b);
            await repository.linkWithX();
            verifyInOrder([
              mockSupabaseClient.auth,
              mockGoTrueClient.linkIdentity(
                OAuthProvider.twitter,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            ]);
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
            when(mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
            final b = faker.randomGenerator.boolean();
            when(
              mockGoTrueClient.linkIdentity(
                OAuthProvider.twitch,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            ).thenAnswer((_) async => b);
            await repository.linkWithTwitch();
            verify(
              mockGoTrueClient.linkIdentity(
                OAuthProvider.twitch,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            );
            verifyInOrder([
              mockSupabaseClient.auth,
              mockGoTrueClient.linkIdentity(
                OAuthProvider.twitch,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            ]);
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
            when(mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
            final b = faker.randomGenerator.boolean();
            when(
              mockGoTrueClient.linkIdentity(
                OAuthProvider.discord,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            ).thenAnswer((_) async => b);
            await repository.linkWithDiscord();
            verifyInOrder([
              mockSupabaseClient.auth,
              mockGoTrueClient.linkIdentity(
                OAuthProvider.discord,
                redirectTo: 'http://localhost:3000/auth/callback',
              ),
            ]);
          },
        );
      });
    },
    skip: 'Extension である GoTrueClientSignInProvider を Mockito でモックできないためスキップ',
  );

  group('#signOut', () {
    group('正常系', () {
      test(
        'GoogleSignIn#isSignedIn で true が返ってきたら、GoTrueClient#signOut と GoogleSignIn#signOut が呼ばれること',
        () async {
          when(mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
          when(mockGoTrueClient.signOut()).thenAnswer((_) async => {});
          when(mockGoogleSignIn.isSignedIn()).thenAnswer((_) async => true);
          when(mockGoogleSignIn.signOut())
              .thenAnswer((_) async => MockGoogleSignInAccount());
          await repository.signOut();
          verifyInOrder([
            mockSupabaseClient.auth,
            mockGoTrueClient.signOut(),
            mockGoogleSignIn.isSignedIn(),
            mockGoogleSignIn.signOut(),
          ]);
        },
      );

      test(
        'GoogleSignIn#isSignedIn で false が返ってきたら、GoTrueClient#signOut のみが呼ばれること',
        () async {
          when(mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
          when(mockGoTrueClient.signOut()).thenAnswer((_) async => {});
          when(mockGoogleSignIn.isSignedIn()).thenAnswer((_) async => false);
          await repository.signOut();
          verifyInOrder([
            mockSupabaseClient.auth,
            mockGoTrueClient.signOut(),
            mockGoogleSignIn.isSignedIn(),
          ]);
          verifyNever(mockGoogleSignIn.signOut());
        },
      );
    });
  });
}

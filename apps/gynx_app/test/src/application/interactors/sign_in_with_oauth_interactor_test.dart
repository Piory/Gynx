// ignore_for_file: lines_longer_than_80_chars
import 'package:faker/faker.dart';
import 'package:gynx_app/src/application/interactors/sign_in_with_oauth_interactor.dart';
import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';
import 'package:gynx_app/src/domain/repositories/auth_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'sign_in_with_oauth_interactor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthRepository>(),
])
void main() {
  final mockAuthRepository = MockAuthRepository();
  final interactor = SignInWithOAuthInteractor(mockAuthRepository);

  tearDown(() {
    verifyNoMoreInteractions(mockAuthRepository);
    reset(mockAuthRepository);
  });

  group('正常系', () {
    test(
      'OAuthProviderType.apple を指定した場合は、AuthRepository#signInWithApple が呼ばれること',
      () async {
        when(mockAuthRepository.signInWithApple()).thenAnswer((_) async => {});
        await interactor.execute(OAuthProviderType.apple);
        verify(mockAuthRepository.signInWithApple());
      },
    );

    test(
      'OAuthProviderType.google を指定した場合は、AuthRepository#signInWithApple が呼ばれること',
      () async {
        when(mockAuthRepository.signInWithGoogle()).thenAnswer((_) async => {});
        await interactor.execute(OAuthProviderType.google);
        verify(mockAuthRepository.signInWithGoogle());
      },
    );
  });

  group('異常系', () {
    test(
      'AuthRepository#signInWithApple でエラーが発生した場合は、AuthRepository#signOut が呼ばれること',
      () async {
        final exception = Exception(faker.guid.guid());
        when(mockAuthRepository.signInWithApple()).thenThrow(exception);
        await expectLater(
          () => interactor.execute(OAuthProviderType.apple),
          throwsA(exception),
        );
        verifyInOrder([
          mockAuthRepository.signInWithApple(),
          mockAuthRepository.signOut(),
        ]);
      },
    );

    test(
      'AuthRepository#signInWithGoogle でエラーが発生した場合は、AuthRepository#signOut が呼ばれること',
      () async {
        final exception = Exception(faker.guid.guid());
        when(mockAuthRepository.signInWithGoogle()).thenThrow(exception);
        await expectLater(
          () => interactor.execute(OAuthProviderType.google),
          throwsA(exception),
        );
        verifyInOrder([
          mockAuthRepository.signInWithGoogle(),
          mockAuthRepository.signOut(),
        ]);
      },
    );

    test(
      'OAuthProviderType.x を指定した場合は、UnimplementedError が発生すること',
      () async {
        await expectLater(
          () => interactor.execute(OAuthProviderType.x),
          throwsA(isA<UnimplementedError>()),
        );
      },
    );

    test(
      'OAuthProviderType.twitch を指定した場合は、UnimplementedError が発生すること',
      () async {
        await expectLater(
          () => interactor.execute(OAuthProviderType.twitch),
          throwsA(isA<UnimplementedError>()),
        );
      },
    );

    test(
      'OAuthProviderType.discord を指定した場合は、UnimplementedError が発生すること',
      () async {
        await expectLater(
          () => interactor.execute(OAuthProviderType.discord),
          throwsA(isA<UnimplementedError>()),
        );
      },
    );
  });
}

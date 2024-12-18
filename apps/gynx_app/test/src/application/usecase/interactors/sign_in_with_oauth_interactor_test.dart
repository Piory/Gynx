import 'package:faker/faker.dart';
import 'package:gynx_app/src/application/usecase/interactors/sign_in_with_oauth_interactor.dart';
import 'package:gynx_app/src/application/usecase/params/sign_in_with_oauth_param.dart';
import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart';
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
        final stream = await interactor.buildUseCaseStream(
          const SignInWithOAuthParam(
            oauthProviderType: OAuthProviderType.apple,
          ),
        );
        var onDataCallCount = 0;
        stream.listen(
          (_) => fail('onData should not be called'),
          onError: (_) => fail('onError should not be called'),
          onDone: () => onDataCallCount++,
        );
        verify(mockAuthRepository.signInWithApple());
      },
    );

    test(
      'OAuthProviderType.google を指定した場合は、AuthRepository#signInWithApple が呼ばれること',
      () async {
        when(mockAuthRepository.signInWithGoogle()).thenAnswer((_) async => {});
        final stream = await interactor.buildUseCaseStream(
          const SignInWithOAuthParam(
            oauthProviderType: OAuthProviderType.google,
          ),
        );
        var onDataCallCount = 0;
        stream.listen(
          (_) => fail('onData should not be called'),
          onError: (_) => fail('onError should not be called'),
          onDone: () => onDataCallCount++,
        );
        verify(mockAuthRepository.signInWithGoogle());
      },
    );
  });

  group('異常系', () {
    test(
      'AuthRepository#signInWithApple でエラーが発生した場合は、onError が呼ばれること',
      () async {
        final exception = Exception(faker.guid.guid());
        when(mockAuthRepository.signInWithApple()).thenThrow(exception);
        final stream = await interactor.buildUseCaseStream(
          const SignInWithOAuthParam(
            oauthProviderType: OAuthProviderType.apple,
          ),
        );
        stream.listen(
          (_) => fail('onData should not be called'),
          onError: (dynamic e) => expect(e, exception),
          onDone: () => fail('onDone should not be called'),
        );
        verifyInOrder([
          mockAuthRepository.signInWithApple(),
          mockAuthRepository.signOut(),
        ]);
      },
    );

    test(
      'AuthRepository#signInWithGoogle でエラーが発生した場合は、onError が呼ばれること',
      () async {
        final exception = Exception(faker.guid.guid());
        when(mockAuthRepository.signInWithGoogle()).thenThrow(exception);
        final stream = await interactor.buildUseCaseStream(
          const SignInWithOAuthParam(
            oauthProviderType: OAuthProviderType.google,
          ),
        );
        stream.listen(
          (_) => fail('onData should not be called'),
          onError: (dynamic e) => expect(e, exception),
          onDone: () => fail('onDone should not be called'),
        );
        verifyInOrder([
          mockAuthRepository.signInWithGoogle(),
          mockAuthRepository.signOut(),
        ]);
      },
    );

    test(
      'OAuthProviderType.x を指定した場合は、UnimplementedError が発生すること',
      () {
        expect(
          () => interactor.buildUseCaseStream(
            const SignInWithOAuthParam(
              oauthProviderType: OAuthProviderType.x,
            ),
          ),
          throwsA(isA<UnimplementedError>()),
        );
      },
    );

    test(
      'OAuthProviderType.twitch を指定した場合は、UnimplementedError が発生すること',
      () {
        expect(
          () => interactor.buildUseCaseStream(
            const SignInWithOAuthParam(
              oauthProviderType: OAuthProviderType.twitch,
            ),
          ),
          throwsA(isA<UnimplementedError>()),
        );
      },
    );

    test(
      'OAuthProviderType.discord を指定した場合は、UnimplementedError が発生すること',
      () {
        expect(
          () => interactor.buildUseCaseStream(
            const SignInWithOAuthParam(
              oauthProviderType: OAuthProviderType.discord,
            ),
          ),
          throwsA(isA<UnimplementedError>()),
        );
      },
    );
  });
}

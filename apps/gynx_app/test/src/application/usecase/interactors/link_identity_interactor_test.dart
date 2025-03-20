import 'package:faker/faker.dart';
import 'package:gynx_app/src/application/usecase/interactors/link_identity_interactor.dart';
import 'package:gynx_app/src/application/usecase/params/link_identity_param.dart';
import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'link_identity_interactor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthRepository>(),
])
void main() {
  final mockAuthRepository = MockAuthRepository();
  final interactor = LinkIdentityInteractor(mockAuthRepository);

  tearDown(() {
    reset(mockAuthRepository);
  });

  group('${OAuthProviderType.apple} を渡した場合', () {
    const param = LinkIdentityParam(
      oauthProviderType: OAuthProviderType.apple,
    );

    group('正常系', () {
      test(
        'AuthRepository#linkWithApple が呼ばれ、onData が呼ばれること',
        () async {
          when(mockAuthRepository.linkWithApple()).thenAnswer((_) async => {});
          final stream = await interactor.buildUseCaseStream(param);
          var onDataCallCount = 0;
          stream.listen(
            (_) => fail('onData should not be called'),
            onError: (_) => fail('onError should not be called'),
            onDone: () => onDataCallCount++,
          );
          verify(mockAuthRepository.linkWithApple());
        },
      );
    });

    group('異常系', () {
      test(
        'AuthRepository#signOut でエラーが発生した場合は、onError が呼ばれること',
        () async {
          final exception = Exception(faker.guid.guid());
          when(mockAuthRepository.linkWithApple()).thenThrow(exception);
          final stream = await interactor.buildUseCaseStream(param);
          stream.listen(
            (_) => fail('onData should not be called'),
            onError: (dynamic e) => expect(e, exception),
            onDone: () => fail('onDone should not be called'),
          );
        },
      );
    });
  });

  group('${OAuthProviderType.google} を渡した場合', () {
    const param = LinkIdentityParam(
      oauthProviderType: OAuthProviderType.google,
    );

    group('正常系', () {
      test(
        'AuthRepository#linkWithGoogle が呼ばれ、onData が呼ばれること',
        () async {
          when(mockAuthRepository.linkWithGoogle()).thenAnswer((_) async => {});
          final stream = await interactor.buildUseCaseStream(param);
          var onDataCallCount = 0;
          stream.listen(
            (_) => fail('onData should not be called'),
            onError: (_) => fail('onError should not be called'),
            onDone: () => onDataCallCount++,
          );
          verify(mockAuthRepository.linkWithGoogle());
        },
      );
    });

    group('異常系', () {
      test(
        'AuthRepository#signOut でエラーが発生した場合は、onError が呼ばれること',
        () async {
          final exception = Exception(faker.guid.guid());
          when(mockAuthRepository.linkWithGoogle()).thenThrow(exception);
          final stream = await interactor.buildUseCaseStream(param);
          stream.listen(
            (_) => fail('onData should not be called'),
            onError: (dynamic e) => expect(e, exception),
            onDone: () => fail('onDone should not be called'),
          );
        },
      );
    });
  });

  group('${OAuthProviderType.x} を渡した場合', () {
    const param = LinkIdentityParam(
      oauthProviderType: OAuthProviderType.x,
    );

    group('正常系', () {
      test(
        'AuthRepository#linkWithApple が呼ばれ、onData が呼ばれること',
        () async {
          when(mockAuthRepository.linkWithX()).thenAnswer((_) async => {});
          final stream = await interactor.buildUseCaseStream(param);
          var onDataCallCount = 0;
          stream.listen(
            (_) => fail('onData should not be called'),
            onError: (_) => fail('onError should not be called'),
            onDone: () => onDataCallCount++,
          );
          verify(mockAuthRepository.linkWithX());
        },
      );
    });

    group('異常系', () {
      test(
        'AuthRepository#signOut でエラーが発生した場合は、onError が呼ばれること',
        () async {
          final exception = Exception(faker.guid.guid());
          when(mockAuthRepository.linkWithX()).thenThrow(exception);
          final stream = await interactor.buildUseCaseStream(param);
          stream.listen(
            (_) => fail('onData should not be called'),
            onError: (dynamic e) => expect(e, exception),
            onDone: () => fail('onDone should not be called'),
          );
        },
      );
    });
  });

  group('${OAuthProviderType.twitch} を渡した場合', () {
    const param = LinkIdentityParam(
      oauthProviderType: OAuthProviderType.twitch,
    );

    group('正常系', () {
      test(
        'AuthRepository#linkWithApple が呼ばれ、onData が呼ばれること',
        () async {
          when(mockAuthRepository.linkWithTwitch()).thenAnswer((_) async => {});
          final stream = await interactor.buildUseCaseStream(param);
          var onDataCallCount = 0;
          stream.listen(
            (_) => fail('onData should not be called'),
            onError: (_) => fail('onError should not be called'),
            onDone: () => onDataCallCount++,
          );
          verify(mockAuthRepository.linkWithTwitch());
        },
      );
    });

    group('異常系', () {
      test(
        'AuthRepository#signOut でエラーが発生した場合は、onError が呼ばれること',
        () async {
          final exception = Exception(faker.guid.guid());
          when(mockAuthRepository.linkWithTwitch()).thenThrow(exception);
          final stream = await interactor.buildUseCaseStream(param);
          stream.listen(
            (_) => fail('onData should not be called'),
            onError: (dynamic e) => expect(e, exception),
            onDone: () => fail('onDone should not be called'),
          );
        },
      );
    });
  });

  group('${OAuthProviderType.discord} を渡した場合', () {
    const param = LinkIdentityParam(
      oauthProviderType: OAuthProviderType.discord,
    );

    group('正常系', () {
      test(
        'AuthRepository#linkWithApple が呼ばれ、onData が呼ばれること',
        () async {
          when(mockAuthRepository.linkWithDiscord())
              .thenAnswer((_) async => {});
          final stream = await interactor.buildUseCaseStream(param);
          var onDataCallCount = 0;
          stream.listen(
            (_) => fail('onData should not be called'),
            onError: (_) => fail('onError should not be called'),
            onDone: () => onDataCallCount++,
          );
          verify(mockAuthRepository.linkWithDiscord());
        },
      );
    });

    group('異常系', () {
      test(
        'AuthRepository#signOut でエラーが発生した場合は、onError が呼ばれること',
        () async {
          final exception = Exception(faker.guid.guid());
          when(mockAuthRepository.linkWithDiscord()).thenThrow(exception);
          final stream = await interactor.buildUseCaseStream(param);
          stream.listen(
            (_) => fail('onData should not be called'),
            onError: (dynamic e) => expect(e, exception),
            onDone: () => fail('onDone should not be called'),
          );
        },
      );
    });
  });
}

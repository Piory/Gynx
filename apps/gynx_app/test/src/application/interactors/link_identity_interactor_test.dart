import 'package:gynx_app/src/application/interactors/link_identity_interactor.dart';
import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';
import 'package:gynx_app/src/domain/repositories/auth_repository.dart';
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
    group('正常系', () {
      test(
        'AuthRepository#linkWithApple が呼ばれること',
        () async {
          when(mockAuthRepository.linkWithApple()).thenAnswer((_) async => {});
          await interactor.execute(OAuthProviderType.apple);
          verify(mockAuthRepository.linkWithApple());
        },
      );
    });
  });

  group('${OAuthProviderType.google} を渡した場合', () {
    group('正常系', () {
      test(
        'AuthRepository#linkWithGoogle が呼ばれること',
        () async {
          when(mockAuthRepository.linkWithGoogle()).thenAnswer((_) async => {});
          await interactor.execute(OAuthProviderType.google);
          verify(mockAuthRepository.linkWithGoogle());
        },
      );
    });
  });

  group('${OAuthProviderType.x} を渡した場合', () {
    group('正常系', () {
      test(
        'AuthRepository#linkWithX が呼ばれること',
        () async {
          when(mockAuthRepository.linkWithX()).thenAnswer((_) async => {});
          await interactor.execute(OAuthProviderType.x);
          verify(mockAuthRepository.linkWithX());
        },
      );
    });
  });

  group('${OAuthProviderType.twitch} を渡した場合', () {
    group('正常系', () {
      test(
        'AuthRepository#linkWithTwitch が呼ばれること',
        () async {
          when(mockAuthRepository.linkWithTwitch()).thenAnswer((_) async => {});
          await interactor.execute(OAuthProviderType.twitch);
          verify(mockAuthRepository.linkWithTwitch());
        },
      );
    });
  });

  group('${OAuthProviderType.discord} を渡した場合', () {
    group('正常系', () {
      test(
        'AuthRepository#linkWithDiscord が呼ばれること',
        () async {
          when(mockAuthRepository.linkWithDiscord())
              .thenAnswer((_) async => {});
          await interactor.execute(OAuthProviderType.discord);
          verify(mockAuthRepository.linkWithDiscord());
        },
      );
    });
  });
}

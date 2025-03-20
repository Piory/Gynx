import 'package:gynx_app/src/application/usecase/interactors/sign_in_with_anonymous_interactor.dart';
import 'package:gynx_app/src/application/usecase/interactors/sign_in_with_oauth_interactor.dart';
import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_controller.dart';
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_presenter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'sign_in_controller_test.mocks.dart';

class SpySignInPresenter extends SignInPresenter {
  SpySignInPresenter(this._mockSignInPresenter)
      : super(
          MockSignInWithAnonymousInteractor(),
          MockSignInWithOAuthInteractor(),
        );

  final MockSignInPresenter _mockSignInPresenter;

  @override
  void signInWithAnonymous() {
    _mockSignInPresenter.signInWithAnonymous();
  }

  @override
  void signInWithOAuth(OAuthProviderType oAuthProviderType) {
    _mockSignInPresenter.signInWithOAuth(oAuthProviderType);
  }
}

@GenerateNiceMocks([
  MockSpec<SignInWithAnonymousInteractor>(),
  MockSpec<SignInWithOAuthInteractor>(),
  MockSpec<SignInPresenter>(),
])
void main() {
  final mockSignInPresenter = MockSignInPresenter();
  final spySignInPresenter = SpySignInPresenter(mockSignInPresenter);
  late SignInController controller;

  setUp(() {
    controller = SignInController(spySignInPresenter);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockSignInPresenter);
    reset(mockSignInPresenter);
  });

  group('#signInWithAnonymous', () {
    group('正常系', () {
      test('SignInPresenter#signInWithAnonymous が呼ばれること', () {
        when(mockSignInPresenter.signInWithAnonymous());
        controller.signInWithAnonymous();
        verify(mockSignInPresenter.signInWithAnonymous());
      });
    });
  });

  group('#signInWithApple', () {
    group('正常系', () {
      test(
        'SignInPresenter#signInWithOAuth に OAuthProviderType.apple が渡されていること',
        () {
          controller.signInWithApple();
          verify(mockSignInPresenter.signInWithOAuth(OAuthProviderType.apple));
        },
      );
    });
  });

  group('#signInWithGoogle', () {
    group('正常系', () {
      test(
        'SignInPresenter#signInWithOAuth に OAuthProviderType.google が渡されていること',
        () {
          controller.signInWithGoogle();
          verify(mockSignInPresenter.signInWithOAuth(OAuthProviderType.google));
        },
      );
    });
  });
}

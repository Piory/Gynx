import 'package:gynx_app/src/application/usecase/interactors/sign_in_with_anonymous_interactor.dart';
import 'package:gynx_app/src/application/usecase/interactors/sign_in_with_oauth_interactor.dart';
import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';
import 'package:gynx_app/src/interface/dialogs/alert.dart';
import 'package:gynx_app/src/interface/dialogs/loading_dialog.dart';
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_controller.dart';
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_presenter.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
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
    try {
      _mockSignInPresenter.signInWithAnonymous();
      signInOnComplete();
    } on Exception catch (e) {
      signInOnError(e);
    }
  }

  @override
  void signInWithOAuth(OAuthProviderType oauthProviderType) {
    try {
      _mockSignInPresenter.signInWithOAuth(oauthProviderType);
      signInOnComplete();
    } on Exception catch (e) {
      signInOnError(e);
    }
  }
}

@GenerateNiceMocks([
  MockSpec<SignInWithAnonymousInteractor>(),
  MockSpec<SignInWithOAuthInteractor>(),
  MockSpec<SignInPresenter>(),
  MockSpec<LoadingDialog>(),
  MockSpec<Alert>(),
])
void main() {
  final l10nJa = L10nJa();
  final mockSignInPresenter = MockSignInPresenter();
  final spySignInPresenter = SpySignInPresenter(mockSignInPresenter);
  final mockLoadingDialog = MockLoadingDialog();
  final mockAlert = MockAlert();
  late SignInController controller;

  setUp(() {
    controller = SignInController(
      spySignInPresenter,
      mockLoadingDialog,
      mockAlert,
    );
  });

  tearDown(() {
    verifyNoMoreInteractions(mockSignInPresenter);
    verifyNoMoreInteractions(mockLoadingDialog);
    reset(mockSignInPresenter);
    reset(mockLoadingDialog);
    reset(mockAlert);
  });

  group('#signInWithAnonymous', () {
    group('正常系', () {
      test(
        'Alert#showAlert が呼ばれ、${l10nJa.doContinue} をタップするとSignInPresenter#signInWithAnonymous が呼ばれること',
        () async {
          when(
            mockAlert.showAlert(
              title: l10nJa.guestSignInAlertTitle,
              text: l10nJa.guestSignInAlertMessage,
              leftButtonText: l10nJa.cancel,
              rightButtonText: l10nJa.doContinue,
            ),
          ).thenAnswer((_) async => AlertResultType.right);
          await controller.signInWithAnonymous(l10nJa);
          verifyInOrder([
            mockLoadingDialog.show(),
            mockAlert.showAlert(
              title: l10nJa.guestSignInAlertTitle,
              text: l10nJa.guestSignInAlertMessage,
              leftButtonText: l10nJa.cancel,
              rightButtonText: l10nJa.doContinue,
            ),
            mockSignInPresenter.signInWithAnonymous(),
            mockLoadingDialog.hide(),
          ]);
        },
      );

      test(
        'Alert#showAlert が呼ばれ、${l10nJa.cancel} をタップすると、SignInController#signInWithAnonymous が呼ばれないこと',
        () async {
          when(
            mockAlert.showAlert(
              title: l10nJa.guestSignInAlertTitle,
              text: l10nJa.guestSignInAlertMessage,
              leftButtonText: l10nJa.cancel,
              rightButtonText: l10nJa.doContinue,
            ),
          ).thenAnswer((_) async => AlertResultType.left);
          await controller.signInWithAnonymous(l10nJa);
          verifyInOrder([
            mockLoadingDialog.show(),
            mockAlert.showAlert(
              title: l10nJa.guestSignInAlertTitle,
              text: l10nJa.guestSignInAlertMessage,
              leftButtonText: l10nJa.cancel,
              rightButtonText: l10nJa.doContinue,
            ),
            mockLoadingDialog.hide(),
          ]);
          verifyNever(mockSignInPresenter.signInWithAnonymous());
        },
      );
    });

    group('準正常系', () {
      test(
        'SignInPresenter#signInWithAnonymous がエラーで発生した場合でも、LoadingDialog#hide が呼ばれること',
        () async {
          when(mockSignInPresenter.signInWithAnonymous())
              .thenThrow(Exception());
          when(
            mockAlert.showAlert(
              title: l10nJa.guestSignInAlertTitle,
              text: l10nJa.guestSignInAlertMessage,
              leftButtonText: l10nJa.cancel,
              rightButtonText: l10nJa.doContinue,
            ),
          ).thenAnswer((_) async => AlertResultType.right);
          await controller.signInWithAnonymous(l10nJa);
          verifyInOrder([
            mockLoadingDialog.show(),
            mockAlert.showAlert(
              title: l10nJa.guestSignInAlertTitle,
              text: l10nJa.guestSignInAlertMessage,
              leftButtonText: l10nJa.cancel,
              rightButtonText: l10nJa.doContinue,
            ),
            mockSignInPresenter.signInWithAnonymous(),
            mockLoadingDialog.hide(),
          ]);
        },
      );
    });
  });

  group('#signInWithApple', () {
    group('正常系', () {
      test(
        'SignInPresenter#signInWithOAuth に OAuthProviderType.apple が渡されていること',
        () {
          controller.signInWithApple();
          verifyInOrder([
            mockSignInPresenter.signInWithOAuth(OAuthProviderType.apple),
            mockLoadingDialog.hide(),
          ]);
        },
      );
    });
  });

  group('#signInWithGoogle', () {
    group('正常系', () {
      test(
        'Google OAuth が正常に完了した後、LoadingDialog#hide が呼ばれること',
        () {
          controller.signInWithGoogle();
          verifyInOrder([
            mockLoadingDialog.show(),
            mockSignInPresenter.signInWithOAuth(OAuthProviderType.google),
            mockLoadingDialog.hide(),
          ]);
        },
      );
    });

    group('準正常系', () {
      test(
        'Google OAuth がエラーで完了した後、LoadingDialog#hide が呼ばれること',
        () {
          when(mockSignInPresenter.signInWithOAuth(OAuthProviderType.google))
              .thenThrow(Exception());
          controller.signInWithGoogle();
          verifyInOrder([
            mockLoadingDialog.show(),
            mockSignInPresenter.signInWithOAuth(OAuthProviderType.google),
            mockLoadingDialog.hide(),
          ]);
        },
      );
    });
  });
}

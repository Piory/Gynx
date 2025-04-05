// ignore_for_file: lines_longer_than_80_chars
import 'package:app/src/domain/enums/oauth_provider_type.dart';
import 'package:app/src/domain/usecases/sign_in_with_anonymous_usecase.dart';
import 'package:app/src/domain/usecases/sign_in_with_oauth_usecase.dart';
import 'package:app/src/presentation/dialogs/alert.dart';
import 'package:app/src/presentation/dialogs/loading_dialog.dart';
import 'package:app/src/presentation/dialogs/notify.dart';
import 'package:app/src/presentation/pages/sign_in/sign_in_controller.dart';
import 'package:locales/locales.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'sign_in_controller_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SignInWithOAuthUseCase>(),
  MockSpec<SignInWithAnonymousUseCase>(),
  MockSpec<LoadingDialog>(),
  MockSpec<Notify>(),
  MockSpec<Alert>(),
])
void main() {
  final l10nJa = L10nJa();
  final mockSignInWithOAuthUseCase = MockSignInWithOAuthUseCase();
  final mockSignInWithAnonymousUseCase = MockSignInWithAnonymousUseCase();
  final mockLoadingDialog = MockLoadingDialog();
  final mockNotify = MockNotify();
  final mockAlert = MockAlert();
  final controller = SignInController(
    mockSignInWithOAuthUseCase,
    mockSignInWithAnonymousUseCase,
    mockLoadingDialog,
    mockNotify,
    mockAlert,
  );

  tearDown(() {
    // verifyNoMoreInteractions(mockSignInWithOAuthUseCase);
    // verifyNoMoreInteractions(mockSignInWithAnonymousUseCase);
    // verifyNoMoreInteractions(mockLoadingDialog);
    // verifyNoMoreInteractions(mockNotify);
    // verifyNoMoreInteractions(mockAlert);
    reset(mockSignInWithOAuthUseCase);
    reset(mockSignInWithAnonymousUseCase);
    reset(mockLoadingDialog);
    reset(mockNotify);
    reset(mockAlert);
  });

  group('#signInWithApple', () {
    group('正常系', () {
      test(
        'Google OAuth が正常に完了した後、LoadingDialog#hide が呼ばれること',
        () async {
          await controller.signInWithApple(l10nJa);
          verifyInOrder([
            mockLoadingDialog.show(),
            mockSignInWithOAuthUseCase.execute(OAuthProviderType.apple),
            mockLoadingDialog.hide(),
          ]);
        },
      );
    });

    group('準正常系', () {
      test(
        'Google OAuth がエラーで完了した後、Notify#showError, LoadingDialog#hide が呼ばれること',
        () async {
          final exception = Exception();
          when(mockSignInWithOAuthUseCase.execute(OAuthProviderType.apple)).thenThrow(exception);
          await expectLater(
            () => controller.signInWithApple(l10nJa),
            throwsA(exception),
          );
          verifyInOrder([
            mockLoadingDialog.show(),
            mockSignInWithOAuthUseCase.execute(OAuthProviderType.apple),
            mockNotify.showError(message: l10nJa.signInError),
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
        () async {
          await controller.signInWithGoogle(l10nJa);
          verifyInOrder([
            mockLoadingDialog.show(),
            mockSignInWithOAuthUseCase.execute(OAuthProviderType.google),
            mockLoadingDialog.hide(),
          ]);
        },
      );
    });

    group('準正常系', () {
      test(
        'Google OAuth がエラーで完了した後、Notify#showError, LoadingDialog#hide が呼ばれること',
        () async {
          final exception = Exception();
          when(mockSignInWithOAuthUseCase.execute(OAuthProviderType.google)).thenThrow(exception);
          await expectLater(
            () => controller.signInWithGoogle(l10nJa),
            throwsA(exception),
          );
          verifyInOrder([
            mockLoadingDialog.show(),
            mockSignInWithOAuthUseCase.execute(OAuthProviderType.google),
            mockNotify.showError(message: l10nJa.signInError),
            mockLoadingDialog.hide(),
          ]);
        },
      );
    });
  });

  group('#signInWithAnonymous', () {
    group('正常系', () {
      test(
        'Alert#showAlert が呼ばれ、${l10nJa.doContinue} をタップすると、SignInPresenter#signInWithAnonymous が呼ばれること',
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
            mockSignInWithAnonymousUseCase.execute(),
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
          verifyZeroInteractions(mockSignInWithAnonymousUseCase);
        },
      );
    });

    group('準正常系', () {
      test(
        'SignInPresenter#signInWithAnonymous がエラーで発生した場合でも、LoadingDialog#hide が呼ばれること',
        () async {
          final exception = Exception();
          when(mockSignInWithAnonymousUseCase.execute()).thenThrow(exception);
          when(
            mockAlert.showAlert(
              title: l10nJa.guestSignInAlertTitle,
              text: l10nJa.guestSignInAlertMessage,
              leftButtonText: l10nJa.cancel,
              rightButtonText: l10nJa.doContinue,
            ),
          ).thenAnswer((_) async => AlertResultType.right);
          await expectLater(
            () => controller.signInWithAnonymous(l10nJa),
            throwsA(exception),
          );
          verifyInOrder([
            mockLoadingDialog.show(),
            mockAlert.showAlert(
              title: l10nJa.guestSignInAlertTitle,
              text: l10nJa.guestSignInAlertMessage,
              leftButtonText: l10nJa.cancel,
              rightButtonText: l10nJa.doContinue,
            ),
            mockSignInWithAnonymousUseCase.execute(),
            mockNotify.showError(message: l10nJa.signInError),
            mockLoadingDialog.hide(),
          ]);
        },
      );
    });
  });
}

import 'dart:async';

import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';
import 'package:gynx_app/src/domain/usecases/sign_in_with_anonymous_usecase.dart';
import 'package:gynx_app/src/domain/usecases/sign_in_with_oauth_usecase.dart';
import 'package:gynx_app/src/presentation/dialogs/alert.dart';
import 'package:gynx_app/src/presentation/dialogs/loading_dialog.dart';
import 'package:gynx_app/src/presentation/dialogs/notify.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInController {
  const SignInController(
    this._signInWithOAuthUseCase,
    this._signInWithAnonymousUseCase,
    this._loading,
    this._notify,
    this._alert,
  );

  final SignInWithOAuthUseCase _signInWithOAuthUseCase;
  final SignInWithAnonymousUseCase _signInWithAnonymousUseCase;
  final LoadingDialog _loading;
  final Notify _notify;
  final Alert _alert;

  Future<void> signInWithApple(L10n l10n) async {
    await _doSignIn(
      l10n: l10n,
      onSignIn: () => _signInWithOAuthUseCase.execute(OAuthProviderType.apple),
    );
  }

  Future<void> signInWithGoogle(L10n l10n) async {
    await _doSignIn(
      l10n: l10n,
      onSignIn: () => _signInWithOAuthUseCase.execute(OAuthProviderType.google),
    );
  }

  Future<void> signInWithAnonymous(L10n l10n) async {
    await _doSignIn(
      l10n: l10n,
      onSignIn: () async {
        final result = await _alert.showAlert(
          title: l10n.guestSignInAlertTitle,
          text: l10n.guestSignInAlertMessage,
          leftButtonText: l10n.cancel,
          rightButtonText: l10n.doContinue,
        );
        switch (result) {
          case AlertResultType.left:
            return;
          case AlertResultType.right:
            await _signInWithAnonymousUseCase.execute();
        }
      },
    );
  }

  Future<void> _doSignIn({
    required L10n l10n,
    required Future<void> Function() onSignIn,
  }) async {
    try {
      _loading.show();
      await onSignIn();
    } on Exception catch (_) {
      _notify.showError(
        message: l10n.signInError,
      );
      rethrow;
    } finally {
      _loading.hide();
    }
  }
}

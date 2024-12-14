import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';
import 'package:gynx_app/src/interface/dialogs/alert.dart';
import 'package:gynx_app/src/interface/dialogs/loading_dialog.dart';
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_presenter.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInController extends Controller {
  SignInController(
    this._signInPresenter,
    this._loading,
    this._alert,
  );

  final SignInPresenter _signInPresenter;
  final LoadingDialog _loading;
  final Alert _alert;

  void signInWithApple() {
    _signInPresenter.signInWithOAuth(OAuthProviderType.apple);
  }

  void signInWithGoogle() {
    _loading.show();
    _signInPresenter.signInWithOAuth(OAuthProviderType.google);
  }

  Future<void> signInWithAnonymous(L10n l10n) async {
    unawaited(_loading.show());
    final result = await _alert.showAlert(
      title: l10n.guestSignInAlertTitle,
      text: l10n.guestSignInAlertMessage,
      leftButtonText: l10n.cancel,
      rightButtonText: l10n.doContinue,
    );
    switch (result) {
      case AlertResultType.left:
        unawaited(_loading.hide());
      case AlertResultType.right:
        _signInPresenter.signInWithAnonymous();
    }
  }

  @override
  void initListeners() {
    _signInPresenter
      ..signInOnComplete = _loading.hide
      ..signInOnError = (e) {
        unawaited(
          SmartDialog.showNotify(
            msg: '通信エラー',
            notifyType: NotifyType.error,
          ),
        );
        logger.severe('Error: $e');
        _loading.hide();
      };
  }
}

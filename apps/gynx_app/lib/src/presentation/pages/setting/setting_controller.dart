import 'package:gynx_app/src/domain/usecases/sign_out_usecase.dart';
import 'package:gynx_app/src/presentation/dialogs/alert.dart';
import 'package:gynx_app/src/presentation/dialogs/loading_dialog.dart';
import 'package:gynx_app/src/presentation/dialogs/notify.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:injectable/injectable.dart';

@singleton
class SettingController {
  const SettingController(
    this._loadingDialog,
    this._notify,
    this._alert,
    this._signOutUseCase,
  );

  final LoadingDialog _loadingDialog;
  final Notify _notify;
  final Alert _alert;
  final SignOutUseCase _signOutUseCase;

  Future<void> signOut(L10n l10n) async {
    final resultType = await _alert.showAlert(
      title: l10n.signOut,
      text: l10n.signOutMessage,
      leftButtonText: l10n.cancel,
      rightButtonText: l10n.signOut,
    );
    if (resultType == AlertResultType.left) {
      return;
    }
    try {
      _loadingDialog.show();
      await _signOutUseCase.execute();
    } on Exception catch (_) {
      _notify.showError(message: l10n.signOutError);
      rethrow;
    } finally {
      _loadingDialog.hide();
    }
  }
}

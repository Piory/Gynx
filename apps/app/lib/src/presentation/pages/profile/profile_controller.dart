import 'package:app/src/domain/usecases/sign_out_usecase.dart';
import 'package:app/src/presentation/dialogs/loading_dialog.dart';
import 'package:app/src/presentation/dialogs/notify.dart';
import 'package:injectable/injectable.dart';
import 'package:locales/locales.dart';

@lazySingleton
class ProfileController {
  const ProfileController(
    this._loadingDialog,
    this._notify,
    this._signOutUseCase,
  );

  final LoadingDialog _loadingDialog;
  final Notify _notify;
  final SignOutUseCase _signOutUseCase;

  Future<void> signOut(L10n l10n) async {
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

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:gynx_app/src/interface/dialogs/loading_dialog.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: LoadingDialog)
class DialogImpl implements LoadingDialog {
  @override
  Future<void> show() {
    return SmartDialog.showLoading();
  }

  @override
  Future<void> hide() {
    return SmartDialog.dismiss<void>();
  }
}

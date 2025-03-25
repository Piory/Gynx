import 'dart:async';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:gynx_app/src/presentation/dialogs/loading_dialog.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LoadingDialog)
class DialogImpl implements LoadingDialog {
  @override
  void show() {
    unawaited(SmartDialog.showLoading());
  }

  @override
  void hide() {
    unawaited(SmartDialog.dismiss<void>());
  }
}

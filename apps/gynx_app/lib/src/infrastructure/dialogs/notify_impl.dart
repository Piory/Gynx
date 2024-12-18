import 'dart:async';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:gynx_app/src/interface/dialogs/notify.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: Notify)
class NotifyImpl implements Notify {
  @override
  void showError({
    required String message,
  }) {
    unawaited(
      SmartDialog.showNotify(
        msg: message,
        notifyType: NotifyType.error,
      ),
    );
  }
}

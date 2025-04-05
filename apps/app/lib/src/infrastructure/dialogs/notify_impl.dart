import 'dart:async';

import 'package:app/src/presentation/dialogs/notify.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: Notify)
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

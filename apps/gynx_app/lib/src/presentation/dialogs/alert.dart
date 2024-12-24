enum AlertResultType {
  left,
  right,
}

enum ActionSheetResultType {
  positive,
  neutral,
  negative,
}

abstract interface class Alert {
  Future<void> showInfo({
    required String title,
    required String text,
  });

  Future<AlertResultType> showAlert({
    required String title,
    required String text,
    required String leftButtonText,
    required String rightButtonText,
  });

  Future<ActionSheetResultType> showActionSheet({
    String? title,
    String? message,
    required String positiveButtonText,
    required String neutralButtonText,
    required String negativeButtonText,
  });
}

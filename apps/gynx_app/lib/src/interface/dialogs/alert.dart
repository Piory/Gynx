enum AlertResultType {
  left,
  right,
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
}

import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:gynx_app/src/interface/dialogs/alert.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: Alert)
class AlertImpl implements Alert {
  @override
  Future<void> showInfo({
    required String title,
    required String text,
  }) async {
    await FlutterPlatformAlert.showAlert(
      windowTitle: title,
      text: text,
    );
  }

  @override
  Future<AlertResultType> showAlert({
    required String title,
    required String text,
    required String leftButtonText,
    required String rightButtonText,
  }) async {
    final result = await FlutterPlatformAlert.showCustomAlert(
      windowTitle: title,
      text: text,
      positiveButtonTitle: leftButtonText,
      neutralButtonTitle: rightButtonText,
      options: PlatformAlertOptions(
        ios: IosAlertOptions(
          positiveButtonStyle: IosButtonStyle.cancel,
          neutralButtonStyle: IosButtonStyle.normal,
        ),
      ),
    );
    switch (result) {
      case CustomButton.positiveButton:
        return AlertResultType.left;
      case CustomButton.neutralButton:
        return AlertResultType.right;
      case CustomButton.negativeButton:
      case CustomButton.other:
        throw UnsupportedError('Unsupported button type. [$result]');
    }
  }
}

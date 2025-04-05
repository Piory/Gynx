import 'package:app/src/presentation/dialogs/alert.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: Alert)
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

  @override
  Future<ActionSheetResultType> showActionSheet({
    String? title,
    String? message,
    required String positiveButtonText,
    required String neutralButtonText,
    required String negativeButtonText,
  }) async {
    final result = await FlutterPlatformAlert.showCustomAlert(
      windowTitle: title ?? '',
      text: message ?? '',
      positiveButtonTitle: positiveButtonText,
      neutralButtonTitle: neutralButtonText,
      negativeButtonTitle: negativeButtonText,
      options: PlatformAlertOptions(
        ios: IosAlertOptions(
          alertStyle: IosAlertStyle.actionSheet,
          negativeButtonStyle: IosButtonStyle.cancel,
        ),
      ),
    );
    switch (result) {
      case CustomButton.positiveButton:
        return ActionSheetResultType.positive;
      case CustomButton.neutralButton:
        return ActionSheetResultType.neutral;
      case CustomButton.negativeButton:
        return ActionSheetResultType.negative;
      case CustomButton.other:
        throw UnsupportedError('Unsupported button type. [$result]');
    }
  }
}

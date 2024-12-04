import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MaterialWithModalsPage<T> extends Page<T> {
  const MaterialWithModalsPage({
    required this.child,
    this.fullscreenDialog = false,
    super.key,
    super.canPop,
    super.onPopInvoked,
    super.name,
    super.arguments,
    super.restorationId,
  });

  final Widget child;
  final bool fullscreenDialog;

  @override
  Route<T> createRoute(BuildContext context) {
    return MaterialWithModalsPageRoute<T>(
      builder: (context) => child,
      settings: this,
      fullscreenDialog: fullscreenDialog,
    );
  }
}

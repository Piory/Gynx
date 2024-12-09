import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MaterialWithModalsPage<T> extends Page<T> {
  const MaterialWithModalsPage({
    required this.child,
    this.maintainState = true,
    this.fullscreenDialog = false,
    this.allowSnapshotting = true,
    super.key,
    super.canPop,
    super.onPopInvoked,
    super.name,
    super.arguments,
    super.restorationId,
  });

  final Widget child;
  final bool maintainState;
  final bool fullscreenDialog;
  final bool allowSnapshotting;

  @override
  Route<T> createRoute(BuildContext context) {
    return MaterialWithModalsPageRoute<T>(
      builder: (context) => child,
      settings: this,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );
  }
}

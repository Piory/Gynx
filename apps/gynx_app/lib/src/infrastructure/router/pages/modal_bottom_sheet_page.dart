import 'package:flutter/material.dart';

class ModalBottomSheetPage<T> extends Page<T> {
  const ModalBottomSheetPage({
    super.key,
    required this.builder,
    this.anchorPoint,
    this.barrierLabel,
    this.themes,
  });

  final WidgetBuilder builder;
  final Offset? anchorPoint;
  final String? barrierLabel;
  final CapturedThemes? themes;

  @override
  Route<T> createRoute(BuildContext context) {
    final theme = Theme.of(context);
    // return CupertinoModalPopupRoute(
    //   builder: builder,
    //   settings: this,
    // );
    return ModalBottomSheetRoute(
      builder: builder,
      settings: this,
      anchorPoint: anchorPoint,
      barrierLabel: barrierLabel,
      isScrollControlled: true,
      backgroundColor: theme.colorScheme.surface,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height / 2,
      ),
      useSafeArea: true,
      showDragHandle: true,
    );
  }
}

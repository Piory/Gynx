import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BarModalBottomSheetPage<T> extends Page<T> {
  const BarModalBottomSheetPage({
    super.key,
    required this.builder,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.barrierColor = Colors.black87,
    this.bounce = true,
    this.expand = false,
    this.secondAnimation,
    this.animationCurve,
    this.useRootNavigator = false,
    this.isDismissible = true,
    this.enableDrag = true,
    this.topControl,
    this.duration,
    this.overlayStyle,
    this.closeProgressThreshold,
  });

  final WidgetBuilder builder;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final Color barrierColor;
  final bool bounce;
  final bool expand;
  final AnimationController? secondAnimation;
  final Curve? animationCurve;
  final bool useRootNavigator;
  final bool isDismissible;
  final bool enableDrag;
  final Widget? topControl;
  final Duration? duration;
  final SystemUiOverlayStyle? overlayStyle;
  final double? closeProgressThreshold;

  @override
  Route<T> createRoute(BuildContext context) {
    return ModalSheetRoute<T>(
      builder: builder,
      bounce: bounce,
      closeProgressThreshold: closeProgressThreshold,
      containerBuilder: (_, __, child) => BarBottomSheet(
        control: topControl,
        clipBehavior: clipBehavior,
        shape: shape,
        backgroundColor: Colors.transparent,
        elevation: elevation,
        overlayStyle: overlayStyle,
        child: child,
      ),
      secondAnimationController: secondAnimation,
      expanded: expand,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      isDismissible: isDismissible,
      modalBarrierColor: barrierColor,
      enableDrag: enableDrag,
      animationCurve: animationCurve,
      duration: duration,
      settings: this,
    );
  }
}

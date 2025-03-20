import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

const double _kPreviousPageVisibleOffset = 10;
const _kDefaultTopRadius = Radius.circular(12);
const _kDefaultBoxShadow = BoxShadow(
  blurRadius: 10,
  color: Colors.black12,
  spreadRadius: 5,
);

class CupertinoModalBottomSheetPage<T> extends Page<T> {
  const CupertinoModalBottomSheetPage({
    super.key,
    required this.builder,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.barrierColor,
    this.expand = false,
    this.secondAnimation,
    this.animationCurve,
    this.previousRouteAnimationCurve,
    this.useRootNavigator = false,
    this.bounce = true,
    this.isDismissible,
    this.enableDrag = true,
    this.topRadius = _kDefaultTopRadius,
    this.duration,
    this.transitionBackgroundColor,
    this.shadow,
    this.overlayStyle,
    this.closeProgressThreshold,
  });

  final WidgetBuilder builder;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final Color? barrierColor;
  final bool expand;
  final AnimationController? secondAnimation;
  final Curve? animationCurve;
  final Curve? previousRouteAnimationCurve;
  final bool useRootNavigator;
  final bool bounce;
  final bool? isDismissible;
  final bool enableDrag;
  final Radius topRadius;
  final Duration? duration;
  final Color? transitionBackgroundColor;
  final BoxShadow? shadow;
  final SystemUiOverlayStyle? overlayStyle;
  final double? closeProgressThreshold;

  @override
  Route<T> createRoute(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    final isCupertinoApp =
        context.findAncestorWidgetOfExactType<CupertinoApp>() != null;
    var barrierLabel = '';
    if (!isCupertinoApp) {
      assert(debugCheckHasMaterialLocalizations(context));
      barrierLabel = MaterialLocalizations.of(context).modalBarrierDismissLabel;
    }
    final topRadius = CupertinoScaffold.of(context)?.topRadius;
    final transitionBackgroundColor =
        CupertinoScaffold.of(context)?.transitionBackgroundColor;
    final overlayStyle =
        overlayStyleFromColor(transitionBackgroundColor ?? Colors.black);
    return CupertinoModalBottomSheetRoute<T>(
      builder: builder,
      containerBuilder: (context, _, child) => _CupertinoBottomSheetContainer(
        backgroundColor: backgroundColor,
        topRadius: topRadius ?? _kDefaultTopRadius,
        shadow: shadow,
        overlayStyle: overlayStyle,
        child: child,
      ),
      secondAnimationController: secondAnimation,
      expanded: expand,
      closeProgressThreshold: closeProgressThreshold,
      barrierLabel: barrierLabel,
      elevation: elevation,
      bounce: bounce,
      shape: shape,
      clipBehavior: clipBehavior,
      isDismissible: isDismissible ?? !expand,
      modalBarrierColor: barrierColor ?? Colors.black12,
      enableDrag: enableDrag,
      topRadius: topRadius ?? _kDefaultTopRadius,
      animationCurve: animationCurve,
      previousRouteAnimationCurve: previousRouteAnimationCurve,
      duration: duration,
      settings: this,
      transitionBackgroundColor: transitionBackgroundColor ?? Colors.black,
      overlayStyle: overlayStyle,
    );
  }
}

class _CupertinoBottomSheetContainer extends StatelessWidget {
  const _CupertinoBottomSheetContainer({
    required this.child,
    this.backgroundColor,
    required this.topRadius,
    this.overlayStyle,
    this.shadow,
  });

  final Widget child;
  final Color? backgroundColor;
  final Radius topRadius;
  final BoxShadow? shadow;
  final SystemUiOverlayStyle? overlayStyle;

  @override
  Widget build(BuildContext context) {
    final scopedOverlayStyle = overlayStyle;
    final topSafeAreaPadding = MediaQuery.of(context).padding.top;
    final topPadding = _kPreviousPageVisibleOffset + topSafeAreaPadding;

    final shadow = this.shadow ?? _kDefaultBoxShadow;
    const BoxShadow(
      blurRadius: 10,
      color: Colors.black12,
      spreadRadius: 5,
    );
    final backgroundColor = this.backgroundColor ??
        CupertinoTheme.of(context).scaffoldBackgroundColor;
    Widget bottomSheetContainer = Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: topRadius),
        child: Container(
          decoration:
              BoxDecoration(color: backgroundColor, boxShadow: [shadow]),
          width: double.infinity,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true, //Remove top Safe Area
            child: CupertinoUserInterfaceLevel(
              data: CupertinoUserInterfaceLevelData.elevated,
              child: child,
            ),
          ),
        ),
      ),
    );
    if (scopedOverlayStyle != null) {
      bottomSheetContainer = AnnotatedRegion<SystemUiOverlayStyle>(
        value: scopedOverlayStyle,
        child: bottomSheetContainer,
      );
    }
    return bottomSheetContainer;
  }
}

import 'dart:math';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PullToRefresh extends StatelessWidget {
  const PullToRefresh({
    super.key,
    required this.onRefresh,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    required this.child,
    this.valueListener,
  });

  static const _opacityCurve = Interval(0.4, 0.8, curve: Curves.easeInOut);
  final AsyncCallback onRefresh;
  final ScrollNotificationPredicate notificationPredicate;
  final Widget child;
  final ValueSetter<double>? valueListener;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomRefreshIndicator(
      onRefresh: () async {
        await Future.wait<void>([
          onRefresh(),
          Future<void>.delayed(const Duration(seconds: 1)),
        ]);
      },
      onStateChanged: (change) {
        if (change.currentState.isArmed && change.newState.isSettling) {
          HapticFeedback.mediumImpact();
        }
      },
      notificationPredicate: notificationPredicate,
      builder: (context, child, controller) {
        valueListener?.call(controller.value);
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            child,
            Positioned(
              top: 16 * controller.value,
              child: Opacity(
                opacity: _opacityCurve.transform(min(controller.value + 0.2, 1)),
                child: _refreshIndicateModeBuilder(
                  colorScheme: theme.colorScheme,
                  indicatorState: controller.state,
                ),
              ),
            ),
          ],
        );
      },
      child: child,
    );
  }

  Widget _refreshIndicateModeBuilder({
    required ColorScheme colorScheme,
    required IndicatorState indicatorState,
  }) {
    switch (indicatorState) {
      case IndicatorState.idle:
      case IndicatorState.canceling:
      case IndicatorState.complete:
      case IndicatorState.finalizing:
        return const SizedBox.shrink();
      case IndicatorState.dragging:
      case IndicatorState.armed:
        return const Icon(
          IconlyLight.arrow_down,
          color: CupertinoColors.inactiveGray,
          size: 24,
        );
      case IndicatorState.settling:
      case IndicatorState.loading:
        return LoadingAnimationWidget.inkDrop(
          color: colorScheme.primary,
          size: 28,
        );
    }
  }
}

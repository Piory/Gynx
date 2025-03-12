import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Refreshable extends StatelessWidget {
  const Refreshable({
    super.key,
    required this.onRefresh,
  });

  final Future<void> Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    const opacityCurve = Interval(0.4, 0.8, curve: Curves.easeInOut);
    return CupertinoSliverRefreshControl(
      builder: (
        BuildContext context,
        RefreshIndicatorMode refreshState,
        double pulledExtent,
        double refreshTriggerPullDistance,
        double refreshIndicatorExtent,
      ) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Opacity(
              opacity: opacityCurve
                  .transform(min(pulledExtent / refreshTriggerPullDistance, 1)),
              child: _refreshIndicateModeBuilder(
                colorScheme: Theme.of(context).colorScheme,
                refreshState: refreshState,
              ),
            ),
          ),
        );
      },
      onRefresh: onRefresh,
    );
  }

  Widget _refreshIndicateModeBuilder({
    required ColorScheme colorScheme,
    required RefreshIndicatorMode refreshState,
  }) {
    switch (refreshState) {
      case RefreshIndicatorMode.drag:
        return const Icon(
          IconlyLight.arrow_down,
          color: CupertinoColors.inactiveGray,
          size: 24,
        );
      case RefreshIndicatorMode.armed:
      case RefreshIndicatorMode.refresh:
      case RefreshIndicatorMode.done:
      case RefreshIndicatorMode.inactive:
        return LoadingAnimationWidget.inkDrop(
          color: colorScheme.primary,
          size: 28,
        );
    }
  }
}

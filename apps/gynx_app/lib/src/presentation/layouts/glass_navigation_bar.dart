import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/presentation/layouts/glass_navigation_bar.freezed.dart';

extension ScrollControllerExtension on ScrollController {
  void scrollToTop() {
    // 一番上までスクロール済みの場合は何もしない
    if (position.minScrollExtent == position.pixels) {
      return;
    }
    animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

@freezed
class NavigationBarItem with _$NavigationBarItem {
  const factory NavigationBarItem({
    required IconData selectedIcon,
    required IconData unselectedIcon,
  }) = _NavigationBarItem;
}

ScrollDirection _lastScrollDirection = ScrollDirection.idle;

class GlassNavigationBar extends StatelessWidget {
  const GlassNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onIndexSelected,
    this.blur = 10.0,
    this.height = 52,
    required this.padding,
    required this.selectedColor,
    required this.unselectedColor,
    required this.items,
  });

  final int currentIndex;
  final ValueChanged<int> onIndexSelected;
  final double blur;
  final double height;
  final EdgeInsets padding;
  final Color selectedColor;
  final Color unselectedColor;
  final List<NavigationBarItem> items;

  ScrollDirection _getScrollDirection(ScrollController controller) {
    final scrollDirection = controller.position.userScrollDirection;
    switch (scrollDirection) {
      case ScrollDirection.forward:
      case ScrollDirection.reverse:
        _lastScrollDirection = scrollDirection;
        return scrollDirection;
      case ScrollDirection.idle:
        return _lastScrollDirection;
    }
  }

  bool _isMovingToBottom(ScrollController controller) {
    if (!controller.position.hasContentDimensions) {
      return false;
    }
    // 一番上までスクロールしたら false
    if (controller.position.minScrollExtent == controller.position.pixels) {
      return false;
    }
    return _getScrollDirection(controller) == ScrollDirection.reverse;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final controller = PrimaryScrollController.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        if (controller.positions.isEmpty) {
          return const SizedBox.shrink();
        }
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: _isMovingToBottom(controller) ? 0.4 : 1.0,
          child: child,
        );
      },
      child: BottomAppBar(
        color: Colors.transparent,
        padding: EdgeInsets.zero,
        elevation: 0,
        height: height,
        child: Padding(
          padding: padding,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: blur,
                sigmaX: blur,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorScheme.surface.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: colorScheme.onSurfaceVariant.withOpacity(0.6),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (var i = 0; i < items.length; i++)
                      TweenAnimationBuilder<double>(
                        tween: Tween(
                          end: i == currentIndex ? 1.0 : 0.0,
                        ),
                        // curve: curve,
                        duration: const Duration(milliseconds: 100),
                        builder: (context, width, _) {
                          return InkWell(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(
                                    i == currentIndex
                                        ? items[i].selectedIcon
                                        : items[i].unselectedIcon,
                                    color: i == currentIndex
                                        ? selectedColor
                                        : unselectedColor,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: ClipRect(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      widthFactor: width,
                                      child: Container(
                                        height: 2,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          color: selectedColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              if (i == currentIndex) {
                                controller.scrollToTop();
                              } else {
                                HapticFeedback.lightImpact();
                                _lastScrollDirection = ScrollDirection.idle;
                                onIndexSelected(i);
                              }
                            },
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _animatedMoveTopButton({
    required ColorScheme colorScheme,
    required ScrollController controller,
  }) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        if (controller.positions.isEmpty) {
          return const SizedBox.shrink();
        }
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: _isMovingToBottom(controller) ? 1 : 0,
          child: child,
        );
      },
      child: BottomAppBar(
        color: Colors.transparent,
        padding: EdgeInsets.zero,
        elevation: 0,
        height: height,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaY: blur,
                    sigmaX: blur,
                  ),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      // color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: colorScheme.onSurfaceVariant.withOpacity(0.6),
                      ),
                    ),
                    child: InkWell(
                      onTap: controller.scrollToTop,
                      child: const Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

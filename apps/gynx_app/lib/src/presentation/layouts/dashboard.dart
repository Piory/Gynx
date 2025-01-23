import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gynx_app/src/presentation/layouts/glass_navigation_bar.dart';
import 'package:gynx_app/src/presentation/notifications/scroll_controller_notification.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ScrollController? _primaryScrollController;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return NotificationListener<ScrollControllerNotification>(
      onNotification: (notification) {
        if (notification.controller != _primaryScrollController) {
          setState(() {
            _primaryScrollController = notification.controller;
          });
        }
        return true;
      },
      child: PrimaryScrollController(
        controller:
            _primaryScrollController ?? PrimaryScrollController.of(context),
        child: CupertinoScaffold(
          body: Scaffold(
            body: widget.navigationShell,
            extendBody: true,
            bottomNavigationBar: GlassNavigationBar(
              currentIndex: widget.navigationShell.currentIndex,
              onIndexSelected: (i) => widget.navigationShell.goBranch(i),
              padding: const EdgeInsets.symmetric(
                horizontal: SpaceSize.s32,
              ),
              selectedColor: colorScheme.primary,
              unselectedColor: colorScheme.onSurfaceVariant.withOpacity(0.9),
              items: const [
                NavigationBarItem(
                  selectedIcon: IconlyBold.home,
                  unselectedIcon: IconlyLight.home,
                ),
                NavigationBarItem(
                  selectedIcon: IconlyBold.profile,
                  unselectedIcon: IconlyLight.profile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

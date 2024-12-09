import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gynx_core/src/infrastructure/router/pages/bar_modal_bottom_sheet_page.dart';
import 'package:gynx_core/src/infrastructure/router/pages/cupertino_modal_bottom_sheet_page.dart';
import 'package:gynx_core/src/interface/pages/sign_in/sign_in_view.dart';
import 'package:gynx_core/src/interface/pages/sign_up/sign_up_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

part '../../generated/src/infrastructure/router/go_router.g.dart';
part 'branchs/home_branch.dart';
part 'branchs/profile_branch.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: kDebugMode,
  routes: $appRoutes,
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: const Scaffold(
      body: Center(
        child: Text('Page not found'),
      ),
    ),
  ),
);

@TypedStatefulShellRoute<MainShellRouteData>(
  branches: [
    homeStatefulShellBranch,
    profileStatefulShellBranch,
  ],
)
class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return CupertinoScaffold(
      body: AppNavigationBar(
        navigationShell: navigationShell,
      ),
    );
  }
}

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}

@TypedGoRoute<SignInRoute>(path: '/sign-in')
class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return BarModalBottomSheetPage(
      key: state.pageKey,
      builder: (context) => const SignInView(),
    );
  }
}

@TypedGoRoute<SignUpRoute>(path: '/sign-up')
class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CupertinoModalBottomSheetPage(
      key: state.pageKey,
      builder: (context) => const SignUpView(),
    );
  }
}

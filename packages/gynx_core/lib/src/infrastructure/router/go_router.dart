import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gynx_core/src/interface/pages/sign_in/sign_in_view.dart';
import 'package:gynx_core/src/interface/pages/sign_up/sign_up_view.dart';

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
    return AppNavigationBar(
      navigationShell: navigationShell,
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

// @TypedStatefulShellBranch(
//   routes: [
//     TypedGoRoute<RootRoute>(path: '/'),
//   ],
// )
// class HomeShellRoute extends StatefulShellBranch {
//   const HomeShellRoute();
//
//   @override
//   Widget builder(BuildContext context, GoRouterState state) {
//     return const MainShellRouteData();
//   }
// }

@TypedGoRoute<RootRoute>(
  path: '/test',
  routes: [
    TypedGoRoute<SignInRoute>(path: '/sign-in'),
    TypedGoRoute<SignUpRoute>(path: '/sign-up'),
  ],
)
class RootRoute extends GoRouteData {
  const RootRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SignInView();
}

class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SignInView();
}

class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SignUpView();
}

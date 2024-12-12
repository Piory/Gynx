import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart';
import 'package:gynx_app/src/interface/pages/profile/profile_view.dart';
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part '../../generated/src/infrastructure/router/go_router.g.dart';
part 'branchs/home_branch.dart';
part 'branchs/profile_branch.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    routes: $appRoutes,
    // redirect: (context, state) {
    //   if (state.uri.host == 'oauth2-callback' &&
    //       state.uri.scheme == 'com.piory.gynx.local') {
    //     if (state.uri.queryParameters['error'] != null) {
    //       return '/oauth2-error?${state.uri.query}';
    //     }
    //   }
    //   return '${state.uri.path}?${state.uri.query}';
    // },
    errorPageBuilder: (context, state) {
      print('Page not found. state.uri.path: ${state.uri.path}');
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text('Page not found. state.uri.path: ${state.uri.path}'),
          ),
        ),
      );
    });

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
    GetIt.I<SupabaseClient>().auth.onAuthStateChange.listen((data) {
      if (data.session == null && context.mounted) {
        const RootRoute().pushReplacement(context);
      }
    });
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // NavigationDestination(
          //   icon: Icon(Icons.search),
          //   label: 'Search',
          // ),
          // NavigationDestination(
          //   icon: Icon(Icons.notifications),
          //   label: 'Notifications',
          // ),
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

@TypedGoRoute<RootRoute>(path: '/')
class RootRoute extends GoRouteData {
  const RootRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return GetIt.I<AuthRepository>().isSignedIn() ? '/home' : null;
  }

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(
      key: state.pageKey,
      fullscreenDialog: true,
      child: const SignInView(),
    );
  }
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart';
import 'package:gynx_app/src/interface/layouts/app_navigation_bar.dart';
import 'package:gynx_app/src/interface/pages/home/home_view.dart';
import 'package:gynx_app/src/interface/pages/profile/profile_view.dart';
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

part '../../generated/src/infrastructure/router/go_router.g.dart';
part 'branchs/home_branch.dart';
part 'branchs/profile_branch.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    routes: $appRoutes,
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

@TypedGoRoute<RootPageRoute>(path: '/')
class RootPageRoute extends GoRouteData {
  const RootPageRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return GetIt.I<AuthRepository>().isSignedIn()
        ? const HomePageRoute().location
        : null;
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

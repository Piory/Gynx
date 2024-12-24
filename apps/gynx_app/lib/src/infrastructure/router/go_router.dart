import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:gynx_app/src/domain/repositories/auth_repository.dart';
import 'package:gynx_app/src/infrastructure/router/pages/material_with_modals_page.dart';
import 'package:gynx_app/src/presentation/layouts/dashboard.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/navigation/page_type.dart';
import 'package:gynx_app/src/presentation/pages/edit_profile/edit_profile_page.dart';
import 'package:gynx_app/src/presentation/pages/home/home_page.dart';
import 'package:gynx_app/src/presentation/pages/profile/profile_page.dart';
import 'package:gynx_app/src/presentation/pages/sign_in/sign_in_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part '../../generated/src/infrastructure/router/go_router.g.dart';
part 'branchs/home_branch.dart';
part 'branchs/profile_branch.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final goRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: kDebugMode,
  routes: $appRoutes,
  errorPageBuilder: (context, state) {
    // TODO(Piory): Implement error page
    print('Page not found. state.uri.path: ${state.uri.path}');
    return MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text('Page not found. state.uri.path: ${state.uri.path}'),
        ),
      ),
    );
  },
);

@TypedStatefulShellRoute<DashboardShellRouteData>(
  branches: [
    homeStatefulShellBranch,
    profileStatefulShellBranch,
  ],
)
class DashboardShellRouteData extends StatefulShellRouteData {
  const DashboardShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    GetIt.I<SupabaseClient>().auth.onAuthStateChange.listen((data) {
      if (data.session == null && context.mounted) {
        GetIt.I<PageNavigator>().pushReplacement(context, PageType.root);
      }
    });
    return Dashboard(
      navigationShell: navigationShell,
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
      child: const SignInPage(),
    );
  }
}

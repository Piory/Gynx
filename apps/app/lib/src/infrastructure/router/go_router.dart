import 'dart:async';

import 'package:app/src/domain/repositories/auth_repository.dart';
import 'package:app/src/infrastructure/router/pages/material_with_modals_page.dart';
import 'package:app/src/presentation/layouts/dashboard.dart';
import 'package:app/src/presentation/pages/edit_profile/edit_profile_page.dart';
import 'package:app/src/presentation/pages/home/home_page.dart';
import 'package:app/src/presentation/pages/post_media_list_view/post_media_list_view_page.dart';
import 'package:app/src/presentation/pages/profile/profile_page.dart';
import 'package:app/src/presentation/pages/profile_avatar/profile_avatar_page.dart';
import 'package:app/src/presentation/pages/setting/setting_page.dart';
import 'package:app/src/presentation/pages/sign_in/sign_in_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

part '../../generated/src/infrastructure/router/go_router.g.dart';
part 'branchs/home_branch.dart';
part 'branchs/profile_branch.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final goRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: kDebugMode,
  routes: $appRoutes,
  errorPageBuilder: (context, state) {
    // TODO(Piory): Implement error page
    // print('Page not found. state.uri.path: ${state.uri.path}');
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
    return GetIt.I<AuthRepository>().isSignedIn() ? const HomePageRoute().location : null;
  }

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialWithModalsPage(
      key: state.pageKey,
      fullscreenDialog: true,
      child: const SignInPage(),
    );
  }
}

@TypedGoRoute<PostMediaListViewPageRoute>(
  path: '/posts/:postId/medias/:postMediaId',
)
class PostMediaListViewPageRoute extends GoRouteData {
  const PostMediaListViewPageRoute({
    required this.postId,
    required this.postMediaId,
  });

  final int postId;
  final String postMediaId;

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return GetIt.I<AuthRepository>().isSignedIn() ? null : const RootPageRoute().location;
  }

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      fullscreenDialog: true,
      key: state.pageKey,
      child: PostMediaListViewPage(
        postId: postId,
        postMediaId: postMediaId,
        from: state.uri.queryParameters['f'] ?? '',
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
    );
  }
}

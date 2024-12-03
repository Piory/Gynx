import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gynx_core/src/interface/pages/sign_in/sign_in_view.dart';
import 'package:gynx_core/src/interface/pages/sign_up/sign_up_view.dart';

part '../../generated/src/infrastructure/router/go_router.g.dart';

final goRouter = GoRouter(
  initialLocation: '/',
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

@TypedGoRoute<RootRoute>(
  path: '/',
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

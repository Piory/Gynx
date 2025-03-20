part of '../go_router.dart';

class ProfileShellBranch extends StatefulShellBranchData {
  const ProfileShellBranch();
}

const profileStatefulShellBranch = TypedStatefulShellBranch<ProfileShellBranch>(
  routes: [
    TypedGoRoute<ProfilePageRoute>(
      path: '/profile',
      // routes: const [],
    ),
  ],
);

class ProfilePageRoute extends GoRouteData {
  const ProfilePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfileView();
  }
}

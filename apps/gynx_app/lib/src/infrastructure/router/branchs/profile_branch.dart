part of '../go_router.dart';

class ProfileShellBranch extends StatefulShellBranchData {
  const ProfileShellBranch();
}

const profileStatefulShellBranch = TypedStatefulShellBranch<ProfileShellBranch>(
  routes: [
    TypedGoRoute<ProfilePageRoute>(
      path: '/profile',
      routes: [
        TypedGoRoute<ProfileSample1PageRoute>(path: '/sample1'),
        TypedGoRoute<ProfileSample2PageRoute>(path: '/sample2'),
      ],
    ),
  ],
);

class ProfilePageRoute extends GoRouteData {
  const ProfilePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Center(
      child: Text('Profile Page'),
    );
  }
}

class ProfileSample1PageRoute extends GoRouteData {
  const ProfileSample1PageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Center(
      child: Text('Profile Sample1 Page'),
    );
  }
}

class ProfileSample2PageRoute extends GoRouteData {
  const ProfileSample2PageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Center(
      child: Text('Profile Sample2 Page'),
    );
  }
}

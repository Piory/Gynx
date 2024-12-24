part of '../go_router.dart';

class ProfileShellBranch extends StatefulShellBranchData {
  const ProfileShellBranch();
}

const profileStatefulShellBranch = TypedStatefulShellBranch<ProfileShellBranch>(
  routes: [
    TypedGoRoute<ProfilePageRoute>(
      path: '/profile',
      // routes: [
      // ],
    ),
  ],
);

class ProfilePageRoute extends GoRouteData {
  const ProfilePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfilePage();
  }
}

@TypedGoRoute<EditProfilePageRoute>(path: '/profile/edit')
class EditProfilePageRoute extends GoRouteData {
  const EditProfilePageRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return GetIt.I<AuthRepository>().isSignedIn()
        ? null
        : const RootPageRoute().location;
  }

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialWithModalsPage(
      key: state.pageKey,
      fullscreenDialog: true,
      child: const EditProfilePage(),
    );
  }
}

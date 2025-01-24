part of '../go_router.dart';

class HomeShellBranch extends StatefulShellBranchData {
  const HomeShellBranch();
}

const homeStatefulShellBranch = TypedStatefulShellBranch<HomeShellBranch>(
  routes: [
    TypedGoRoute<HomePageRoute>(
      path: '/home',
      // routes: [
      // TypedGoRoute<PostMediaListViewPageRoute>(
      //   path: 'posts/:postId/medias/:index',
      // ),
      // ],
    ),
  ],
);

class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

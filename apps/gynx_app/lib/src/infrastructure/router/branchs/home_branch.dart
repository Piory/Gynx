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

@TypedGoRoute<PostMediaListViewPageRoute>(
  path: '/home/posts/:postId/medias/:index',
)
class PostMediaListViewPageRoute extends GoRouteData {
  const PostMediaListViewPageRoute({
    required this.postId,
    required this.index,
  });

  final int postId;
  final int index;

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return GetIt.I<AuthRepository>().isSignedIn()
        ? null
        : const RootPageRoute().location;
  }

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: PostMediaListViewPage(
        postId: postId,
        index: index,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}

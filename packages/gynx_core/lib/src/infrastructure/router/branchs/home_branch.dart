part of '../go_router.dart';

class HomeShellBranch extends StatefulShellBranchData {
  const HomeShellBranch();
}

const homeStatefulShellBranch = TypedStatefulShellBranch<HomeShellBranch>(
  routes: [
    TypedGoRoute<HomePageRoute>(
      path: '/home',
      routes: [
        TypedGoRoute<HomeSample1PageRoute>(path: '/sample1'),
        TypedGoRoute<HomeSample2PageRoute>(path: '/sample2'),
      ],
    ),
  ],
);

class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Home Page'),
          ElevatedButton(
            onPressed: () async => showCupertinoModalBottomSheet(
              context: context,
              useRootNavigator: true,
              builder: (context) => const Scaffold(
                body: Center(
                  child: Text('Modal'),
                ),
              ),
            ),
            child: const Text('Open Modal'),
          ),
        ],
      ),
    );
  }
}

class HomeSample1PageRoute extends GoRouteData {
  const HomeSample1PageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Center(
      child: Text('Home Sample1 Page'),
    );
  }
}

class HomeSample2PageRoute extends GoRouteData {
  const HomeSample2PageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Center(
      child: Text('Home Sample2 Page'),
    );
  }
}

part of '../go_router.dart';

class HomeShellBranch extends StatefulShellBranchData {
  const HomeShellBranch();
}

const homeStatefulShellBranch = TypedStatefulShellBranch<HomeShellBranch>(
  routes: [
    TypedGoRoute<HomePageRoute>(
      path: '/home',
      routes: [
        TypedGoRoute<HomeSample1PageRoute>(path: 'sample1'),
        TypedGoRoute<HomeSample2PageRoute>(path: 'sample2'),
      ],
    ),
  ],
);

class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  @override
  FutureOr<bool> onExit(BuildContext context, GoRouterState state) {
    return true;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            OutlinedButton(
              onPressed: () => const HomeSample1PageRoute().push<void>(context),
              child: const Text('Sample1'),
            ),
            ElevatedButton(
              onPressed: () => const RootRoute().push<void>(context),
              child: const Text('SignIn'),
            ),
            ElevatedButton(
              onPressed: () async =>
                  CupertinoScaffold.showCupertinoModalBottomSheet(
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
      ),
    );
  }
}

class HomeSample1PageRoute extends GoRouteData {
  const HomeSample1PageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Sample1 Page'),
            OutlinedButton(
              onPressed: () => const HomeSample2PageRoute().push<void>(context),
              child: const Text('Sample2'),
            ),
            ElevatedButton(
              onPressed: () async =>
                  CupertinoScaffold.showCupertinoModalBottomSheet(
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
      ),
    );
  }
}

class HomeSample2PageRoute extends GoRouteData {
  const HomeSample2PageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Sample2 Page'),
            OutlinedButton(
              onPressed: () => const HomeSample1PageRoute().push<void>(context),
              child: const Text('Sample1'),
            ),
            ElevatedButton(
              onPressed: () async =>
                  CupertinoScaffold.showCupertinoModalBottomSheet(
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
      ),
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../infrastructure/router/go_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $dashboardShellRouteData,
      $rootPageRoute,
      $postMediaListViewPageRoute,
      $profileAvatarPageRoute,
      $editProfilePageRoute,
      $settingPageRoute,
    ];

RouteBase get $dashboardShellRouteData => StatefulShellRouteData.$route(
      factory: $DashboardShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/home',
              factory: $HomePageRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/profile',
              factory: $ProfilePageRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $DashboardShellRouteDataExtension on DashboardShellRouteData {
  static DashboardShellRouteData _fromState(GoRouterState state) =>
      const DashboardShellRouteData();
}

extension $HomePageRouteExtension on HomePageRoute {
  static HomePageRoute _fromState(GoRouterState state) => const HomePageRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfilePageRouteExtension on ProfilePageRoute {
  static ProfilePageRoute _fromState(GoRouterState state) =>
      const ProfilePageRoute();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $rootPageRoute => GoRouteData.$route(
      path: '/',
      factory: $RootPageRouteExtension._fromState,
    );

extension $RootPageRouteExtension on RootPageRoute {
  static RootPageRoute _fromState(GoRouterState state) => const RootPageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $postMediaListViewPageRoute => GoRouteData.$route(
      path: '/home/posts/:postId/medias/:index',
      factory: $PostMediaListViewPageRouteExtension._fromState,
    );

extension $PostMediaListViewPageRouteExtension on PostMediaListViewPageRoute {
  static PostMediaListViewPageRoute _fromState(GoRouterState state) =>
      PostMediaListViewPageRoute(
        postId: int.parse(state.pathParameters['postId']!),
        index: int.parse(state.pathParameters['index']!),
      );

  String get location => GoRouteData.$location(
        '/home/posts/${Uri.encodeComponent(postId.toString())}/medias/${Uri.encodeComponent(index.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $profileAvatarPageRoute => GoRouteData.$route(
      path: '/profile/avatar',
      factory: $ProfileAvatarPageRouteExtension._fromState,
    );

extension $ProfileAvatarPageRouteExtension on ProfileAvatarPageRoute {
  static ProfileAvatarPageRoute _fromState(GoRouterState state) =>
      const ProfileAvatarPageRoute();

  String get location => GoRouteData.$location(
        '/profile/avatar',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $editProfilePageRoute => GoRouteData.$route(
      path: '/profile/edit',
      factory: $EditProfilePageRouteExtension._fromState,
    );

extension $EditProfilePageRouteExtension on EditProfilePageRoute {
  static EditProfilePageRoute _fromState(GoRouterState state) =>
      const EditProfilePageRoute();

  String get location => GoRouteData.$location(
        '/profile/edit',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $settingPageRoute => GoRouteData.$route(
      path: '/profile/setting',
      factory: $SettingPageRouteExtension._fromState,
    );

extension $SettingPageRouteExtension on SettingPageRoute {
  static SettingPageRoute _fromState(GoRouterState state) =>
      const SettingPageRoute();

  String get location => GoRouteData.$location(
        '/profile/setting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

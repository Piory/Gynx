import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/presentation/components/elements/notifier/visible_detect_scroll_controller_notifier.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/navigation/page_type.dart';
import 'package:gynx_app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:gynx_app/src/presentation/pages/profile/components/user_profile.dart';
import 'package:gynx_app/src/presentation/pages/profile/profile_controller.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:iconly/iconly.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ColorfulSafeArea(
        bottom: false,
        child: DefaultTabController(
          length: 2,
          child: VisibleDetectScrollControllerNotifier(
            visibleDetectorKey: const Key('profile'),
            child: ExtendedNestedScrollView(
              onlyOneScrollInBody: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    actions: [
                      IconButton(
                        icon: Icon(
                          IconlyBold.setting,
                          color: theme.colorScheme.primary,
                          size: 28,
                        ),
                        onPressed: () => GetIt.I<PageNavigator>().push(
                          context,
                          PageType.setting,
                        ),
                      ),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Consumer(
                      builder: (context, ref, _) {
                        return ref.watch(suiteUserNotifierProvider).when(
                              data: (suiteUser) => UserProfile(
                                suiteUser: suiteUser,
                              ),
                              loading: () => const UserProfile.loading(),
                              error: (error, _) => const UserProfile.loading(),
                            );
                      },
                    ),
                  ),
                  const SliverGap(SpaceSize.s8),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _StickyTabBarDelegate(
                      TabBar(
                        tabs: [
                          Tab(
                            text: context.l10n.posts,
                            height: 56,
                          ),
                          Tab(
                            text: context.l10n.favorites,
                            height: 56,
                          ),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  ListView.separated(
                    padding: const EdgeInsets.only(top: SpaceSize.s8),
                    itemCount: 100,
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 0,
                        color: theme.colorScheme.onSurfaceVariant
                            .withOpacity(0.15),
                      );
                    },
                    // itemBuilder: (context, index) => const Post(),
                    itemBuilder: (context, index) => const SizedBox.shrink(),
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.only(top: SpaceSize.s8),
                    itemCount: 100,
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 0,
                        color: theme.colorScheme.onSurfaceVariant
                            .withOpacity(0.15),
                      );
                    },
                    itemBuilder: (context, index) => ListTile(
                      title: ElevatedButton(
                        onPressed: () =>
                            GetIt.I<ProfileController>().signOut(context.l10n),
                        child: const Text('Sign Out'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height * 0.7;

  @override
  double get maxExtent => tabBar.preferredSize.height * 0.7;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/interface/pages/profile/components/user_profile.dart';
import 'package:gynx_app/src/interface/pages/profile/profile_controller.dart';
import 'package:gynx_components/gynx_components.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:iconly/iconly.dart';

class ProfileView extends CleanView {
  const ProfileView({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends CleanViewState<ProfileView, ProfileController> {
  _ProfileViewState()
      : super(
          GetIt.I<ProfileController>(),
        );

  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      extendBodyBehindAppBar: true,
      body: ColorfulSafeArea(
        bottom: false,
        child: DefaultTabController(
          length: 2,
          child: ControlledWidgetBuilder<ProfileController>(
            builder: (context, controller) {
              final theme = Theme.of(context);
              return VisibleDetectScrollControllerNotifier(
                visibleDetectorKey: const Key('profile'),
                child: ExtendedNestedScrollView(
                  onlyOneScrollInBody: true,
                  pinnedHeaderSliverHeightBuilder: () =>
                      kToolbarHeight + MediaQuery.of(context).viewPadding.top,
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
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SliverToBoxAdapter(
                        child: UserProfile(
                          isLoading: controller.suiteUser == null,
                          suiteUser: controller.suiteUser,
                        ),
                      ),
                      const SliverGap(SpaceSize.s16),
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
                        itemBuilder: (context, index) => const Post(),
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
                            onPressed: controller.signOut,
                            child: Text('Sign Out'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
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

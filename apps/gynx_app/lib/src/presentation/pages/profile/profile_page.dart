import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Refreshable;
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/presentation/components/elements/lists/refreshable.dart';
import 'package:gynx_app/src/presentation/components/elements/notifier/visible_detect_scroll_controller_notifier.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post_list.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post_list_loading.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/navigation/page_type.dart';
import 'package:gynx_app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:gynx_app/src/presentation/pages/profile/components/user_profile.dart';
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
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              // print(
              // 'notification.metrics.pixels: ${notification.metrics.pixels}',
              // );
              // 一番上にいるときだけプルリフレッシュを許可
              if (notification.metrics.pixels <= 0) {
                // print('notification.metrics.pixels <= 0');
                // setState(() => _allowRefresh = true);
              } else {
                // print('notification.metrics.pixels > 0');
                // setState(() => _allowRefresh = false);
              }
              return false;
            },
            child: VisibleDetectScrollControllerNotifier(
              visibleDetectorKey: const Key('profile'),
              child: ExtendedNestedScrollView(
                onlyOneScrollInBody: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      stretch: true,
                      onStretchTrigger: () async {
                        const sleepDuration = Duration(seconds: 1);
                        await Future<void>.delayed(sleepDuration);
                      },
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
                    Refreshable(
                      onRefresh: () async {
                        const sleepDuration = Duration(seconds: 1);
                        await Future<void>.delayed(sleepDuration);
                      },
                    ),
                    const SliverToBoxAdapter(
                      child: UserProfile(),
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
                    Consumer(
                      key: const Key('posts'),
                      builder: (context, ref, _) {
                        final vUserDetail = ref.watch(
                          suiteUserNotifierProvider.select(
                            (value) => value.value?.vUserDetail,
                          ),
                        );
                        if (vUserDetail == null) {
                          return const PostListLoading();
                        }
                        return PostList(
                          from: '${vUserDetail.userId}-posts',
                          onFetchData: ref
                              .read(suiteUserNotifierProvider.notifier)
                              .fetchPreviousForLatestPosts,
                          postIdList: vUserDetail.latestPostList.postIdList,
                          wantKeepAlive: true,
                        );
                      },
                    ),
                    Consumer(
                      key: const Key('favorites'),
                      builder: (context, ref, _) {
                        final vUserDetail = ref.watch(
                          suiteUserNotifierProvider.select(
                            (value) => value.value?.vUserDetail,
                          ),
                        );
                        if (vUserDetail == null) {
                          return const PostListLoading();
                        }
                        return PostList(
                          from: '${vUserDetail.userId}-favorite',
                          onFetchData: ref
                              .read(suiteUserNotifierProvider.notifier)
                              .fetchPreviousForFavoritePosts,
                          postIdList: vUserDetail.favoritePostList.postIdList,
                          emptyIcon: const Icon(
                            IconlyBold.star,
                            size: 48,
                          ),
                          emptyMessage: context.l10n.favoritePostListEmpty,
                          wantKeepAlive: true,
                        );
                      },
                    ),
                  ],
                ),
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

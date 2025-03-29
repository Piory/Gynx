import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Refreshable;
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/presentation/components/elements/lists/refreshable_custom_scroll_view.dart';
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

class ProfilePage extends ConsumerWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ColorfulSafeArea(
        bottom: false,
        child: DefaultTabController(
          length: 2,
          child: VisibleDetectScrollControllerNotifier(
            visibleDetectorKey: const Key('profile'),
            child: RefreshableCustomScrollView(
              onRefresh: () => ref.refresh(suiteUserNotifierProvider.future),
              sliverAppBar: SliverAppBar(
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
              slivers: [
                const SliverToBoxAdapter(
                  child: UserProfile(),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _StickyTabBarDelegate(
                    TabBar(
                      tabs: [
                        Tab(text: context.l10n.posts, height: 56),
                        Tab(text: context.l10n.favorites, height: 56),
                      ],
                    ),
                  ),
                ),
                const SliverGap(SpaceSize.s8),
                SliverFillRemaining(
                  child: TabBarView(
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
              ],
              // ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _StickyTabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

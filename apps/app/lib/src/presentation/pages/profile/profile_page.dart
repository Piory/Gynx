import 'package:app/src/presentation/components/elements/lists/pull_to_refresh.dart';
import 'package:app/src/presentation/components/elements/notifier/visible_detect_scroll_controller_notifier.dart';
import 'package:app/src/presentation/components/parts/posts/post_list.dart';
import 'package:app/src/presentation/components/parts/posts/post_list_loading.dart';
import 'package:app/src/presentation/navigation/page_navigator.dart';
import 'package:app/src/presentation/navigation/page_type.dart';
import 'package:app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:app/src/presentation/pages/profile/components/user_profile.dart';
import 'package:config/config.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:iconly/iconly.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      bottom: false,
      child: DefaultTabController(
        length: 2,
        child: VisibleDetectScrollControllerNotifier(
          visibleDetectorKey: const Key('profile'),
          child: PullToRefresh(
            onRefresh: () => ref.refresh(suiteUserNotifierProvider.future),
            notificationPredicate: (notification) => notification.depth == 2,
            child: ExtendedNestedScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              onlyOneScrollInBody: true,
              pinnedHeaderSliverHeightBuilder: () {
                return 0;
              },
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    stretch: true,
                    onStretchTrigger: () async {
                      debugPrint('onStretchTrigger');
                      await Future<void>.delayed(const Duration(seconds: 2));
                    },
                    flexibleSpace: FlexibleSpaceBar(
                      stretchModes: const [
                        StretchMode.zoomBackground,
                        StretchMode.fadeTitle,
                      ],
                      background: ColoredBox(
                        color: theme.colorScheme.surface,
                      ),
                    ),
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
                        onFetchData: ref.read(suiteUserNotifierProvider.notifier).fetchPreviousForLatestPosts,
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
                        onFetchData: ref.read(suiteUserNotifierProvider.notifier).fetchPreviousForFavoritePosts,
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

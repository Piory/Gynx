import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post_list_empty.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/sliver_post_list_loading.dart';
import 'package:gynx_app/src/presentation/notifiers/timeline_notifier.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class SliverFollowTimeline extends ConsumerStatefulWidget {
  const SliverFollowTimeline({
    super.key,
  });

  @override
  ConsumerState<SliverFollowTimeline> createState() =>
      _SliverFollowTimelineState();
}

class _SliverFollowTimelineState extends ConsumerState<SliverFollowTimeline> {
  var _isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(timelineNotifierProvider.notifier).fetchNext();
      setState(() {
        _isInitialized = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const SliverPostListLoading();
    }
    final isLoading = ref.watch(
      timelineNotifierProvider.select((state) => state.isLoading),
    );
    final length = ref.watch(
      timelineNotifierProvider.select(
        (state) => state.value?.postIdList.length ?? 0,
      ),
    );
    final notifier = ref.read(timelineNotifierProvider.notifier);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return SliverInfiniteList(
      isLoading: isLoading,
      itemCount: length,
      onFetchData: () async {
        final isNoMorePost = ref.read(
          timelineNotifierProvider.select(
            (state) => state.value?.isNoMorePost ?? false,
          ),
        );
        if (isNoMorePost) {
          return;
        }
        await notifier.fetchPrevious();
      },
      itemBuilder: (context, index) {
        return Post(
          from: 'follow',
          postId: notifier.getByIndex(index),
        );
      },
      separatorBuilder: (context, index) => Divider(
        height: 0,
        color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.15),
      ),
      centerEmpty: true,
      loadingBuilder: (context) => LoadingAnimationWidget.inkDrop(
        color: colorScheme.primary,
        size: 28,
      ),
      emptyBuilder: (context) => const PostListEmpty(),
    );
  }
}

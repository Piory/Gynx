import 'package:flutter/material.dart';
import 'package:gynx_app/src/domain/models/post_id_list.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post_list_empty.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class SliverPostList extends StatefulWidget {
  const SliverPostList({
    super.key,
    required this.from,
    required this.onFetchData,
    required this.postIdList,
    this.emptyIcon,
    this.emptyMessage,
  });

  final String from;
  final Future<bool> Function() onFetchData;
  final PostIdList postIdList;
  final Icon? emptyIcon;
  final String? emptyMessage;

  @override
  State<SliverPostList> createState() => _SliverPostListState();
}

class _SliverPostListState extends State<SliverPostList> {
  bool _isLoading = false;
  bool _isNoMoreData = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return SliverInfiniteList(
      isLoading: !_isNoMoreData && _isLoading,
      itemCount: widget.postIdList.length,
      onFetchData: () async {
        if (_isNoMoreData) {
          return;
        }
        setState(() {
          _isLoading = true;
        });
        final isNoMoreData = await widget.onFetchData();
        if (mounted) {
          setState(() {
            _isLoading = false;
            _isNoMoreData = isNoMoreData;
          });
        }
      },
      itemBuilder: (context, index) => Post(
        from: widget.from,
        postId: widget.postIdList.getByIndex(index),
      ),
      separatorBuilder: (context, index) => Divider(
        height: 0,
        color: theme.colorScheme.onSurfaceVariant.withOpacity(0.15),
      ),
      centerLoading: true,
      centerEmpty: true,
      loadingBuilder: (context) => LoadingAnimationWidget.inkDrop(
        color: colorScheme.primary,
        size: 28,
      ),
      emptyBuilder: (context) => PostListEmpty(
        icon: widget.emptyIcon,
        message: widget.emptyMessage,
      ),
    );
  }
}

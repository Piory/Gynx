import 'package:app/src/domain/models/post_id_list.dart';
import 'package:app/src/presentation/components/parts/posts/post.dart';
import 'package:app/src/presentation/components/parts/posts/post_list_empty.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class PostList extends StatefulWidget {
  const PostList({
    super.key,
    required this.from,
    required this.onFetchData,
    required this.postIdList,
    this.emptyIcon,
    this.emptyMessage,
    this.wantKeepAlive = false,
  });

  final String from;
  final Future<bool> Function() onFetchData;
  final PostIdList postIdList;
  final Icon? emptyIcon;
  final String? emptyMessage;
  final bool wantKeepAlive;

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> with AutomaticKeepAliveClientMixin {
  var _isLoading = false;
  var _isNoMoreData = false;

  @override
  bool get wantKeepAlive => widget.wantKeepAlive;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return InfiniteList(
      isLoading: !_isNoMoreData && _isLoading,
      itemCount: widget.postIdList.length,
      onFetchData: () async {
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
        color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.15),
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

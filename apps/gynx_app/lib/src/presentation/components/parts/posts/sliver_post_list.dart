import 'package:flutter/material.dart';
import 'package:gynx_app/src/domain/models/v_post_list.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post_list_empty.dart';

class SliverPostList extends StatelessWidget {
  const SliverPostList({
    super.key,
    required this.from,
    required this.vPostList,
    this.emptyIcon,
    this.emptyMessage,
  });

  final String from;
  final VPostList vPostList;
  final Icon? emptyIcon;
  final String? emptyMessage;

  @override
  Widget build(BuildContext context) {
    if (vPostList.isEmpty) {
      return SliverFillRemaining(
        child: PostListEmpty(
          icon: emptyIcon,
          message: emptyMessage,
        ),
      );
    }
    final theme = Theme.of(context);
    return SliverList.separated(
      itemCount: vPostList.length,
      separatorBuilder: (context, index) => Divider(
        height: 0,
        color: theme.colorScheme.onSurfaceVariant.withOpacity(0.15),
      ),
      itemBuilder: (context, index) => Post(
        from: from,
        vPost: vPostList.getByIndex(index),
      ),
    );
  }
}

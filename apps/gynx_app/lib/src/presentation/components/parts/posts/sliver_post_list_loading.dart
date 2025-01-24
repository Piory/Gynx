import 'package:flutter/material.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post_loading.dart';

class SliverPostListLoading extends StatelessWidget {
  const SliverPostListLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        for (var i = 0; i < 10; i++) const PostLoading(),
      ],
    );
  }
}

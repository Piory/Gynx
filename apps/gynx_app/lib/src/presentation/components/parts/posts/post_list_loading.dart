import 'package:flutter/material.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post_loading.dart';

class PostListLoading extends StatelessWidget {
  const PostListLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (var i = 0; i < 10; i++) const PostLoading(),
      ],
    );
  }
}

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class GlassSliverAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlassSliverAppBar({
    super.key,
    required this.pinned,
    this.title,
    this.bottom,
    this.onStretchTrigger,
    this.actions,
  });

  final bool pinned;
  final Widget? title;
  final PreferredSizeWidget? bottom;
  final Future<void> Function()? onStretchTrigger;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SliverAppBar(
      onStretchTrigger: onStretchTrigger,
      stretch: onStretchTrigger != null,
      pinned: pinned,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        title: title,
        background: Blur(
          blurColor: colorScheme.surface,
          blur: 10,
          colorOpacity: 0.7,
          child: const SizedBox.expand(),
        ),
      ),
      bottom: bottom,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: actions,
    );
  }
}

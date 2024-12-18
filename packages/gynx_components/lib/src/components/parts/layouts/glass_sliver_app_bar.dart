import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class GlassSliverAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlassSliverAppBar({
    super.key,
    this.title,
    this.bottom,
    this.onStretchTrigger,
    this.actions,
  });

  final Widget? title;
  final PreferredSizeWidget? bottom;
  final Future<void> Function()? onStretchTrigger;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      onStretchTrigger: onStretchTrigger,
      stretch: onStretchTrigger != null,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        title: title,
        background: const Blur(
          blur: 10,
          colorOpacity: 0,
          child: SizedBox.expand(),
        ),
      ),
      bottom: bottom,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: actions,
    );
  }
}

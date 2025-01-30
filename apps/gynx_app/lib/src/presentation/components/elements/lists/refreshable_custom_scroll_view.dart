import 'package:flutter/material.dart';
import 'package:gynx_app/src/presentation/components/elements/lists/refreshable.dart';

class RefreshableCustomScrollView extends StatelessWidget {
  const RefreshableCustomScrollView({
    super.key,
    this.scrollController,
    this.backgroundColor,
    this.sliverAppBar,
    required this.onRefresh,
    required this.slivers,
  });

  final ScrollController? scrollController;
  final Color? backgroundColor;
  final Widget? sliverAppBar;
  final Future<void> Function() onRefresh;
  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor ?? Colors.transparent,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        controller: scrollController,
        slivers: [
          if (sliverAppBar != null) sliverAppBar!,
          Refreshable(
            onRefresh: onRefresh,
          ),
          ...slivers,
        ],
      ),
    );
  }
}

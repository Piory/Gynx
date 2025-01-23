import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart' as shimmer;

class Shimmer extends StatelessWidget {
  const Shimmer.rectangular({
    super.key,
    required this.width,
    required this.height,
  }) : shapeBorder = const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        );

  const Shimmer.circular({
    super.key,
    required double radius,
  })  : width = radius * 2,
        height = radius * 2,
        shapeBorder = const CircleBorder();

  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final baseColor = colorScheme.onSurface.withOpacity(0.1);
    final highlightColor = colorScheme.onSurface.withOpacity(0.05);
    return shimmer.Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: colorScheme.surface,
          shape: shapeBorder,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gynx_app/src/presentation/components/elements/medias/media.dart';

class MediaForTwo extends StatelessWidget {
  const MediaForTwo({
    super.key,
    required this.urls,
    required this.heroTagGenerator,
    required this.onTap,
    required this.onClosed,
  }) : assert(urls.length == 2);

  final List<String> urls;
  final String Function(String) heroTagGenerator;
  final ValueSetter<String>? onTap;
  final ValueSetter<String>? onClosed;

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 16,
      crossAxisSpacing: 4,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 8,
          mainAxisCellCount: 9,
          child: Media(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            fit: BoxFit.cover,
            url: urls.first,
            heroTagGenerator: heroTagGenerator,
            onTap: onTap,
            onClosed: onClosed,
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 8,
          mainAxisCellCount: 9,
          child: Media(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            fit: BoxFit.cover,
            url: urls[1],
            heroTagGenerator: heroTagGenerator,
            onTap: onTap,
            onClosed: onClosed,
          ),
        ),
      ],
    );
  }
}

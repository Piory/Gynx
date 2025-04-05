import 'package:app/src/presentation/components/elements/medias/media_for_four.dart';
import 'package:app/src/presentation/components/elements/medias/media_for_one.dart';
import 'package:app/src/presentation/components/elements/medias/media_for_three.dart';
import 'package:app/src/presentation/components/elements/medias/media_for_two.dart';
import 'package:flutter/material.dart';

class MediaList extends StatelessWidget {
  const MediaList({
    super.key,
    required this.urls,
    required this.heroTagGenerator,
    this.onTap,
    this.onClosed,
  });

  final List<String> urls;
  final String Function(String) heroTagGenerator;
  final ValueSetter<String>? onTap;
  final ValueSetter<String>? onClosed;

  @override
  Widget build(BuildContext context) {
    switch (urls.length) {
      case 1:
        return MediaForOne(
          url: urls.single,
          heroTagGenerator: heroTagGenerator,
          onTap: onTap,
          onClosed: onClosed,
        );
      case 2:
        return MediaForTwo(
          urls: urls,
          heroTagGenerator: heroTagGenerator,
          onTap: onTap,
          onClosed: onClosed,
        );
      case 3:
        return MediaForThree(
          urls: urls,
          heroTagGenerator: heroTagGenerator,
          onTap: onTap,
          onClosed: onClosed,
        );
      case 4:
        return MediaForFour(
          urls: urls,
          heroTagGenerator: heroTagGenerator,
          onTap: onTap,
          onClosed: onClosed,
        );
      default:
        throw UnimplementedError(
          'MediaList for ${urls.length} is not implemented',
        );
    }
  }
}

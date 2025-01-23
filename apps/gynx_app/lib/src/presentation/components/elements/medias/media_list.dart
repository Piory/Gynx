import 'package:flutter/material.dart';
import 'package:gynx_app/src/presentation/components/elements/medias/media_for_four.dart';
import 'package:gynx_app/src/presentation/components/elements/medias/media_for_one.dart';
import 'package:gynx_app/src/presentation/components/elements/medias/media_for_three.dart';
import 'package:gynx_app/src/presentation/components/elements/medias/media_for_two.dart';

class MediaList extends StatelessWidget {
  const MediaList({
    super.key,
    required this.urls,
    this.onTap,
    this.onClosed,
  });

  final List<String> urls;
  final ValueSetter<String>? onTap;
  final ValueSetter<String>? onClosed;

  @override
  Widget build(BuildContext context) {
    switch (urls.length) {
      case 1:
        return MediaForOne(
          url: urls.single,
          onTap: onTap,
          onClosed: onClosed,
        );
      case 2:
        return MediaForTwo(
          urls: urls,
          onTap: onTap,
          onClosed: onClosed,
        );
      case 3:
        return MediaForThree(
          urls: urls,
          onTap: onTap,
          onClosed: onClosed,
        );
      case 4:
        return MediaForFour(
          urls: urls,
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

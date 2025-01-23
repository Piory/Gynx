import 'package:flutter/material.dart';
import 'package:gynx_app/src/presentation/components/elements/medias/media.dart';
import 'package:gynx_app/src/presentation/utils/image_util.dart';

class MediaForOne extends StatefulWidget {
  const MediaForOne({
    super.key,
    required this.url,
    required this.onTap,
    required this.onClosed,
  });

  final String url;
  final ValueSetter<String>? onTap;
  final ValueSetter<String>? onClosed;

  @override
  State<MediaForOne> createState() => _MediaForOneState();
}

class _MediaForOneState extends State<MediaForOne> {
  double? _aspectRatio;
  late final ImageProvider _imageProvider;

  @override
  void initState() {
    super.initState();
    _imageProvider = ImageUtil.imageProvider(widget.url);
    _imageProvider.resolve(ImageConfiguration.empty).addListener(
      ImageStreamListener((info, _) {
        final image = info.image;
        setState(() {
          _aspectRatio = image.width / image.height;
        });
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
            maxHeight: maxWidth * (4 / 3),
          ),
          child: SizedBox(
            width: maxWidth,
            height: maxWidth / (_aspectRatio ?? 0),
            child: Media(
              borderRadius: BorderRadius.circular(12),
              fit: BoxFit.fitWidth,
              url: widget.url,
              onTap: widget.onTap,
              onClosed: widget.onClosed,
            ),
          ),
        );
      },
    );
  }
}

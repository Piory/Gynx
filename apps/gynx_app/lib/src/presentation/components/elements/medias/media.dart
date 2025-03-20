import 'package:flutter/material.dart';
import 'package:gynx_app/src/presentation/utils/image_util.dart';

class Media extends StatelessWidget {
  const Media({
    super.key,
    required this.borderRadius,
    required this.fit,
    required this.url,
    required this.heroTagGenerator,
    required this.onTap,
    required this.onClosed,
  });

  final BorderRadius borderRadius;
  final BoxFit fit;
  final String url;
  final String Function(String) heroTagGenerator;
  final ValueSetter<String>? onTap;
  final ValueSetter<String>? onClosed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          tag: heroTagGenerator(url),
          child: InkWell(
            onTap: () => onTap?.call(url),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                image: DecorationImage(
                  fit: fit,
                  image: ImageUtil.imageProvider(url),
                ),
              ),
            ),
          ),
        ),
        if (onClosed != null)
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  size: 20,
                ),
                style: ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: WidgetStateProperty.all(
                    Colors.black.withValues(alpha: 0.8),
                  ),
                  padding: WidgetStateProperty.all(const EdgeInsets.all(4)),
                  iconColor: WidgetStateProperty.all(Colors.white),
                  shape: WidgetStateProperty.all(const CircleBorder()),
                ),
                constraints: const BoxConstraints(),
                onPressed: () => onClosed!(url),
              ),
            ),
          ),
      ],
    );
  }
}

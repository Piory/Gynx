import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  const GradientBox({
    super.key,
    required this.child,
    this.shape = BoxShape.rectangle,
  }) : isContainerColor = false;

  const GradientBox.containerColor({
    super.key,
    required this.child,
    this.shape = BoxShape.rectangle,
  }) : isContainerColor = true;

  final Widget child;
  final bool isContainerColor;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: shape,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            isContainerColor
                ? colorScheme.secondaryContainer
                : colorScheme.secondary,
            isContainerColor
                ? colorScheme.primaryContainer
                : colorScheme.primary,
            // Color(0xFF2C001C),
            // Color(0xFF120030),
          ],
        ),
      ),
      child: child,
    );
  }
}

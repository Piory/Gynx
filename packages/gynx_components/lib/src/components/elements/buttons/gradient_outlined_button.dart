import 'package:flutter/material.dart';

class GradientOutlinedButton extends StatelessWidget {
  const GradientOutlinedButton({
    super.key,
    this.style,
    required this.onPressed,
    required this.child,
  });

  final ButtonStyle? style;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          colorScheme.secondary,
          colorScheme.primary,
        ],
      ).createShader(bounds),
      child: OutlinedButton(
        onPressed: onPressed,
        style: style,
        child: child,
      ),
    );
  }
}

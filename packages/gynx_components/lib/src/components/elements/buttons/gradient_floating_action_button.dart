import 'package:flutter/material.dart';
import 'package:gynx_components/src/components/elements/boxes/gradient_box.dart';

class GradientFloatingActionButton extends StatelessWidget {
  const GradientFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      onPressed: onPressed,
      child: GradientBox(
        shape: BoxShape.circle,
        child: SizedBox(
          width: 56,
          height: 56,
          child: child,
        ),
      ),
    );
  }
}

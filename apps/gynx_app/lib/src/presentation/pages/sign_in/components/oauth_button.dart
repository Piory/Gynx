import 'package:flutter/material.dart';

class OAuthButton extends StatelessWidget {
  const OAuthButton({
    super.key,
    required this.backgroundColor,
    required this.borderRadius,
    required this.text,
    required this.child,
    required this.onPressed,
  });

  final Color backgroundColor;
  final BorderRadius borderRadius;
  final Widget text;
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: backgroundColor,
      ),
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            text,
            Positioned(
              left: 20,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

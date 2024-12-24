import 'package:flutter/material.dart';
import 'package:gynx_app/src/presentation/pages/sign_in/components/oauth_button.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:icons_plus/icons_plus.dart';

class AppleOAuthButton extends StatelessWidget {
  const AppleOAuthButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OAuthButton(
      backgroundColor: Colors.white,
      borderRadius: BorderRadius.circular(20),
      text: Text(
        context.l10n.continueWithApple,
        style: theme.textTheme.labelLarge!.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      onPressed: onPressed,
      child: const Icon(
        BoxIcons.bxl_apple,
        color: Colors.black,
        size: 24,
      ),
    );
  }
}

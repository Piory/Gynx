import 'package:app/src/presentation/pages/sign_in/components/oauth_button.dart';
import 'package:flutter/material.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:icons_plus/icons_plus.dart';

class GoogleOAuthButton extends StatelessWidget {
  const GoogleOAuthButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OAuthButton(
      backgroundColor: const Color(0xFFF2F2F2),
      borderRadius: BorderRadius.circular(20),
      text: Text(
        context.l10n.continueWithGoogle,
        style: theme.textTheme.labelLarge!.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      onPressed: onPressed,
      child: Brand(
        Brands.google,
        size: 24,
      ),
    );
  }
}

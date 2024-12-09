import 'package:flutter/material.dart';
import 'package:gynx_app/src/generated/assets/assets.gen.dart';
import 'package:gynx_app/src/interface/pages/sign_in/components/oauth_button.dart';
import 'package:gynx_l10n/gynx_l10n.dart';

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
      child: Assets.logos.google.image(
        width: 40,
        height: 40,
      ),
    );
  }
}

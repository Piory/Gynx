import 'package:flutter/material.dart';
import 'package:gynx_app/src/generated/assets/assets.gen.dart';
import 'package:gynx_app/src/interface/pages/sign_in/components/oauth_button.dart';
import 'package:gynx_l10n/gynx_l10n.dart';

class DiscordOAuthButton extends StatelessWidget {
  const DiscordOAuthButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OAuthButton(
      backgroundColor: const Color(0xFF5865F2),
      borderRadius: BorderRadius.zero,
      text: Text(context.l10n.continueWithDiscord),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Assets.logos.discord.image(
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}

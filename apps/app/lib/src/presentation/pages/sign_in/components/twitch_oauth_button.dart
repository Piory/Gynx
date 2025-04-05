import 'package:app/src/generated/assets/assets.gen.dart';
import 'package:app/src/presentation/pages/sign_in/components/oauth_button.dart';
import 'package:flutter/material.dart';
import 'package:gynx_l10n/gynx_l10n.dart';

class TwitchOAuthButton extends StatelessWidget {
  const TwitchOAuthButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OAuthButton(
      backgroundColor: const Color(0xFF9146FF),
      borderRadius: BorderRadius.zero,
      text: Text(context.l10n.continueWithTwitch),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Assets.logos.twitch.image(
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gynx_app/src/generated/assets/assets.gen.dart';
import 'package:gynx_app/src/interface/pages/sign_in/components/oauth_button.dart';
import 'package:gynx_l10n/gynx_l10n.dart';

class XOAuthButton extends StatelessWidget {
  const XOAuthButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OAuthButton(
      backgroundColor: Colors.black,
      borderRadius: BorderRadius.zero,
      text: Text(context.l10n.continueWithX),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(11),
        child: Assets.logos.x.image(
          width: 18,
          height: 18,
        ),
      ),
    );
  }
}

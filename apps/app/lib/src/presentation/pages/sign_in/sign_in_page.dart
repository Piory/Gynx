import 'package:app/src/generated/assets/assets.gen.dart';
import 'package:app/src/presentation/components/elements/boxes/gradient_box.dart';
import 'package:app/src/presentation/components/elements/buttons/gradient_outlined_button.dart';
import 'package:app/src/presentation/pages/sign_in/components/apple_oauth_button.dart';
import 'package:app/src/presentation/pages/sign_in/components/google_oauth_button.dart';
import 'package:app/src/presentation/pages/sign_in/sign_in_controller.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart' hide Dialog;
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:locales/locales.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I<SignInController>();
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final colorOnSurfaceVariant = colorScheme.onSurfaceVariant;
    final l10n = context.l10n;
    return Scaffold(
      body: GradientBox.containerColor(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mediaQuery.size.width * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.svgs.logos.gynxLogoWithNameDark.svg(
                  width: 160,
                ),
                const Gap(SpaceSize.s32),
                Text(
                  l10n.signUpOrSignIn,
                  style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(SpaceSize.s64),
                Column(
                  children: [
                    AppleOAuthButton(
                      onPressed: () {},
                    ),
                    const Gap(SpaceSize.s8),
                    GoogleOAuthButton(
                      onPressed: () => controller.signInWithGoogle(l10n),
                    ),
                    const Gap(SpaceSize.s16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Divider(),
                        ),
                        const Gap(SpaceSize.s8),
                        Text(
                          l10n.or,
                          style: textTheme.bodySmall!.copyWith(
                            color: colorOnSurfaceVariant,
                          ),
                        ),
                        const Gap(SpaceSize.s8),
                        const Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),
                    const Gap(SpaceSize.s16),
                    SizedBox(
                      width: double.infinity,
                      child: GradientOutlinedButton(
                        child: Text(
                          l10n.continueAsGuest,
                          style: textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                          ),
                        ),
                        onPressed: () => controller.signInWithAnonymous(l10n),
                      ),
                    ),
                    const Gap(SpaceSize.s4),
                    Text(
                      l10n.continueAsGuestWarning,
                      style: textTheme.bodySmall!.copyWith(
                        color: colorOnSurfaceVariant,
                      ),
                    ),
                    const Gap(SpaceSize.s32),
                    Text(
                      l10n.continueIsApproveTermsOfServiceAndPrivacyPolicy,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

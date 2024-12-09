import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/constants/padding_size.dart';
import 'package:gynx_app/src/generated/assets/assets.gen.dart';
import 'package:gynx_app/src/interface/pages/sign_in/components/apple_oauth_button.dart';
import 'package:gynx_app/src/interface/pages/sign_in/components/discord_oauth_button.dart';
import 'package:gynx_app/src/interface/pages/sign_in/components/google_oauth_button.dart';
import 'package:gynx_app/src/interface/pages/sign_in/components/twitch_oauth_button.dart';
import 'package:gynx_app/src/interface/pages/sign_in/components/x_oauth_button.dart';
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_controller.dart';
import 'package:gynx_l10n/gynx_l10n.dart';

class SignInView extends CleanView {
  const SignInView({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _SignInViewState();
}

class _SignInViewState extends CleanViewState<SignInView, SignInController> {
  _SignInViewState()
      : super(
          GetIt.I<SignInController>(),
        );

  @override
  Widget get view {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      key: globalKey,
      body: SafeArea(
        child: ControlledWidgetBuilder<SignInController>(
          builder: (context, controller) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mediaQuery.size.width * 0.05,
              ),
              child: Column(
                children: [
                  const SizedBox(height: PaddingSize.s32),
                  Assets.svgs.logos.gynxLogoWithNameDark.svg(
                    width: 160,
                  ),
                  const SizedBox(height: PaddingSize.s32),
                  Text(
                    context.l10n.signInTitle,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: PaddingSize.s64),
                  Text(
                    context.l10n.signInDescription,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: PaddingSize.s12),
                  AppleOAuthButton(
                    onPressed: () {
                      print('AppleOAuthButton');
                    },
                  ),
                  const SizedBox(height: PaddingSize.s8),
                  GoogleOAuthButton(
                    onPressed: () {
                      print('GoogleOAuthButton');
                    },
                  ),
                  const SizedBox(height: PaddingSize.s8),
                  XOAuthButton(
                    onPressed: () {
                      print('XOAuthButton');
                    },
                  ),
                  const SizedBox(height: PaddingSize.s8),
                  TwitchOAuthButton(
                    onPressed: () {
                      print('TwitchOAuthButton');
                    },
                  ),
                  const SizedBox(height: PaddingSize.s8),
                  DiscordOAuthButton(
                    onPressed: () {
                      print('DiscordOAuthButton');
                    },
                  ),
                  const SizedBox(height: PaddingSize.s32),
                  Text(
                    context
                        .l10n.continueIsApproveTermsOfServiceAndPrivacyPolicy,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

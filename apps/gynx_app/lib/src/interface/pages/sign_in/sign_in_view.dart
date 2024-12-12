import 'package:flutter/material.dart' hide Dialog;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/constants/space_size.dart';
import 'package:gynx_app/src/generated/assets/assets.gen.dart';
import 'package:gynx_app/src/interface/pages/sign_in/components/apple_oauth_button.dart';
import 'package:gynx_app/src/interface/pages/sign_in/components/google_oauth_button.dart';
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_controller.dart';
import 'package:gynx_app/src/interface/router/page_router.dart';
import 'package:gynx_app/src/interface/router/page_type.dart';
import 'package:gynx_components/gynx_components.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInView extends CleanView {
  const SignInView({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _SignInViewState();
}

class _SignInViewState extends CleanViewState<SignInView, SignInController> {
  _SignInViewState()
      : _pageRouter = GetIt.I<PageRouter>(),
        _supabaseClient = GetIt.I<SupabaseClient>(),
        super(GetIt.I<SignInController>());

  final SupabaseClient _supabaseClient;
  final PageRouter _pageRouter;

  @override
  Widget get view {
    _supabaseClient.auth.onAuthStateChange.listen((data) {
      if (data.session != null && context.mounted) {
        // ignore: use_build_context_synchronously
        _pageRouter.pushReplacement(context, PageType.home);
      }
    });
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final colorOnSurfaceVariant = colorScheme.onSurfaceVariant;
    final l10n = context.l10n;
    return Scaffold(
      key: globalKey,
      body: GradientBox.containerColor(
        child: SafeArea(
          child: ControlledWidgetBuilder<SignInController>(
            builder: (context, controller) {
              return Padding(
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
                          onPressed: controller.signInWithGoogle,
                        ),
                        const Gap(SpaceSize.s16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                color: colorOnSurfaceVariant,
                              ),
                            ),
                            const Gap(SpaceSize.s8),
                            Text(
                              l10n.or,
                              style: textTheme.bodySmall!.copyWith(
                                color: colorOnSurfaceVariant,
                              ),
                            ),
                            const Gap(SpaceSize.s8),
                            Expanded(
                              child: Divider(
                                color: colorOnSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        const Gap(SpaceSize.s16),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () =>
                                controller.signInWithAnonymous(l10n),
                            child: Text(
                              l10n.continueAsGuest,
                              style: textTheme.labelLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                            ),
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
              );
            },
          ),
        ),
      ),
    );
  }
}

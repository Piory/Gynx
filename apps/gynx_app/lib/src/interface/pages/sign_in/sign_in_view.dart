import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/constants/padding_size.dart';
import 'package:gynx_app/src/generated/assets/assets.gen.dart';
import 'package:gynx_app/src/interface/pages/sign_in/components/apple_oauth_button.dart';
import 'package:gynx_app/src/interface/pages/sign_in/components/google_oauth_button.dart';
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_controller.dart';
import 'package:gynx_app/src/interface/router/page_router.dart';
import 'package:gynx_app/src/interface/router/page_type.dart';
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
    final colorOnSurface = Theme.of(context).colorScheme.onSurface;
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.svgs.logos.gynxLogoWithNameDark.svg(
                    width: 160,
                  ),
                  const SizedBox(height: PaddingSize.s32),
                  Text(
                    context.l10n.signUpOrSignIn,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: PaddingSize.s64),
                  Column(
                    children: [
                      AppleOAuthButton(
                        onPressed: () {},
                      ),
                      const SizedBox(height: PaddingSize.s8),
                      GoogleOAuthButton(
                        onPressed: controller.signInWithGoogle,
                      ),
                      const SizedBox(height: PaddingSize.s16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              color: colorOnSurface,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: PaddingSize.s8,
                            ),
                            child: Text(
                              context.l10n.or,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: colorOnSurface,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: colorOnSurface,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: PaddingSize.s16),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: controller.signInWithAnonymous,
                          child: Text(
                            context.l10n.continueAsGuest,
                          ),
                        ),
                      ),
                      const SizedBox(height: PaddingSize.s4),
                      Text(
                        context.l10n.continueAsGuestWarning,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: colorOnSurface,
                            ),
                      ),
                      const SizedBox(height: PaddingSize.s32),
                      Text(
                        context.l10n
                            .continueIsApproveTermsOfServiceAndPrivacyPolicy,
                      ),
                    ],
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

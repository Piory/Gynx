import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/infrastructure/router/go_router.dart';
import 'package:gynx_app/src/interface/pages/sign_up/sign_up_controller.dart';
import 'package:gynx_l10n/gynx_l10n.dart';

class SignUpView extends CleanView {
  const SignUpView({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _SignUpViewState();
}

class _SignUpViewState extends CleanViewState<SignUpView, SignUpController> {
  _SignUpViewState()
      : super(
          GetIt.I<SignUpController>(),
        );

  @override
  Widget get view {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      key: globalKey,
      body: SafeArea(
        child: ControlledWidgetBuilder<SignUpController>(
          builder: (context, controller) {
            final theme = Theme.of(context);
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          key: const Key('email'),
                          decoration: InputDecoration(
                            labelText: l10n.email,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          key: const Key('password'),
                          decoration: InputDecoration(
                            labelText: l10n.password,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(l10n.forgotYourPassword),
                          ),
                          onPressed: () => {},
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            key: const Key('sign_up_button'),
                            onPressed: () => controller.signUp(
                              email: 'email',
                              password: 'password',
                            ),
                            child: Text(l10n.signUp),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l10n.alreadyHaveAnAccount,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: colorScheme.primary.withOpacity(0.7),
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            const SignInRoute().pushReplacement(context),
                        child: Text(
                          l10n.signIn,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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

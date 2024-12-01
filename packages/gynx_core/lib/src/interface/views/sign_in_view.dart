import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_core/src/interface/controllers/auth_controller.dart';
import 'package:gynx_l10n/gynx_l10n.dart';

class SignInView extends CleanView {
  const SignInView({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _SignInViewState();
}

class _SignInViewState extends CleanViewState<SignInView, AuthController> {
  _SignInViewState()
      : super(
          GetIt.I.get<AuthController>(),
        );

  @override
  Widget get view {
    final l10n = L10n.of(context);
    return Scaffold(
      key: globalKey,
      body: ControlledWidgetBuilder<AuthController>(
        builder: (context, controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: l10n.email,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
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
                    onPressed: () => controller.signIn('email', 'password'),
                    child: Text(l10n.signIn),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                    ),
                    child: Text(l10n.signUp),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

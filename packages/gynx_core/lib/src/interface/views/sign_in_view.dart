import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_core/src/interface/controllers/auth_controller.dart';

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
  Widget get view => Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: const Text('Sign In'),
        ),
        body: ControlledWidgetBuilder<AuthController>(
          builder: (context, controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 64),
                  const Text('Sign In'),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(height: 8),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  const SizedBox(height: 8),
                  const InkWell(
                    child: SizedBox(
                      width: double.infinity,
                      child: Text('Forgot your password?'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.signIn('email', 'password'),
                      child: const Text('Sign In'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => {},
                      child: const Text('Sign Up'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
}

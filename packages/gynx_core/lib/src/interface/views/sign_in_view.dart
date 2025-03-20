import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_core/src/infrastructure/repositories/auth_repository_impl.dart';
import 'package:gynx_core/src/interface/controllers/auth_controller.dart';
import 'package:gynx_core/src/interface/presenters/sign_in_presenter.dart';

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
          AuthController(
            signInPresenter: SignInPresenter(
              const AuthRepositoryImpl(),
            ),
          ),
        );

  @override
  Widget get view => MaterialApp(
        home: Scaffold(
          floatingActionButton: ControlledWidgetBuilder<AuthController>(
            builder: (context, controller) {
              return FloatingActionButton(
                onPressed: () => controller.signIn('email', 'password'),
                child: const Icon(Icons.add),
              );
            },
          ),
          body: const Center(
            child: Text('Sign In'),
          ),
        ),
      );
}

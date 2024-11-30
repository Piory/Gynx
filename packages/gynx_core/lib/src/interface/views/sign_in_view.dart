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
        floatingActionButton: ControlledWidgetBuilder<AuthController>(
          builder: (context, controller) {
            return FloatingActionButton(
              onPressed: () => controller.signIn('email', 'password'),
              child: const Icon(Icons.add),
            );
          },
        ),
        appBar: AppBar(
          title: const Text('Sign In'),
        ),
        body: const Center(
          child: Text('Sign In'),
        ),
      );
}

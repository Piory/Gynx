import 'dart:ui';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_core/src/application/usecase/interactors/sign_in_interactor.dart';
import 'package:gynx_core/src/application/usecase/params/sign_in_param.dart';
import 'package:gynx_core/src/domain/repositories/auth_reposirory.dart';

class SignInPresenter extends Presenter {
  SignInPresenter(AuthRepository authRepository)
      : _signInInteractor = SignInInteractor(authRepository),
        super();

  final SignInInteractor _signInInteractor;

  late VoidCallback signInOnComplete;
  late void Function(dynamic) signInOnError;
  late VoidCallback signInOnNext;

  void signIn(String email, String password) {
    print('Sign in presenter');
    _signInInteractor.execute(
      _SignInObserver(this),
      SignInParam(
        email: email,
        password: password,
      ),
    );
  }

  @override
  void dispose() {
    print('Sign in presenter dispose');
    _signInInteractor.dispose();
  }
}

class _SignInObserver implements Observer<bool> {
  _SignInObserver(this._presenter);

  final SignInPresenter _presenter;

  @override
  void onNext(bool? response) {
    print('Sign in next observer');
    _presenter.signInOnNext();
  }

  @override
  void onComplete() {
    print('Sign in success observer');
    _presenter.signInOnComplete();
  }

  @override
  void onError(dynamic e) {
    print('Sign in error observer: $e');
    _presenter.signInOnError(e);
  }
}

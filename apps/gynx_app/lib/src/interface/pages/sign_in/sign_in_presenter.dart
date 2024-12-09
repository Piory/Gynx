import 'dart:ui';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_app/src/application/usecase/interactors/sign_in_interactor.dart';
import 'package:gynx_app/src/application/usecase/params/sign_in_param.dart';
import 'package:injectable/injectable.dart';

@singleton
class SignInPresenter extends Presenter {
  SignInPresenter(this._signInInteractor);

  final SignInInteractor _signInInteractor;

  late VoidCallback signInOnComplete;
  late void Function(dynamic) signInOnError;

  void signIn(String email, String password) {
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
    _signInInteractor.dispose();
  }
}

class _SignInObserver implements Observer<void> {
  _SignInObserver(this._presenter);

  final SignInPresenter _presenter;

  @override
  void onNext(_) {
    throw UnimplementedError();
  }

  @override
  void onComplete() {
    _presenter.signInOnComplete();
  }

  @override
  void onError(dynamic e) {
    _presenter.signInOnError(e);
  }
}

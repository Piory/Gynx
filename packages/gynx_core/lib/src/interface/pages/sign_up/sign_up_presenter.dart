import 'dart:ui';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_core/src/application/usecase/interactors/sign_up_interactor.dart';
import 'package:gynx_core/src/application/usecase/params/sign_up_param.dart';
import 'package:injectable/injectable.dart';

@singleton
class SignUpPresenter extends Presenter {
  SignUpPresenter(this._signUpInteractor);

  final SignUpInteractor _signUpInteractor;

  late VoidCallback signUpOnComplete;
  late void Function(dynamic) signUpOnError;

  void signUp(String email, String password) {
    _signUpInteractor.execute(
      _SignUpObserver(this),
      SignUpParam(
        email: email,
        password: password,
      ),
    );
  }

  @override
  void dispose() {
    _signUpInteractor.dispose();
  }
}

class _SignUpObserver implements Observer<void> {
  _SignUpObserver(this._presenter);

  final SignUpPresenter _presenter;

  @override
  void onNext(_) {
    throw UnimplementedError();
  }

  @override
  void onComplete() {
    _presenter.signUpOnComplete();
  }

  @override
  void onError(dynamic e) {
    _presenter.signUpOnError(e);
  }
}

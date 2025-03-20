import 'dart:ui';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_app/src/application/usecase/interactors/sign_out_interactor.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProfilePresenter extends Presenter {
  ProfilePresenter(this._signOutInteractor);

  final SignOutInteractor _signOutInteractor;

  late VoidCallback signUpOnComplete;
  late void Function(dynamic) signUpOnError;

  void signOut() {
    _signOutInteractor.execute(
      _SignOutObserver(this),
      null,
    );
  }

  @override
  void dispose() {
    _signOutInteractor.dispose();
  }
}

class _SignOutObserver implements Observer<void> {
  _SignOutObserver(this._presenter);

  final ProfilePresenter _presenter;

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

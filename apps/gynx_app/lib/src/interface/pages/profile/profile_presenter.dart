import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_app/src/application/usecase/interactors/sign_out_interactor.dart';
import 'package:gynx_app/src/application/usecase/interactors/suite_user_interactor.dart';
import 'package:gynx_app/src/application/usecase/results/suite_user_result.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProfilePresenter extends Presenter {
  ProfilePresenter(
    this._suiteUserInteractor,
    this._signOutInteractor,
  );

  final SuiteUserInteractor _suiteUserInteractor;
  final SignOutInteractor _signOutInteractor;

  late ValueSetter<SuiteUserResult> suiteUserOnNext;
  late VoidCallback suiteUserOnComplete;
  late ValueSetter<dynamic> suiteUserOnError;
  late VoidCallback signOutOnComplete;
  late ValueSetter<dynamic> signOutOnError;

  void suiteUser() {
    _suiteUserInteractor.execute(
      _SuiteUserObserver(this),
      null,
    );
  }

  void signOut() {
    _signOutInteractor.execute(
      _SignOutObserver(this),
      null,
    );
  }

  @override
  void dispose() {
    _suiteUserInteractor.dispose();
    _signOutInteractor.dispose();
  }
}

class _SuiteUserObserver implements Observer<SuiteUserResult> {
  _SuiteUserObserver(this._presenter);

  final ProfilePresenter _presenter;

  @override
  void onNext(SuiteUserResult? result) {
    _presenter.suiteUserOnNext(result!);
  }

  @override
  void onComplete() {
    _presenter.suiteUserOnComplete();
  }

  @override
  void onError(dynamic e) {
    _presenter.suiteUserOnError(e);
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
    _presenter.signOutOnComplete();
  }

  @override
  void onError(dynamic e) {
    _presenter.signOutOnError(e);
  }
}

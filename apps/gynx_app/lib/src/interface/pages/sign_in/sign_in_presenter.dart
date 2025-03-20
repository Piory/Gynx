import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_app/src/application/usecase/interactors/sign_in_with_anonymous_interactor.dart';
import 'package:gynx_app/src/application/usecase/interactors/sign_in_with_oauth_interactor.dart';
import 'package:gynx_app/src/application/usecase/params/sign_in_with_oauth_param.dart';
import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';
import 'package:injectable/injectable.dart';

@singleton
class SignInPresenter extends Presenter {
  SignInPresenter(
    this._signInWithAnonymousInteractor,
    this._signInWithOAuthInteractor,
  );

  final SignInWithAnonymousInteractor _signInWithAnonymousInteractor;
  final SignInWithOAuthInteractor _signInWithOAuthInteractor;

  late VoidCallback authOnComplete;
  late ValueSetter<dynamic> authOnError;

  void signInWithAnonymous() {
    _signInWithAnonymousInteractor.execute(
      _SignInObserver(this),
      null,
    );
  }

  void signInWithOAuth(OAuthProviderType oauthProviderType) {
    _signInWithOAuthInteractor.execute(
      _SignInObserver(this),
      SignInWithOAuthParam(
        oauthProviderType: oauthProviderType,
      ),
    );
  }

  @override
  void dispose() {
    _signInWithAnonymousInteractor.dispose();
    _signInWithOAuthInteractor.dispose();
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
    _presenter.authOnComplete();
  }

  @override
  void onError(dynamic e) {
    _presenter.authOnError(e);
  }
}

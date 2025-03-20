import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_presenter.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInController extends Controller {
  SignInController(
    this._signInPresenter,
  );

  final SignInPresenter _signInPresenter;

  void signInWithApple() {
    _signInPresenter.signInWithOAuth(OAuthProviderType.apple);
  }

  void signInWithGoogle() {
    _signInPresenter.signInWithOAuth(OAuthProviderType.google);
  }

  void signInWithAnonymous() {
    _signInPresenter.signInWithAnonymous();
  }

  @override
  void initListeners() {
    _signInPresenter
      ..authOnComplete = () {}
      ..authOnError = (e) {
        logger.severe('Error: $e');
      };
  }
}

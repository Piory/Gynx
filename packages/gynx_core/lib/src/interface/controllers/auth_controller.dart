import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_core/src/interface/presenters/sign_in_presenter.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthController extends Controller {
  AuthController(this._signInPresenter);

  final SignInPresenter _signInPresenter;

  void signIn(String email, String password) {
    _signInPresenter.signIn(email, password);
  }

  @override
  void initListeners() {
    _signInPresenter
      ..signInOnComplete = () {
        print('Sign in success controller');
      }
      ..signInOnError = (e) {
        print('Sign in error controller: $e');
      }
      ..signInOnNext = () {
        print('Sign in next controller');
      };
  }
}

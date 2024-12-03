import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_core/src/interface/pages/sign_up/sign_up_presenter.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpController extends Controller {
  SignUpController(this._signUpPresenter);

  final SignUpPresenter _signUpPresenter;

  void signUp({
    required String email,
    required String password,
  }) {
    _signUpPresenter.signUp(email, password);
  }

  @override
  void initListeners() {
    _signUpPresenter
      ..signUpOnComplete = () {}
      ..signUpOnError = (e) {};
  }
}

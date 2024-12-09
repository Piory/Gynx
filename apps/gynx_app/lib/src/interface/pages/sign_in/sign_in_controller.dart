import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_presenter.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInController extends Controller {
  SignInController(this._signInPresenter);

  final SignInPresenter _signInPresenter;

  void signIn({
    required String email,
    required String password,
  }) {
    _signInPresenter.signIn(email, password);
  }

  @override
  void initListeners() {
    _signInPresenter
      ..signInOnComplete = () {}
      ..signInOnError = (e) {};
  }
}

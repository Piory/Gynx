import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_app/src/interface/pages/profile/profile_presenter.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileController extends Controller {
  ProfileController(this._profilePresenter);

  final ProfilePresenter _profilePresenter;

  void signOut() {
    _profilePresenter.signOut();
  }

  @override
  void initListeners() {
    _profilePresenter
      ..signUpOnComplete = () {}
      ..signUpOnError = (e) {};
  }
}

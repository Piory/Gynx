import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_app/src/application/usecase/results/suite_user_result.dart';
import 'package:gynx_app/src/interface/pages/profile/profile_presenter.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileController extends Controller {
  ProfileController(
    this._profilePresenter,
  );

  final ProfilePresenter _profilePresenter;

  SuiteUserResult? suiteUser;

  void signOut() {
    _profilePresenter.signOut();
  }

  @override
  void initController(GlobalKey<State<StatefulWidget>> key) {
    super.initController(key);
    _profilePresenter.suiteUser();
  }

  @override
  void initListeners() {
    _profilePresenter
      ..suiteUserOnNext = (result) {
        suiteUser = result;
        refreshUI();
      }
      ..suiteUserOnComplete = () {}
      ..suiteUserOnError = (e) {}
      ..signOutOnComplete = () {}
      ..signOutOnError = (e) {};
  }
}

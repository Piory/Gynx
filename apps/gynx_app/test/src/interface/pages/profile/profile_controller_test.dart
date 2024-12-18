import 'package:flutter/material.dart';
import 'package:gynx_app/src/application/usecase/interactors/sign_out_interactor.dart';
import 'package:gynx_app/src/application/usecase/interactors/suite_user_interactor.dart';
import 'package:gynx_app/src/application/usecase/results/suite_user_result.dart';
import 'package:gynx_app/src/interface/pages/profile/profile_controller.dart';
import 'package:gynx_app/src/interface/pages/profile/profile_presenter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../data/dummy_data_generator.dart';
import 'profile_controller_test.mocks.dart';

final result = SuiteUserResult(
  tUser: generateDummyTUser(),
  tUserProfile: generateDummyTUserProfile(),
);

class SpyProfilePresenter extends ProfilePresenter {
  SpyProfilePresenter(this._mockProfilePresenter)
      : super(
          MockSuiteUserInteractor(),
          MockSignOutInteractor(),
        );

  final MockProfilePresenter _mockProfilePresenter;

  @override
  void signOut() {
    try {
      _mockProfilePresenter.signOut();
      signOutOnComplete();
    } on Exception catch (e) {
      signOutOnError(e);
    }
  }

  @override
  void suiteUser() {
    try {
      _mockProfilePresenter.suiteUser();
      suiteUserOnNext(result);
      suiteUserOnComplete();
    } on Exception catch (e) {
      suiteUserOnError(e);
    }
  }
}

@GenerateNiceMocks([
  MockSpec<SuiteUserInteractor>(),
  MockSpec<SignOutInteractor>(),
  MockSpec<ProfilePresenter>(),
])
void main() {
  final mockProfilePresenter = MockProfilePresenter();
  final spySignInPresenter = SpyProfilePresenter(mockProfilePresenter);
  late ProfileController controller;

  setUp(() {
    controller = ProfileController(
      spySignInPresenter,
    );
  });

  tearDown(() {
    verifyNoMoreInteractions(mockProfilePresenter);
    reset(mockProfilePresenter);
  });

  group('#initController', () {
    group('正常系', () {
      test('initController が呼ばれたら、ProfilePresenter#suiteUser が呼ばれること', () {
        expect(controller.suiteUser, isNull);
        controller.initController(GlobalKey());
        expect(controller.suiteUser, result);
        verify(mockProfilePresenter.suiteUser());
      });
    });
  });

  group('#signOut', () {
    group('正常系', () {
      test('ProfilePresenter#signOut が呼ばれること', () async {
        controller.signOut();
        verify(mockProfilePresenter.signOut());
      });
    });
  });
}

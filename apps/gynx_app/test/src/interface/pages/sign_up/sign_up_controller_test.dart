import 'package:faker/faker.dart';
import 'package:gynx_app/src/application/usecase/interactors/sign_up_interactor.dart';
import 'package:gynx_app/src/interface/pages/sign_up/sign_up_controller.dart';
import 'package:gynx_app/src/interface/pages/sign_up/sign_up_presenter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'sign_up_controller_test.mocks.dart';

class SpySignUpPresenter extends SignUpPresenter {
  SpySignUpPresenter(this._mockSignUpPresenter) : super(MockSignUpInteractor());

  final MockSignUpPresenter _mockSignUpPresenter;

  @override
  Future<void> signUp(String email, String password) async {
    return _mockSignUpPresenter.signUp(email, password);
  }
}

@GenerateNiceMocks([
  MockSpec<SignUpInteractor>(),
  MockSpec<SignUpPresenter>(),
])
void main() {
  final faker = Faker();
  final mockSignUpPresenter = MockSignUpPresenter();
  final spySignUpPresenter = SpySignUpPresenter(mockSignUpPresenter);
  late SignUpController controller;

  tearDown(() {
    reset(mockSignUpPresenter);
  });

  setUp(() {
    controller = SignUpController(spySignUpPresenter);
  });

  group('正常系', () {
    test('SignUpPresenter#signIn が正常に呼ばれること', () async {
      final email = faker.internet.email();
      final password = faker.guid.guid();
      when(mockSignUpPresenter.signUp(email, password))
          .thenAnswer((_) async {});
      controller.signUp(
        email: email,
        password: password,
      );
      verify(mockSignUpPresenter.signUp(email, password));
    });
  });
}

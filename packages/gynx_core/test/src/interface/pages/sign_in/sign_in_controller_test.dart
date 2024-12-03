import 'package:faker/faker.dart';
import 'package:gynx_core/src/application/usecase/interactors/sign_in_interactor.dart';
import 'package:gynx_core/src/interface/pages/sign_in/sign_in_controller.dart';
import 'package:gynx_core/src/interface/pages/sign_in/sign_in_presenter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'sign_in_controller_test.mocks.dart';

class SpySignInPresenter extends SignInPresenter {
  SpySignInPresenter(this._mockSignInPresenter) : super(MockSignInInteractor());

  final MockSignInPresenter _mockSignInPresenter;

  @override
  Future<void> signIn(String email, String password) async {
    return _mockSignInPresenter.signIn(email, password);
  }
}

@GenerateNiceMocks([
  MockSpec<SignInInteractor>(),
  MockSpec<SignInPresenter>(),
])
void main() {
  final faker = Faker();
  final mockSignInPresenter = MockSignInPresenter();
  final spySignInPresenter = SpySignInPresenter(mockSignInPresenter);
  late SignInController controller;

  tearDown(() {
    reset(mockSignInPresenter);
  });

  setUp(() {
    controller = SignInController(spySignInPresenter);
  });

  group('正常系', () {
    test('SignInPresenter#signIn が正常に呼ばれること', () async {
      final email = faker.internet.email();
      final password = faker.guid.guid();
      when(mockSignInPresenter.signIn(email, password))
          .thenAnswer((_) async {});
      controller.signIn(
        email: email,
        password: password,
      );
      verify(mockSignInPresenter.signIn(email, password));
    });
  });
}

import 'package:faker/faker.dart';
import 'package:gynx_app/src/application/usecase/interactors/sign_up_interactor.dart';
import 'package:gynx_app/src/application/usecase/params/sign_up_param.dart';
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'sign_up_interactor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthRepository>(),
])
void main() {
  final faker = Faker();
  final mockAuthRepository = MockAuthRepository();
  final interactor = SignUpInteractor(mockAuthRepository);

  tearDown(() {
    reset(mockAuthRepository);
  });

  group('正常系', () {
    test('AuthRepository#signUp が呼ばれ、onData が呼ばれること', () async {
      final email = faker.internet.email();
      final password = faker.guid.guid();
      when(
        mockAuthRepository.signUp(
          email: email,
          password: password,
        ),
      ).thenAnswer((_) async => {});
      final stream = await interactor.buildUseCaseStream(
        SignUpParam(
          email: email,
          password: password,
        ),
      );
      var onDataCallCount = 0;
      stream.listen(
        (_) => fail('onData should not be called'),
        onError: (_) => fail('onError should not be called'),
        onDone: () => onDataCallCount++,
      );
      verify(
        mockAuthRepository.signUp(
          email: email,
          password: password,
        ),
      );
    });
  });

  group('異常系', () {
    test('AuthRepository#signUp でエラーが発生した場合は、onError が呼ばれること', () async {
      final email = faker.internet.email();
      final password = faker.guid.guid();
      final exception = Exception(faker.guid.guid());
      when(
        mockAuthRepository.signUp(
          email: email,
          password: password,
        ),
      ).thenThrow(exception);
      final stream = await interactor.buildUseCaseStream(
        SignUpParam(
          email: email,
          password: password,
        ),
      );
      stream.listen(
        (_) => fail('onData should not be called'),
        onError: (dynamic e) => expect(e, exception),
        onDone: () => fail('onDone should not be called'),
      );
    });
  });
}

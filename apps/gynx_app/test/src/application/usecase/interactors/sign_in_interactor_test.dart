import 'package:faker/faker.dart';
import 'package:gynx_app/src/application/usecase/interactors/sign_in_interactor.dart';
import 'package:gynx_app/src/application/usecase/params/sign_in_param.dart';
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'sign_in_interactor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthRepository>(),
])
void main() {
  final faker = Faker();
  final mockAuthRepository = MockAuthRepository();
  final interactor = SignInInteractor(mockAuthRepository);

  tearDown(() {
    reset(mockAuthRepository);
  });

  group('正常系', () {
    test(
      'AuthRepository#signInWithPassword が呼ばれ、onData が呼ばれること',
      () async {
        final email = faker.internet.email();
        final password = faker.guid.guid();
        when(
          mockAuthRepository.signInWithPassword(
            email: email,
            password: password,
          ),
        ).thenAnswer((_) async => {});
        final stream = await interactor.buildUseCaseStream(
          SignInParam(
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
          mockAuthRepository.signInWithPassword(
            email: email,
            password: password,
          ),
        );
      },
    );
  });

  group('異常系', () {
    test(
      'AuthRepository#signInWithPassword でエラーが発生した場合は、onError が呼ばれること',
      () async {
        final email = faker.internet.email();
        final password = faker.guid.guid();
        final exception = Exception(faker.guid.guid());
        when(
          mockAuthRepository.signInWithPassword(
            email: email,
            password: password,
          ),
        ).thenThrow(exception);
        final stream = await interactor.buildUseCaseStream(
          SignInParam(
            email: email,
            password: password,
          ),
        );
        stream.listen(
          (_) => fail('onData should not be called'),
          onError: (dynamic e) => expect(e, exception),
          onDone: () => fail('onDone should not be called'),
        );
      },
    );
  });
}

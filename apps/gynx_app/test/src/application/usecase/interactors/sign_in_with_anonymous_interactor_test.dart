import 'package:faker/faker.dart';
import 'package:gynx_app/src/application/usecase/interactors/sign_in_with_anonymous_interactor.dart';
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'sign_in_with_anonymous_interactor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthRepository>(),
])
void main() {
  final mockAuthRepository = MockAuthRepository();
  final interactor = SignInWithAnonymousInteractor(mockAuthRepository);

  tearDown(() {
    verifyNoMoreInteractions(mockAuthRepository);
    reset(mockAuthRepository);
  });

  group('正常系', () {
    test('AuthRepository#signInWithAnonymous が呼ばれること', () async {
      when(mockAuthRepository.signInWithAnonymous())
          .thenAnswer((_) async => {});
      final stream = await interactor.buildUseCaseStream(null);
      var onDataCallCount = 0;
      stream.listen(
        (_) => fail('onData should not be called'),
        onError: (_) => fail('onError should not be called'),
        onDone: () => onDataCallCount++,
      );
      verify(mockAuthRepository.signInWithAnonymous());
    });
  });

  group('異常系', () {
    test(
      'AuthRepository#signInWithAnonymous でエラーが発生した場合は、onError が呼ばれること',
      () async {
        final exception = Exception(faker.guid.guid());
        when(mockAuthRepository.signInWithAnonymous()).thenThrow(exception);
        final stream = await interactor.buildUseCaseStream(null);
        stream.listen(
          (_) => fail('onData should not be called'),
          onError: (dynamic e) => expect(e, exception),
          onDone: () => fail('onDone should not be called'),
        );
        verifyInOrder([
          mockAuthRepository.signInWithAnonymous(),
          mockAuthRepository.signOut(),
        ]);
      },
    );
  });
}

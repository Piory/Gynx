// ignore_for_file: lines_longer_than_80_chars
import 'package:faker/faker.dart';
import 'package:gynx_app/src/application/interactors/sign_in_with_anonymous_interactor.dart';
import 'package:gynx_app/src/domain/repositories/auth_repository.dart';
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
      await interactor.execute();
      verify(mockAuthRepository.signInWithAnonymous());
    });
  });

  group('異常系', () {
    test(
      'AuthRepository#signInWithAnonymous でエラーが発生した場合は、AuthRepository#signOut が呼ばれること',
      () async {
        final exception = Exception(faker.guid.guid());
        when(mockAuthRepository.signInWithAnonymous()).thenThrow(exception);
        await expectLater(interactor.execute, throwsA(exception));
        verifyInOrder([
          mockAuthRepository.signInWithAnonymous(),
          mockAuthRepository.signOut(),
        ]);
      },
    );
  });
}

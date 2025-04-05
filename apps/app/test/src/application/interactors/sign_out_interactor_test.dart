import 'package:app/src/application/interactors/sign_out_interactor.dart';
import 'package:app/src/domain/repositories/auth_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'sign_out_interactor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthRepository>(),
])
void main() {
  final mockAuthRepository = MockAuthRepository();
  final interactor = SignOutInteractor(mockAuthRepository);

  tearDown(() {
    verifyNoMoreInteractions(mockAuthRepository);
    reset(mockAuthRepository);
  });

  group('正常系', () {
    test(
      'AuthRepository#signOut が呼ばれること',
      () async {
        when(mockAuthRepository.signOut()).thenAnswer((_) async => {});
        await interactor.execute();
        verify(mockAuthRepository.signOut());
      },
    );
  });
}

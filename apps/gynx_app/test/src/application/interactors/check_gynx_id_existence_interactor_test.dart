import 'package:faker/faker.dart';
import 'package:gynx_app/src/application/interactors/check_gynx_id_existence_interactor.dart';
import 'package:gynx_app/src/domain/repositories/t_user_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'check_gynx_id_existence_interactor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<TUserRepository>(),
])
void main() {
  final mockTUserRepository = MockTUserRepository();
  final interactor = CheckGynxIdExistenceInteractor(mockTUserRepository);

  tearDown(() {
    verifyNoMoreInteractions(mockTUserRepository);
    reset(mockTUserRepository);
  });

  group('正常系', () {
    test(
      'TUserRepository#existsById が呼ばれること',
      () async {
        final b = faker.randomGenerator.boolean();
        when(mockTUserRepository.existsById('gynxId')).thenAnswer(
          (_) async => b,
        );
        expect(await interactor.execute('gynxId'), b);
        verify(mockTUserRepository.existsById('gynxId'));
      },
    );
  });
}

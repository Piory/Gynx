import 'package:app/src/application/interactors/check_screen_name_existence_interactor.dart';
import 'package:app/src/domain/repositories/t_user_repository.dart';
import 'package:faker/faker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'check_screen_name_existence_interactor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<TUserRepository>(),
])
void main() {
  final mockTUserRepository = MockTUserRepository();
  final interactor = CheckScreenNameExistenceInteractor(mockTUserRepository);

  tearDown(() {
    verifyNoMoreInteractions(mockTUserRepository);
    reset(mockTUserRepository);
  });

  group('正常系', () {
    test(
      'TUserRepository#existsByScreenName が呼ばれること',
      () async {
        final b = faker.randomGenerator.boolean();
        when(mockTUserRepository.existsByScreenName('screenName')).thenAnswer(
          (_) async => b,
        );
        expect(await interactor.execute('screenName'), b);
        verify(mockTUserRepository.existsByScreenName('screenName'));
      },
    );
  });
}

import 'package:app/src/application/interactors/find_user_interactor.dart';
import 'package:app/src/domain/repositories/v_user_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';
import 'find_user_interactor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<VUserRepository>(),
])
void main() {
  final mockVUserRepository = MockVUserRepository();
  final interactor = FindUserInteractor(mockVUserRepository);
  final vUser = generateDummyVUser();

  tearDown(() {
    verifyNoMoreInteractions(mockVUserRepository);
    reset(mockVUserRepository);
  });

  group('正常系', () {
    test('VUserRepository#findByUserId が呼ばれること', () async {
      when(mockVUserRepository.findByUserId(vUser.userId)).thenAnswer((_) async => vUser);
      expect(await interactor.execute(vUser.userId), vUser);
      verify(mockVUserRepository.findByUserId(vUser.userId));
    });
  });
}

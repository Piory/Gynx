import 'package:app/src/application/interactors/find_user_detail_interactor.dart';
import 'package:app/src/domain/repositories/v_user_detail_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';
import 'find_user_detail_interactor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<VUserDetailRepository>(),
])
void main() {
  final mockVUserDetailRepository = MockVUserDetailRepository();
  final interactor = FindUserDetailInteractor(mockVUserDetailRepository);
  final vUserDetail = generateDummyVUserDetail();

  tearDown(() {
    verifyNoMoreInteractions(mockVUserDetailRepository);
    reset(mockVUserDetailRepository);
  });

  group('正常系', () {
    test('VUserDetailRepository#findByUserId が呼ばれること', () async {
      when(mockVUserDetailRepository.findByUserId(vUserDetail.userId)).thenAnswer((_) async => vUserDetail);
      expect(await interactor.execute(vUserDetail.userId), vUserDetail);
      verify(mockVUserDetailRepository.findByUserId(vUserDetail.userId));
    });
  });
}

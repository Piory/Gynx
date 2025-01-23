import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/usecases/find_user_detail_usecase.dart';
import 'package:gynx_app/src/presentation/notifiers/user_detail_notifier.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';
import 'user_detail_notifier_test.mocks.dart';
import 'util.dart';

@GenerateNiceMocks([
  MockSpec<FindUserDetailUseCase>(),
])
void main() {
  final vUserDetail = generateDummyVUserDetail();
  final mockFindUserDetailUseCase = MockFindUserDetailUseCase();

  setUpAll(() {
    GetIt.I.registerSingleton<FindUserDetailUseCase>(mockFindUserDetailUseCase);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockFindUserDetailUseCase);
    reset(mockFindUserDetailUseCase);
  });

  group('正常系', () {
    test('渡されたユーザーID が FindUserDetailUseCase#execute に渡されていること', () async {
      when(mockFindUserDetailUseCase.execute(vUserDetail.userId))
          .thenAnswer((_) async => vUserDetail);
      final result = await createContainer()
          .read(userDetailNotifierProvider(vUserDetail.userId).future);
      expect(result, vUserDetail);
      verify(mockFindUserDetailUseCase.execute(vUserDetail.userId));
    });
  });
}

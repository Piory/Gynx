import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/usecases/find_user_usecase.dart';
import 'package:gynx_app/src/presentation/notifiers/user_notifier.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';
import 'user_notifier_test.mocks.dart';
import 'util.dart';

@GenerateNiceMocks([
  MockSpec<FindUserUseCase>(),
])
void main() {
  final vUser = generateDummyVUser();
  final mockFindUserUseCase = MockFindUserUseCase();

  setUpAll(() {
    GetIt.I.registerSingleton<FindUserUseCase>(mockFindUserUseCase);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockFindUserUseCase);
    reset(mockFindUserUseCase);
  });

  group('正常系', () {
    test('渡されたユーザーID が FindUserUseCase#execute に渡されていること', () async {
      when(mockFindUserUseCase.execute(vUser.userId))
          .thenAnswer((_) async => vUser);
      final result = await createContainer()
          .read(userNotifierProvider(vUser.userId).future);
      expect(result, vUser);
      verify(mockFindUserUseCase.execute(vUser.userId));
    });
  });
}

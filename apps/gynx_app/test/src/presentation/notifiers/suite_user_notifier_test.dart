import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/usecases/suite_user_usecase.dart';
import 'package:gynx_app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';
import 'suite_user_notifier_test.mocks.dart';
import 'util.dart';

@GenerateNiceMocks([
  MockSpec<SuiteUserUseCase>(),
])
void main() {
  final suiteUser = generateDummySuiteUser();
  final mockSuiteUserUseCase = MockSuiteUserUseCase();

  setUpAll(() {
    GetIt.I.registerSingleton<SuiteUserUseCase>(mockSuiteUserUseCase);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockSuiteUserUseCase);
    reset(mockSuiteUserUseCase);
  });

  group('正常系', () {
    test('SuiteUserUseCase#execute が呼ばれること', () async {
      when(mockSuiteUserUseCase.execute()).thenAnswer((_) async => suiteUser);
      final result =
          await createContainer().read(suiteUserNotifierProvider.future);
      expect(result, suiteUser);
      verify(mockSuiteUserUseCase.execute());
    });
  });
}

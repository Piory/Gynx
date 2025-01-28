import 'package:faker/faker.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/usecases/find_user_detail_usecase.dart';
import 'package:gynx_app/src/domain/usecases/find_user_usecase.dart';
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
  MockSpec<FindUserUseCase>(),
  MockSpec<FindUserDetailUseCase>(),
])
void main() {
  final suiteUser = generateDummySuiteUser();
  final vUser = generateDummyVUser();
  final vUserDetail = generateDummyVUserDetail();
  final mockSuiteUserUseCase = MockSuiteUserUseCase();
  final mockFindUserUseCase = MockFindUserUseCase();
  final mockFindUserDetailUseCase = MockFindUserDetailUseCase();

  setUpAll(() {
    GetIt.I.registerSingleton<SuiteUserUseCase>(mockSuiteUserUseCase);
    GetIt.I.registerSingleton<FindUserUseCase>(mockFindUserUseCase);
    GetIt.I.registerSingleton<FindUserDetailUseCase>(mockFindUserDetailUseCase);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockSuiteUserUseCase);
    verifyNoMoreInteractions(mockFindUserUseCase);
    verifyNoMoreInteractions(mockFindUserDetailUseCase);
    reset(mockSuiteUserUseCase);
    reset(mockFindUserUseCase);
    reset(mockFindUserDetailUseCase);
  });

  group('正常系', () {
    test('SuiteUserUseCase#execute が呼ばれること', () async {
      when(mockSuiteUserUseCase.execute()).thenAnswer((_) async => suiteUser);
      when(mockFindUserUseCase.execute(suiteUser.vUserDetail.userId))
          .thenAnswer((_) async => vUser);
      when(mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId))
          .thenAnswer((_) async => vUserDetail);
      final result =
          await createContainer().read(suiteUserNotifierProvider.future);
      expect(result, suiteUser);
      verifyInOrder([
        mockSuiteUserUseCase.execute(),
        mockFindUserUseCase.execute(suiteUser.vUserDetail.userId),
        mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId),
      ]);
    });

    group('#addPost', () {
      test(
        'SuiteUser.VUserDetail.latestPosts に、渡した VPost が追加されていること',
        () async {
          when(mockSuiteUserUseCase.execute())
              .thenAnswer((_) async => suiteUser);
          when(mockFindUserUseCase.execute(suiteUser.vUserDetail.userId))
              .thenAnswer((_) async => vUser);
          when(mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId))
              .thenAnswer((_) async => vUserDetail);
          final vPost = generateDummyVPost(
            postId: faker.randomGenerator.integer(100),
          );
          final container = createContainer();
          verifyNever(mockSuiteUserUseCase.execute());
          verifyNever(
            mockFindUserUseCase.execute(suiteUser.vUserDetail.userId),
          );
          verifyNever(
            mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId),
          );
          await container.read(suiteUserNotifierProvider.future);
          verifyInOrder([
            mockSuiteUserUseCase.execute(),
            mockFindUserUseCase.execute(suiteUser.vUserDetail.userId),
            mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId),
          ]);
          final result = await container.read(suiteUserNotifierProvider.future);
          expect(result.vUserDetail.latestPostList, isEmpty);
          container.read(suiteUserNotifierProvider.notifier).addPost(vPost);
          final addedResult =
              await container.read(suiteUserNotifierProvider.future);
          expect(
            addedResult.vUserDetail.latestPostList.vPosts,
            contains(vPost),
          );
        },
      );
    });
  });
}

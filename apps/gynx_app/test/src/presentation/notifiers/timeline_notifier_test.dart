import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/enums/timeline_type.dart';
import 'package:gynx_app/src/domain/models/v_post_list.dart';
import 'package:gynx_app/src/domain/usecases/fetch_post_usecase.dart';
import 'package:gynx_app/src/presentation/notifiers/timeline_notifier.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';
import 'timeline_notifier_test.mocks.dart';
import 'util.dart';

@GenerateNiceMocks([
  MockSpec<FetchPostUseCase>(),
])
void main() {
  final vPost1 = generateDummyVPost(postId: 1);
  final vPost2 = generateDummyVPost(postId: 2);
  final vPostList = VPostList([
    vPost2,
    vPost1,
  ]);
  final mockFetchPostUseCase = MockFetchPostUseCase();

  setUpAll(() {
    GetIt.I.registerSingleton<FetchPostUseCase>(mockFetchPostUseCase);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockFetchPostUseCase);
    reset(mockFetchPostUseCase);
  });

  group('正常系', () {
    test('FetchPostUseCase#execute が呼ばれること', () async {
      when(mockFetchPostUseCase.execute()).thenAnswer((_) async => vPostList);
      final result = await createContainer()
          .read(timelineNotifierProvider(TimelineType.follow).future);
      expect(result, vPostList);
      verify(mockFetchPostUseCase.execute());
    });
  });

  group('#add', () {
    test('state に VPost が追加され、postId の降順でソートされること', () async {
      final container = createContainer();
      when(mockFetchPostUseCase.execute()).thenAnswer((_) async => vPostList);
      final result = await container
          .read(timelineNotifierProvider(TimelineType.follow).future);
      expect(result, vPostList);
      final vPost = generateDummyVPost(postId: 3);
      container
          .read(timelineNotifierProvider(TimelineType.follow).notifier)
          .add(vPost);
      final addedResult = await container
          .read(timelineNotifierProvider(TimelineType.follow).future);
      expect(addedResult, VPostList([vPost, vPost2, vPost1]));
      verify(mockFetchPostUseCase.execute());
    });
  });

  group('#addAll', () {
    test('state に VPostList が追加され、postId の降順でソートされること', () async {
      final container = createContainer();
      when(mockFetchPostUseCase.execute()).thenAnswer((_) async => vPostList);
      final result = await container
          .read(timelineNotifierProvider(TimelineType.follow).future);
      expect(result, vPostList);
      final vPost3 = generateDummyVPost(postId: 3);
      final vPost4 = generateDummyVPost(postId: 4);
      final vPostList2 = VPostList([
        vPost3,
        vPost4,
      ]);
      container
          .read(timelineNotifierProvider(TimelineType.follow).notifier)
          .addAll(vPostList2);
      final addedResult = await container
          .read(timelineNotifierProvider(TimelineType.follow).future);
      expect(
        addedResult,
        VPostList(
          [vPost4, vPost3, vPost2, vPost1],
        ),
      );
      verify(mockFetchPostUseCase.execute());
    });
  });
}

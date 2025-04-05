// ignore_for_file: lines_longer_than_80_chars
import 'package:app/src/domain/models/post_id_list.dart';
import 'package:app/src/domain/models/v_post_list.dart';
import 'package:app/src/domain/usecases/fetch_post_usecase.dart';
import 'package:app/src/presentation/notifiers/post_map_notifier.dart';
import 'package:app/src/presentation/notifiers/timeline_notifier.dart';
import 'package:app/src/presentation/notifiers/timeline_notifier_mixin.dart';
import 'package:get_it/get_it.dart';
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
      final result = await createContainer().read(timelineNotifierProvider.future);
      expect(result, const TimelineState());
    });
  });

  group('#fetchNext', () {
    group('正常系', () {
      test(
        'FetchPostUseCase#execute が呼ばれ、postMapNotifierProvider に VPost が追加されていること',
        () async {
          final container = createContainer();
          await container.read(timelineNotifierProvider.future);

          expect(container.read(postMapNotifierProvider), isEmpty);
          when(mockFetchPostUseCase.execute()).thenAnswer((_) async => vPostList);
          await container.read(timelineNotifierProvider.notifier).fetchNext();
          expect(container.read(postMapNotifierProvider), {
            vPost1.postId: vPost1,
            vPost2.postId: vPost2,
          });
          verify(mockFetchPostUseCase.execute());
        },
      );

      test('すでに取得済みの投稿がある場合、取得済みの投稿の中で一番新しい投稿より新しい投稿を取得すること', () async {
        final container = createContainer();
        await container.read(timelineNotifierProvider.future);

        when(mockFetchPostUseCase.execute()).thenAnswer((_) async => vPostList);
        await container.read(timelineNotifierProvider.notifier).fetchNext();
        verify(mockFetchPostUseCase.execute());
        reset(mockFetchPostUseCase);

        final vPost = generateDummyVPost(postId: 3);
        when(mockFetchPostUseCase.execute(sincePostId: 2)).thenAnswer((_) async => VPostList([vPost]));
        await container.read(timelineNotifierProvider.notifier).fetchNext();
        verify(mockFetchPostUseCase.execute(sincePostId: 2));
      });
    });
  });

  group('#fetchPrevious', () {
    group('正常系', () {
      test(
        'FetchPostUseCase#execute が呼ばれ、postMapNotifierProvider に VPost が追加されていること',
        () async {
          final container = createContainer();
          await container.read(timelineNotifierProvider.future);

          expect(container.read(postMapNotifierProvider), isEmpty);
          when(mockFetchPostUseCase.execute()).thenAnswer((_) async => vPostList);
          await container.read(timelineNotifierProvider.notifier).fetchPrevious();
          expect(container.read(postMapNotifierProvider), {
            vPost1.postId: vPost1,
            vPost2.postId: vPost2,
          });
          verify(mockFetchPostUseCase.execute());
        },
      );

      test('すでに取得済みの投稿がある場合、取得済みの投稿の中で一番古い投稿より古い投稿を取得すること', () async {
        final container = createContainer();
        await container.read(timelineNotifierProvider.future);

        when(mockFetchPostUseCase.execute()).thenAnswer((_) async => vPostList);
        await container.read(timelineNotifierProvider.notifier).fetchNext();
        verify(mockFetchPostUseCase.execute());
        reset(mockFetchPostUseCase);

        final vPost = generateDummyVPost(postId: 0);
        when(mockFetchPostUseCase.execute(maxPostId: 1)).thenAnswer((_) async => VPostList([vPost]));
        await container.read(timelineNotifierProvider.notifier).fetchPrevious();
        verify(mockFetchPostUseCase.execute(maxPostId: 1));
      });
    });
  });

  group('#length', () {
    group('正常系', () {
      test('state の length が返ってくること', () async {
        final container = createContainer();
        await container.read(timelineNotifierProvider.future);

        when(mockFetchPostUseCase.execute()).thenAnswer((_) async => vPostList);
        await container.read(timelineNotifierProvider.notifier).fetchNext();
        verify(mockFetchPostUseCase.execute());

        final length = container.read(timelineNotifierProvider.notifier).length;
        expect(length, 2);
      });
    });
  });

  group('#maxPostId', () {
    group('正常系', () {
      test('一番値の大きい PostId が返ってくること', () async {
        final container = createContainer();
        await container.read(timelineNotifierProvider.future);

        when(mockFetchPostUseCase.execute()).thenAnswer((_) async => vPostList);
        await container.read(timelineNotifierProvider.notifier).fetchNext();
        verify(mockFetchPostUseCase.execute());

        final maxPostId = container.read(timelineNotifierProvider.notifier).maxPostId;
        expect(maxPostId, 2);
      });
    });
  });

  group('#minPostId', () {
    group('正常系', () {
      test('一番値の小さい PostId が返ってくること', () async {
        final container = createContainer();
        await container.read(timelineNotifierProvider.future);

        when(mockFetchPostUseCase.execute()).thenAnswer((_) async => vPostList);
        await container.read(timelineNotifierProvider.notifier).fetchNext();
        verify(mockFetchPostUseCase.execute());

        final minPostId = container.read(timelineNotifierProvider.notifier).minPostId;
        expect(minPostId, 1);
      });
    });
  });

  group('#add', () {
    group('正常系', () {
      test('state に VPost が追加され、postId の降順でソートされること', () async {
        final container = createContainer();
        await container.read(timelineNotifierProvider.future);

        container.read(timelineNotifierProvider.notifier)
          ..add(vPost1.postId)
          ..add(vPost2.postId);

        final addedResult = await container.read(timelineNotifierProvider.future);
        expect(
          addedResult,
          TimelineState(
            postIdList: PostIdList(
              [
                vPost2.postId,
                vPost1.postId,
              ],
            ),
          ),
        );
      });
    });
  });
}

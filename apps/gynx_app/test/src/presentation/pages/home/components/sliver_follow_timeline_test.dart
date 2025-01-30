// ignore_for_file: lines_longer_than_80_charsutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/models/v_post_list.dart';
import 'package:gynx_app/src/domain/usecases/fetch_post_usecase.dart';
import 'package:gynx_app/src/domain/usecases/find_user_usecase.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post_list_empty.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/sliver_post_list_loading.dart';
import 'package:gynx_app/src/presentation/notifiers/timeline_notifier.dart';
import 'package:gynx_app/src/presentation/pages/home/components/sliver_follow_timeline.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:timeago_flutter/timeago_flutter.dart' as timeago;

import '../../../../../data/dummy_data_generator.dart';
import 'sliver_follow_timeline_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<FetchPostUseCase>(),
  MockSpec<FindUserUseCase>(),
])
void main() {
  final mockFetchPostUseCase = MockFetchPostUseCase();
  final mockFindUserUseCase = MockFindUserUseCase();

  setUpAll(() {
    GetIt.I.registerSingleton<FetchPostUseCase>(mockFetchPostUseCase);
    GetIt.I.registerSingleton<FindUserUseCase>(mockFindUserUseCase);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockFetchPostUseCase);
    verifyNoMoreInteractions(mockFindUserUseCase);
    reset(mockFetchPostUseCase);
    reset(mockFindUserUseCase);
  });

  group('SliverFollowTimeline', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
    }) async {
      timeago.setLocaleMessages('ja', timeago.JaMessages());
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            locale: const Locale('ja'),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: Consumer(
              builder: (context, ref, child) {
                ref.watch(timelineNotifierProvider);
                return child!;
              },
              child: const Scaffold(
                body: CustomScrollView(
                  slivers: [
                    SliverFollowTimeline(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    group('正常系', () {
      testWidgets('初期表示では、SliverPostListLoading が表示されていること', (tester) async {
        when(mockFetchPostUseCase.execute()).thenAnswer(
          (_) async => VPostList.empty,
        );
        await pumpWidget(
          tester: tester,
        );
        verify(mockFetchPostUseCase.execute());
        expect(find.byType(SliverPostListLoading), findsOneWidget);
        expect(find.byType(PostListEmpty), findsNothing);
        expect(find.byType(Post), findsNothing);
      });

      testWidgets('投稿がない場合、PostListEmpty が表示されていること', (tester) async {
        when(mockFetchPostUseCase.execute()).thenAnswer(
          (_) async => VPostList.empty,
        );
        await pumpWidget(
          tester: tester,
        );
        await tester.pump();
        verify(mockFetchPostUseCase.execute());
        expect(find.byType(SliverPostListLoading), findsNothing);
        final postListEmptyFinder = find.byType(PostListEmpty);
        expect(postListEmptyFinder, findsOneWidget);
        final postListEmpty = tester.widget<PostListEmpty>(postListEmptyFinder);
        expect(postListEmpty.icon, isNull);
        expect(postListEmpty.message, isNull);
        expect(find.byType(Post), findsNothing);
      });

      testWidgets('投稿がある場合、その投稿数だけ Post が表示されていること', (tester) async {
        final vPost1 = generateDummyVPost(
          postId: 1,
        );
        final vPost2 = generateDummyVPost(
          postId: 2,
        );
        final vPostList = VPostList([vPost1, vPost2]);
        when(mockFetchPostUseCase.execute()).thenAnswer((_) async => vPostList);
        for (final vPost in vPostList.vPosts) {
          when(mockFindUserUseCase.execute(vPost.userId)).thenAnswer(
            (_) async => generateDummyVUser().copyWith(
              userId: vPost.userId,
            ),
          );
        }
        await pumpWidget(
          tester: tester,
        );
        await tester.pump();
        expect(find.byType(SliverPostListLoading), findsNothing);
        expect(find.byType(PostListEmpty), findsNothing);
        expect(find.byType(Post), findsNWidgets(vPostList.length));
        verifyInOrder([
          mockFetchPostUseCase.execute(),
          mockFindUserUseCase.execute(vPost1.userId),
          mockFindUserUseCase.execute(vPost2.userId),
        ]);
      });
    });
  });
}

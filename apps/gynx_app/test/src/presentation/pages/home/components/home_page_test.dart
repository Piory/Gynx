// ignore_for_file: lines_longer_than_80_charsutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/models/v_post_list.dart';
import 'package:gynx_app/src/domain/usecases/fetch_post_usecase.dart';
import 'package:gynx_app/src/domain/usecases/find_user_usecase.dart';
import 'package:gynx_app/src/domain/usecases/suite_user_usecase.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post_list_empty.dart';
import 'package:gynx_app/src/presentation/pages/home/components/create_post_form.dart';
import 'package:gynx_app/src/presentation/pages/home/home_page.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:timeago_flutter/timeago_flutter.dart' as timeago;
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../../data/dummy_data_generator.dart';
import 'home_page_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<FetchPostUseCase>(),
  MockSpec<FindUserUseCase>(),
  MockSpec<SuiteUserUseCase>(),
])
void main() {
  final mockFetchPostUseCase = MockFetchPostUseCase();
  final mockFindUserUseCase = MockFindUserUseCase();
  final mockSuiteUserUseCase = MockSuiteUserUseCase();

  final suiteUser = generateDummySuiteUser();

  setUpAll(() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    GetIt.I.registerSingleton<FetchPostUseCase>(mockFetchPostUseCase);
    GetIt.I.registerSingleton<FindUserUseCase>(mockFindUserUseCase);
    GetIt.I.registerSingleton<SuiteUserUseCase>(mockSuiteUserUseCase);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockFetchPostUseCase);
    verifyNoMoreInteractions(mockFindUserUseCase);
    verifyNoMoreInteractions(mockSuiteUserUseCase);
    reset(mockFetchPostUseCase);
    reset(mockFindUserUseCase);
    reset(mockSuiteUserUseCase);
  });

  group('HomePage', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      required VPostList vPostList,
    }) async {
      timeago.setLocaleMessages('ja', timeago.JaMessages());
      when(mockFetchPostUseCase.execute()).thenAnswer((_) async => vPostList);
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            locale: Locale('ja'),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: CupertinoScaffold(
              body: HomePage(),
            ),
          ),
        ),
      );
      verify(mockFetchPostUseCase.execute());
      await tester.pump();
    }

    group('正常系', () {
      testWidgets('タイムライン上に表示される投稿がない場合、"No posts" が表示されること', (tester) async {
        await pumpWidget(
          tester: tester,
          vPostList: VPostList.empty,
        );
        expect(find.byType(PostListEmpty), findsOneWidget);
        expect(find.byType(CreatePostForm), findsNothing);
        expect(find.byType(SliverList), findsNothing);
        expect(find.byType(Post), findsNothing);
      });

      testWidgets('タイムライン上に表示される投稿がある場合、投稿が表示されること', (tester) async {
        final vPostList = VPostList(
          List.generate(3, (i) => generateDummyVPost(postId: i)),
        ).sortPostId(descending: true);
        final vPosts = vPostList.vPosts;
        for (final vPost in vPosts) {
          when(mockFindUserUseCase.execute(vPost.userId)).thenAnswer(
            (_) async => generateDummyVUser().copyWith(
              userId: vPost.userId,
            ),
          );
        }
        await pumpWidget(
          tester: tester,
          vPostList: vPostList,
        );
        expect(find.byType(PostListEmpty), findsNothing);
        expect(find.byType(CreatePostForm), findsNothing);
        expect(find.byType(SliverList), findsOneWidget);
        expect(find.byType(Post), findsNWidgets(vPostList.length));
        verifyInOrder([
          for (final vPost in vPosts) mockFindUserUseCase.execute(vPost.userId),
        ]);
      });

      testWidgets('FloatingActionButton をタップすると CreatePostForm が表示されること',
          (tester) async {
        when(mockSuiteUserUseCase.execute()).thenAnswer((_) async => suiteUser);
        await pumpWidget(
          tester: tester,
          vPostList: VPostList.empty,
        );
        expect(find.byType(CreatePostForm), findsNothing);
        await tester.tap(find.byType(FloatingActionButton));
        verifyNever(mockSuiteUserUseCase.execute());
        verifyNever(mockFindUserUseCase.execute(suiteUser.vUserDetail.userId));
        await tester.pumpAndSettle();
        verify(mockSuiteUserUseCase.execute());
        verify(mockFindUserUseCase.execute(suiteUser.vUserDetail.userId));
        expect(find.byType(CreatePostForm), findsOneWidget);
      });
    });
  });
}

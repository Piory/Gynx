// ignore_for_file: lines_longer_than_80_charsutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/models/v_post_list.dart';
import 'package:gynx_app/src/domain/usecases/find_user_usecase.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post_list.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post_list_empty.dart';
import 'package:gynx_app/src/presentation/notifiers/post_map_notifier.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:iconly/iconly.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:timeago_flutter/timeago_flutter.dart' as timeago;

import '../../../../../data/dummy_data_generator.dart';
import 'post_list_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<FindUserUseCase>(),
])
void main() {
  final from = faker.guid.guid();
  final mockFindUserUseCase = MockFindUserUseCase();

  setUpAll(() {
    GetIt.I.registerSingleton<FindUserUseCase>(mockFindUserUseCase);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockFindUserUseCase);
    reset(mockFindUserUseCase);
  });

  group('PostList', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      required String from,
      required Future<bool> Function() onFetchData,
      required VPostList vPostList,
      Icon? emptyIcon,
      String? emptyMessage,
    }) async {
      timeago.setLocaleMessages('ja', timeago.JaMessages());
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            postMapNotifierProvider.overrideWith(
              () => PostMapNotifierMock.vPostList(vPostList),
            ),
          ],
          child: MaterialApp(
            locale: const Locale('ja'),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: Scaffold(
              body: PostList(
                from: from,
                onFetchData: onFetchData,
                postIdList: vPostList.postIdList,
                emptyIcon: emptyIcon,
                emptyMessage: emptyMessage,
              ),
            ),
          ),
        ),
      );
      await tester.pump();
    }

    group('正常系', () {
      testWidgets('投稿がない場合、PostListEmpty が表示されていること', (tester) async {
        const icon = Icon(IconlyLight.paper_negative);
        final emptyMessage = faker.lorem.sentence();
        await pumpWidget(
          tester: tester,
          from: from,
          onFetchData: () => fail('unexpected call'),
          vPostList: VPostList.empty,
          emptyIcon: icon,
          emptyMessage: emptyMessage,
        );
        final postListEmptyFinder = find.byType(PostListEmpty);
        expect(postListEmptyFinder, findsOneWidget);
        final postListEmpty = tester.widget<PostListEmpty>(postListEmptyFinder);
        expect(postListEmpty.icon, icon);
        expect(postListEmpty.message, emptyMessage);
      });

      testWidgets('投稿がある場合、その投稿文だけ Post が表示されていること', (tester) async {
        final vPost1 = generateDummyVPost(
          postId: 1,
        );
        final vPost2 = generateDummyVPost(
          postId: 2,
        );
        final vPostList = VPostList([vPost1, vPost2]);
        when(mockFindUserUseCase.execute(vPost1.userId)).thenAnswer(
          (_) async => generateDummyVUser().copyWith(
            userId: vPost1.userId,
          ),
        );
        when(mockFindUserUseCase.execute(vPost2.userId)).thenAnswer(
          (_) async => generateDummyVUser().copyWith(
            userId: vPost2.userId,
          ),
        );
        await pumpWidget(
          tester: tester,
          from: from,
          onFetchData: () => fail('unexpected call'),
          vPostList: vPostList,
        );
        verifyInOrder([
          mockFindUserUseCase.execute(vPost1.userId),
          mockFindUserUseCase.execute(vPost2.userId),
        ]);
        expect(find.byType(PostListEmpty), findsNothing);
        expect(find.byType(Post), findsNWidgets(vPostList.length));
      });
    });
  });
}

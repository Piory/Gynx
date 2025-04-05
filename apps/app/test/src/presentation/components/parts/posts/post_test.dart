import 'package:app/src/domain/entities/v_post.dart';
import 'package:app/src/domain/usecases/find_user_usecase.dart';
import 'package:app/src/presentation/components/elements/avatars/gynx_id.dart';
import 'package:app/src/presentation/components/elements/medias/media.dart';
import 'package:app/src/presentation/components/elements/medias/media_list.dart';
import 'package:app/src/presentation/components/parts/posts/post.dart';
import 'package:app/src/presentation/navigation/page_navigator.dart';
import 'package:app/src/presentation/navigation/page_type.dart';
import 'package:app/src/presentation/notifiers/post_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:locales/locales.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:timeago_flutter/timeago_flutter.dart' as timeago;

import '../../../../../data/dummy_data_generator.dart';
import 'post_test.mocks.dart';

class FakePostNotifier extends PostNotifier {
  FakePostNotifier(this._vPost);

  final VPost _vPost;

  @override
  VPost build(int postId) => _vPost;
}

@GenerateNiceMocks([
  MockSpec<FindUserUseCase>(),
  MockSpec<PageNavigator>(),
])
void main() {
  final mockFindUserUseCase = MockFindUserUseCase();
  final mockPageNavigator = MockPageNavigator();
  const postId = 12345;
  final vPost = generateDummyVPost(postId: postId);
  final vUser = generateDummyVUser().copyWith(
    userId: vPost.userId,
    avatarUrl: null,
  );

  setUpAll(() {
    GetIt.I.registerSingleton<FindUserUseCase>(mockFindUserUseCase);
    GetIt.I.registerSingleton<PageNavigator>(mockPageNavigator);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockFindUserUseCase);
    verifyNoMoreInteractions(mockPageNavigator);
    reset(mockFindUserUseCase);
    reset(mockPageNavigator);
  });

  group('Post', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      required VPost vPost,
    }) async {
      timeago.setLocaleMessages('ja', timeago.JaMessages());
      when(mockFindUserUseCase.execute(vPost.userId)).thenAnswer((_) async => vUser);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            postNotifierProvider(vPost.postId).overrideWith(
              () => FakePostNotifier(vPost),
            ),
          ],
          child: MaterialApp(
            locale: const Locale('ja'),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: Scaffold(
              body: SingleChildScrollView(
                child: Post(
                  from: 'test',
                  postId: vPost.postId,
                ),
              ),
            ),
          ),
        ),
      );
      verify(mockFindUserUseCase.execute(vPost.userId));
      await tester.pump();
    }

    //
    group('正常系', () {
      testWidgets('ユーザー名、GynxID、投稿文が表示されること', (tester) async {
        await pumpWidget(
          tester: tester,
          vPost: vPost,
        );
        expect(find.text(vUser.username), findsOneWidget);
        expect(find.byType(GynxId), findsOneWidget);
        final gynxId = tester.widget<GynxId>(find.byType(GynxId));
        expect(gynxId.id, vUser.gynxId);
        expect(find.text(vPost.displayText!), findsOneWidget);
        expect(find.byType(MediaList), findsNothing);
      });

      testWidgets('メディアが存在する場合は、MediaList が表示されること', (tester) async {
        final tPostMedia = generateDummyTPostMedia();
        final vPostWithMedia = vPost.copyWith(displayMedias: [tPostMedia]);
        await pumpWidget(
          tester: tester,
          vPost: vPostWithMedia,
        );
        expect(find.text(vUser.username), findsOneWidget);
        expect(find.byType(GynxId), findsOneWidget);
        final gynxId = tester.widget<GynxId>(find.byType(GynxId));
        expect(gynxId.id, vUser.gynxId);
        expect(find.text(vPost.displayText!), findsOneWidget);
        expect(find.byType(MediaList), findsOneWidget);
      });

      testWidgets('Media をタップしたら、PageNavigator#push が呼ばれること', (tester) async {
        final tPostMedia = generateDummyTPostMedia();
        final vPostWithMedia = vPost.copyWith(displayMedias: [tPostMedia]);
        await pumpWidget(
          tester: tester,
          vPost: vPostWithMedia,
        );
        verifyNever(
          mockPageNavigator.push(
            any,
            PageType.postMedia,
            pathParams: {
              'postId': postId,
              'postMediaId': tPostMedia.id,
            },
            queryParams: {
              'f': 'test',
            },
          ),
        );
        await tester.tap(find.byType(Media));
        verify(
          mockPageNavigator.push(
            any,
            PageType.postMedia,
            pathParams: {
              'postId': vPostWithMedia.postId,
              'postMediaId': tPostMedia.id,
            },
            queryParams: {
              'f': 'test',
            },
          ),
        );
      });
    });
  });
}

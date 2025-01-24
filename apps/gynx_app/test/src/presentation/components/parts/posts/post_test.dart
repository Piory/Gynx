// ignore_for_file: lines_longer_than_80_charsutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/domain/usecases/find_user_usecase.dart';
import 'package:gynx_app/src/presentation/components/elements/avatars/gynx_id.dart';
import 'package:gynx_app/src/presentation/components/elements/medias/media_list.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:timeago_flutter/timeago_flutter.dart' as timeago;

import '../../../../../data/dummy_data_generator.dart';
import 'post_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<FindUserUseCase>(),
])
void main() {
  final mockFindUserUseCase = MockFindUserUseCase();
  const postId = 12345;
  final vPost = generateDummyVPost(postId: postId);
  final vUser = generateDummyVUser().copyWith(
    userId: vPost.userId,
    avatarUrl: null,
  );

  setUpAll(() {
    GetIt.I.registerSingleton<FindUserUseCase>(mockFindUserUseCase);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockFindUserUseCase);
    reset(mockFindUserUseCase);
  });

  group('Post', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      required VPost vPost,
    }) async {
      timeago.setLocaleMessages('ja', timeago.JaMessages());
      when(mockFindUserUseCase.execute(vPost.userId))
          .thenAnswer((_) async => vUser);
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            locale: const Locale('ja'),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: Scaffold(
              body: SingleChildScrollView(
                child: Post(
                  vPost: vPost,
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
        expect(find.text(vPost.text!), findsOneWidget);
        expect(find.byType(MediaList), findsNothing);
      });

      testWidgets('メディアが存在する場合は、MediaList が表示されること', (tester) async {
        final tPostMedia = generateDummyTPostMedia();
        final vPostWithMedia = vPost.copyWith(medias: [tPostMedia]);
        await pumpWidget(
          tester: tester,
          vPost: vPostWithMedia,
        );
        expect(find.text(vUser.username), findsOneWidget);
        expect(find.byType(GynxId), findsOneWidget);
        final gynxId = tester.widget<GynxId>(find.byType(GynxId));
        expect(gynxId.id, vUser.gynxId);
        expect(find.text(vPost.text!), findsOneWidget);
        expect(find.byType(MediaList), findsOneWidget);
      });
    });
  });
}

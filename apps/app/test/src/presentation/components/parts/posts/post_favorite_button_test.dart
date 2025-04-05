import 'package:app/src/domain/entities/v_post.dart';
import 'package:app/src/my_app.dart';
import 'package:app/src/presentation/components/elements/texts/number_counter.dart';
import 'package:app/src/presentation/components/parts/posts/post_favorite_button.dart';
import 'package:app/src/presentation/notifiers/post_notifier.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iconly/iconly.dart';
import 'package:locales/locales.dart';

import '../../../../../data/dummy_data_generator.dart';

class FakePostNotifier extends PostNotifier {
  FakePostNotifier(this._vPost);

  var _toggleFavoriteCallCount = 0;

  final VPost _vPost;

  @override
  VPost build(int postId) => _vPost;

  @override
  Future<void> toggleFavorite() async {
    _toggleFavoriteCallCount++;
  }
}

void main() {
  final postId = faker.randomGenerator.integer(100000);
  final vPost = generateDummyVPost(
    postId: postId,
  );

  group('PostFavoriteButton', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      required PostNotifier postNotifier,
      required int postId,
    }) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            postNotifierProvider(postId).overrideWith(() => postNotifier),
          ],
          child: MaterialApp(
            locale: const Locale('ja'),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: Scaffold(
              body: PostFavoriteButton(
                postId: postId,
              ),
            ),
          ),
        ),
      );
    }

    group('正常系', () {
      testWidgets('お気に入りではない場合は、IconlyLight.star が表示されること', (tester) async {
        final fakePostNotifier = FakePostNotifier(vPost.copyWith(
          isFavorited: false,
        ));
        await pumpWidget(
          tester: tester,
          postNotifier: fakePostNotifier,
          postId: postId,
        );
        expect(find.byIcon(IconlyLight.star), findsOneWidget);
        expect(find.byIcon(IconlyBold.star), findsNothing);
        final theme = Theme.of(tester.element(find.byType(PostFavoriteButton)));
        expect(tester.widget<Icon>(find.byType(Icon)).color, theme.colorScheme.onSurfaceVariant);
        expect(tester.widget<NumberCounter>(find.byType(NumberCounter)).value, vPost.favoriteCount);
        expect(fakePostNotifier._toggleFavoriteCallCount, 0);
      });

      testWidgets('お気に入り済みの場合は、IconlyBold.star が表示されること', (tester) async {
        final fakePostNotifier = FakePostNotifier(vPost.copyWith(
          isFavorited: true,
        ));
        await pumpWidget(
          tester: tester,
          postNotifier: fakePostNotifier,
          postId: postId,
        );
        expect(find.byIcon(IconlyLight.star), findsNothing);
        expect(find.byIcon(IconlyBold.star), findsOneWidget);
        expect(tester.widget<Icon>(find.byType(Icon)).color, ColorPalette.favoriteColor);
        expect(tester.widget<NumberCounter>(find.byType(NumberCounter)).value, vPost.favoriteCount);
        expect(fakePostNotifier._toggleFavoriteCallCount, 0);
      });

      testWidgets('InkWell に postNotifier#toggleFavorite が指定されていること', (tester) async {
        final fakePostNotifier = FakePostNotifier(vPost.copyWith(
          isFavorited: false,
        ));
        await pumpWidget(
          tester: tester,
          postNotifier: fakePostNotifier,
          postId: postId,
        );
        expect(fakePostNotifier._toggleFavoriteCallCount, 0);
        await tester.tap(find.byType(PostFavoriteButton));
        expect(fakePostNotifier._toggleFavoriteCallCount, 1);
      });
    });
  });
}

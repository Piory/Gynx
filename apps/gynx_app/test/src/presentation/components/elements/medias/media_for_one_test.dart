import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gynx_app/src/presentation/components/elements/medias/media.dart';
import 'package:gynx_app/src/presentation/components/elements/medias/media_for_one.dart';

void main() {
  const url = 'https://example.com/image.jpg';

  group('MediaForOne', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      required ValueSetter<String>? onTap,
    }) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: MediaForOne(
                url: url,
                heroTagGenerator: (url) => url,
                onTap: onTap,
                onClosed: null,
              ),
            ),
          ),
        ),
      );
    }

    //
    group('正常系', () {
      testWidgets('Media が1つ表示されていること', (tester) async {
        await pumpWidget(
          tester: tester,
          onTap: null,
        );
        expect(find.byType(Media), findsOneWidget);
      });

      testWidgets('1つ目の Media をタップしたら、$url が渡されること', (tester) async {
        var calledCount = 0;
        await pumpWidget(
          tester: tester,
          onTap: (actual) {
            calledCount++;
            expect(actual, url);
          },
        );

        expect(calledCount, 0);
        await tester.tap(find.byType(Media));
        expect(calledCount, 1);
      });
    });
  });
}

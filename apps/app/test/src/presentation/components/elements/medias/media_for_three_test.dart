import 'package:app/src/presentation/components/elements/medias/media.dart';
import 'package:app/src/presentation/components/elements/medias/media_for_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const url1 = 'https://example.com/image1.jpg';
  const url2 = 'https://example.com/image2.jpg';
  const url3 = 'https://example.com/image3.jpg';
  const urls = [url1, url2, url3];

  group('MediaForThree', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      required ValueSetter<String>? onTap,
    }) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: MediaForThree(
                urls: urls,
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
      testWidgets('Media が3つ表示されていること', (tester) async {
        await pumpWidget(
          tester: tester,
          onTap: null,
        );
        expect(find.byType(Media), findsNWidgets(3));
      });

      testWidgets('1つ目の Media をタップしたら、$url1 が渡されること', (tester) async {
        var calledCount = 0;
        await pumpWidget(
          tester: tester,
          onTap: (actual) {
            calledCount++;
            expect(actual, url1);
          },
        );

        expect(calledCount, 0);
        await tester.tap(find.byType(Media).first);
        expect(calledCount, 1);
      });

      testWidgets('2つ目の Media をタップしたら、$url2 が渡されること', (tester) async {
        var calledCount = 0;
        await pumpWidget(
          tester: tester,
          onTap: (actual) {
            calledCount++;
            expect(actual, url2);
          },
        );

        expect(calledCount, 0);
        await tester.tap(find.byType(Media).at(1));
        expect(calledCount, 1);
      });

      testWidgets('3つ目の Media をタップしたら、$url3 が渡されること', (tester) async {
        var calledCount = 0;
        await pumpWidget(
          tester: tester,
          onTap: (actual) {
            calledCount++;
            expect(actual, url3);
          },
        );

        expect(calledCount, 0);
        await tester.tap(find.byType(Media).at(2));
        expect(calledCount, 1);
      });
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gynx_app/src/presentation/components/elements/medias/media.dart';

void main() {
  const url = 'https://example.com/image.jpg';

  group('Media', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      required ValueSetter<String>? onTap,
      required ValueSetter<String>? onClosed,
    }) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Media(
                borderRadius: BorderRadius.circular(8),
                fit: BoxFit.cover,
                url: url,
                onTap: onTap,
                onClosed: onClosed,
              ),
            ),
          ),
        ),
      );
    }

    //
    group('正常系', () {
      testWidgets('onTap が設定されていると、画像をタップした時に、onTap が呼ばれること', (tester) async {
        var calledCount = 0;
        await pumpWidget(
          tester: tester,
          onTap: (actual) {
            calledCount++;
            expect(actual, url);
          },
          onClosed: null,
        );

        expect(calledCount, 0);
        await tester.tap(find.byType(DecoratedBox));
        expect(calledCount, 1);
        expect(find.byIcon(Icons.close), findsNothing);
      });

      testWidgets('onTap が設定しない場合は、タップしてもエラーが発生しないこと', (tester) async {
        await pumpWidget(
          tester: tester,
          onTap: null,
          onClosed: null,
        );

        await tester.tap(find.byType(DecoratedBox));
        expect(find.byIcon(Icons.close), findsNothing);
      });

      testWidgets(
        'onClosed が設定されていると、閉じるボタンをタップした時に、onClosed が呼ばれること',
        (tester) async {
          var calledCount = 0;
          await pumpWidget(
            tester: tester,
            onTap: null,
            onClosed: (actual) {
              calledCount++;
              expect(actual, url);
            },
          );

          expect(calledCount, 0);
          await tester.tap(find.byIcon(Icons.close));
          expect(calledCount, 1);
        },
      );
    });
  });
}

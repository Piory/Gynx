import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:app/src/presentation/components/elements/texts/number_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gynx_l10n/gynx_l10n.dart';

void main() {
  Future<void> pumpWidget({
    required WidgetTester tester,
    required int value,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        home: NumberCounter(
          value: value,
        ),
      ),
    );
  }

  group('正常系', () {
    testWidgets('999未満の場合は、AnimatedFlipCounter が表示されること', (tester) async {
      const value = 999;
      await pumpWidget(
        tester: tester,
        value: value,
      );
      expect(find.byType(AnimatedFlipCounter), findsOneWidget);
      final animatedFlipCounter = tester.widget<AnimatedFlipCounter>(find.byType(AnimatedFlipCounter));
      expect(animatedFlipCounter.value, value);
    });

    testWidgets('1000以上の場合は、AnimatedFlipCounter が表示されないこと', (tester) async {
      const value = 1000;
      await pumpWidget(
        tester: tester,
        value: value,
      );
      expect(find.byType(AnimatedFlipCounter), findsNothing);
      expect(find.byWidgetPredicate((widget) => widget is Text && widget.data == '1K'), findsOneWidget);
    });
  });
}

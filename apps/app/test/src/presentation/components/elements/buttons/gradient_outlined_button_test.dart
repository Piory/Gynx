import 'package:app/src/presentation/components/elements/buttons/gradient_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const child = Center(
    child: Text('Test-1'),
  );

  Future<void> pumpWidget({
    required WidgetTester tester,
    required VoidCallback onPressed,
    required Widget child,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: GradientOutlinedButton(
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  group('正常系', () {
    testWidgets('child に渡された Widget が表示されていること', (tester) async {
      await pumpWidget(
        tester: tester,
        onPressed: () => fail('unexpected call'),
        child: child,
      );
      expect(find.byWidget(child), findsOneWidget);
    });

    testWidgets('onPressed が呼ばれること', (tester) async {
      var onPressedCallCount = 0;
      await pumpWidget(
        tester: tester,
        onPressed: () => onPressedCallCount++,
        child: child,
      );
      expect(onPressedCallCount, 0);
      await tester.tap(find.byType(OutlinedButton));
      expect(onPressedCallCount, 1);
    });
  });
}

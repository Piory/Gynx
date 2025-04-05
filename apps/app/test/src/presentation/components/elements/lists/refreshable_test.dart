import 'package:app/src/presentation/components/elements/lists/refreshable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Refreshable;
import 'package:flutter_test/flutter_test.dart';
import 'package:locales/locales.dart';

void main() {
  const widget = SizedBox(
    height: 1000,
  );

  group('Refreshable', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      required Future<void> Function() onRefresh,
    }) async {
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Refreshable(
                    onRefresh: onRefresh,
                  ),
                  widget,
                ],
              ),
            ),
          ),
        ),
      ));
      await tester.pump();
    }

    group('正常系', () {
      testWidgets('下にドラッグすると、onRefresh が呼ばれること', (tester) async {
        var onRefreshCallCount = 0;
        await pumpWidget(
          tester: tester,
          onRefresh: () async {
            onRefreshCallCount++;
          },
        );

        await tester.ensureVisible(find.byWidget(widget));
        await tester.drag(find.byWidget(widget), const Offset(0, 1000));
        expect(onRefreshCallCount, 0);
        await tester.pumpAndSettle();
        expect(onRefreshCallCount, 1);
      }, skip: true);
    });
  });
}

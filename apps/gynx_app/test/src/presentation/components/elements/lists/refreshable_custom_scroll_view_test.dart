import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gynx_app/src/presentation/components/elements/lists/refreshable_custom_scroll_view.dart';

void main() {
  const sliver = SliverFillRemaining(
    child: Center(
      child: Text('Test-1'),
    ),
  );

  Future<void> pumpWidget({
    required WidgetTester tester,
    required ScrollController? scrollController,
    required Color? backgroundColor,
    required Widget? sliverAppBar,
    required List<Widget> slivers,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RefreshableCustomScrollView(
            scrollController: scrollController,
            backgroundColor: backgroundColor,
            sliverAppBar: sliverAppBar,
            onRefresh: () => fail('unexpected call'),
            slivers: slivers,
          ),
        ),
      ),
    );
  }

  group('正常系', () {
    testWidgets('設定した値がそれぞれ、使用されていること', (tester) async {
      final scrollController = ScrollController();
      const backgroundColor = Colors.red;
      const sliverAppBar = SliverAppBar();
      await pumpWidget(
        tester: tester,
        scrollController: scrollController,
        backgroundColor: backgroundColor,
        sliverAppBar: sliverAppBar,
        slivers: [sliver],
      );
      final coloredBox = tester.widget<ColoredBox>(
        find.byType(ColoredBox),
      );
      expect(coloredBox.color, backgroundColor);
      final customScrollView = tester.widget<CustomScrollView>(
        find.byType(CustomScrollView),
      );
      expect(customScrollView.controller, scrollController);
      expect(find.byWidget(sliverAppBar), findsOneWidget);
      expect(find.byWidget(sliver), findsOneWidget);
    });

    testWidgets('backgroundColor が指定されていない場合、Colors.transparent が使用されていること',
        (tester) async {
      await pumpWidget(
        tester: tester,
        scrollController: null,
        backgroundColor: null,
        sliverAppBar: null,
        slivers: [sliver],
      );
      final coloredBox = tester.widget<ColoredBox>(
        find.byType(ColoredBox),
      );
      expect(coloredBox.color, Colors.transparent);
    });
  });
}

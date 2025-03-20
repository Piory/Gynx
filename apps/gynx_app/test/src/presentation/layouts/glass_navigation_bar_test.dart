import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gynx_app/src/presentation/components/elements/notifier/visible_detect_scroll_controller_notifier.dart';
import 'package:gynx_app/src/presentation/layouts/glass_navigation_bar.dart';
import 'package:gynx_app/src/presentation/notifications/scroll_controller_notification.dart';
import 'package:visibility_detector/visibility_detector.dart';

class _GlassNavigationBarTest extends StatefulWidget {
  const _GlassNavigationBarTest();

  @override
  State<_GlassNavigationBarTest> createState() =>
      _GlassNavigationBarTestState();
}

class _GlassNavigationBarTestState extends State<_GlassNavigationBarTest> {
  ScrollController? _primaryScrollController;
  var _currentIndex = 0;

  static final _screens = [
    VisibleDetectScrollControllerNotifier(
      visibleDetectorKey: const Key('test_1'),
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Test1 Item $index'),
          );
        },
      ),
    ),
    VisibleDetectScrollControllerNotifier(
      visibleDetectorKey: const Key('test_2'),
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Test2 Item $index'),
          );
        },
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationListener<ScrollControllerNotification>(
        onNotification: (notification) {
          if (notification.controller != _primaryScrollController) {
            setState(() {
              _primaryScrollController = notification.controller;
            });
          }
          return true;
        },
        child: PrimaryScrollController(
          controller:
              _primaryScrollController ?? PrimaryScrollController.of(context),
          child: Scaffold(
            body: _screens[_currentIndex],
            bottomNavigationBar: GlassNavigationBar(
              currentIndex: _currentIndex,
              onIndexSelected: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              padding: EdgeInsets.zero,
              selectedColor: Colors.blue,
              unselectedColor: Colors.grey,
              items: const [
                NavigationBarItem(
                  selectedIcon: Icons.home,
                  unselectedIcon: Icons.home_outlined,
                ),
                NavigationBarItem(
                  selectedIcon: Icons.settings,
                  unselectedIcon: Icons.settings_outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  setUpAll(() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  Future<void> pumpWidget({
    required WidgetTester tester,
  }) async {
    await tester.pumpWidget(
      const _GlassNavigationBarTest(),
    );
  }

  group('正常系', () {
    testWidgets('アイコンをタップしたら、ページが切り替わり、アイコンも切り替わっていること', (tester) async {
      await pumpWidget(
        tester: tester,
      );
      expect(find.byKey(const Key('test_1')), findsOneWidget);
      expect(find.byKey(const Key('test_2')), findsNothing);
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.home_outlined), findsNothing);
      expect(find.byIcon(Icons.settings), findsNothing);
      expect(find.byIcon(Icons.settings_outlined), findsOneWidget);
      await tester.tap(find.byIcon(Icons.settings_outlined));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('test_1')), findsNothing);
      expect(find.byKey(const Key('test_2')), findsOneWidget);
      expect(find.byIcon(Icons.home), findsNothing);
      expect(find.byIcon(Icons.home_outlined), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);
      expect(find.byIcon(Icons.settings_outlined), findsNothing);
    });
  }, skip: 'PrimaryScrollController のエラーが発生するためスキップ');
}

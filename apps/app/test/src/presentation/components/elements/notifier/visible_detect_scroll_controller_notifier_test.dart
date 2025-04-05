import 'package:app/src/presentation/components/elements/notifier/visible_detect_scroll_controller_notifier.dart';
import 'package:app/src/presentation/notifications/scroll_controller_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visibility_detector/visibility_detector.dart';

class _VisibleDetectScrollControllerNotifierTest extends StatefulWidget {
  const _VisibleDetectScrollControllerNotifierTest({
    required this.onNotification,
  });

  final NotificationListenerCallback<ScrollControllerNotification> onNotification;

  @override
  State<_VisibleDetectScrollControllerNotifierTest> createState() => _VisibleDetectScrollControllerNotifierTestState();
}

class _VisibleDetectScrollControllerNotifierTestState extends State<_VisibleDetectScrollControllerNotifierTest> {
  var _currentIndex = 0;

  static const _screens = [
    VisibleDetectScrollControllerNotifier(
      visibleDetectorKey: Key('test_1'),
      child: Center(
        child: Text('Test-1'),
      ),
    ),
    VisibleDetectScrollControllerNotifier(
      visibleDetectorKey: Key('test_2'),
      child: Center(
        child: Text('Test-2'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationListener<ScrollControllerNotification>(
        onNotification: widget.onNotification,
        child: Scaffold(
          body: _screens[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Test1',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Test2',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Test3',
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
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
    required NotificationListenerCallback<ScrollControllerNotification> onNotification,
  }) async {
    await tester.pumpWidget(
      _VisibleDetectScrollControllerNotifierTest(
        onNotification: onNotification,
      ),
    );
  }

  group('正常系', () {
    testWidgets('初期状態では、onNotification が1回呼ばれること', (tester) async {
      var callCount = 0;
      await pumpWidget(
        tester: tester,
        onNotification: (_) {
          callCount++;
          return true;
        },
      );
      expect(callCount, 1);
    });

    testWidgets('タブを切り替えたら、再度 onNotification が呼ばれること', (tester) async {
      var callCount = 0;
      await pumpWidget(
        tester: tester,
        onNotification: (_) {
          callCount++;
          return true;
        },
      );
      expect(callCount, 1);
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pump();
      expect(callCount, 2);
    });
  });
}

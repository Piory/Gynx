import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExtension on WidgetTester {
  Future<void> waitForWidget(
    Finder finder, {
    Duration timeout = const Duration(seconds: 5),
  }) async {
    await runAsync(() async {
      final end = DateTime.now().add(timeout);
      while (DateTime.now().isBefore(end)) {
        await Future<void>.delayed(const Duration(milliseconds: 100));
        await pump();
        if (finder.evaluate().isNotEmpty) {
          break;
        }
      }
    });
  }
}

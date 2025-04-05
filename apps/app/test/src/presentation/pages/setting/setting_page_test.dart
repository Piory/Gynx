import 'package:app/src/presentation/navigation/page_navigator.dart';
import 'package:app/src/presentation/pages/setting/setting_controller.dart';
import 'package:app/src/presentation/pages/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:locales/locales.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'setting_page_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SettingController>(),
  MockSpec<PageNavigator>(),
])
void main() {
  final l10nJa = L10nJa();
  final mockSettingController = MockSettingController();
  final mockPageNavigator = MockPageNavigator();

  setUpAll(() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    GetIt.I.registerSingleton<SettingController>(mockSettingController);
    GetIt.I.registerSingleton<PageNavigator>(mockPageNavigator);
  });

  tearDown(() {
    reset(mockSettingController);
    reset(mockPageNavigator);
  });

  Future<void> pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          locale: Locale('ja'),
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          home: SettingPage(),
        ),
      ),
    );
  }

  group('正常系', () {
    testWidgets(
      '「${l10nJa.signOut}」をタップすると、SettingController#signOut が呼ばれること',
      (tester) async {
        await pumpWidget(tester);
        verifyNever(mockSettingController.signOut(any));
        await tester.tap(find.widgetWithText(ElevatedButton, l10nJa.signOut));
        verify(mockSettingController.signOut(any));
      },
    );
  });
}

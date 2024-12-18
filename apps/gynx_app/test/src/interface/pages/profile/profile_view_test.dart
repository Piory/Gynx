// ignore_for_file: lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/interface/pages/profile/profile_controller.dart';
import 'package:gynx_app/src/interface/pages/profile/profile_view.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_view_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ProfileController>(),
])
void main() {
  final l10nJa = L10nJa();
  final mockProfileController = MockProfileController();

  setUpAll(() {
    GetIt.I.registerSingleton<ProfileController>(mockProfileController);
  });

  tearDown(() {
    reset(mockProfileController);
  });

  Future<void> pumpWidget(WidgetTester tester) {
    return tester.pumpWidget(
      const MaterialApp(
        locale: Locale('ja'),
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        home: ProfileView(),
      ),
    );
  }
  //
  // group('初期表示時', () {
  //   group('正常系', () {
  //     testWidgets(
  //       'SignInController#initController が呼ばれること',
  //       (tester) async {
  //         await pumpWidget(tester);
  //         verifyNever(mockProfileController.signInWithAnonymous(any));
  //         await tester.tap(
  //           find.widgetWithText(OutlinedButton, l10nJa.continueAsGuest),
  //         );
  //         verify(mockProfileController.signInWithAnonymous(any));
  //       },
  //     );
  //   });
  // });
}

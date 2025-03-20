import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/interface/pages/sign_in/components/google_oauth_button.dart';
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_controller.dart';
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_view.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_view_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SignInController>(),
])
void main() {
  final l10nJa = L10nJa();
  final mockSignInController = MockSignInController();

  setUpAll(() {
    GetIt.I.registerSingleton<SignInController>(mockSignInController);
  });

  tearDown(() {
    reset(mockSignInController);
  });

  Future<void> pumpWidget(WidgetTester tester) {
    return tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        home: SignInView(),
      ),
    );
  }

  group('正常系', () {
    testWidgets(
      '「${l10nJa.continueAsGuest}」をタップすると SignInController#signInWithAnonymous が呼ばれること',
      (tester) async {
        await pumpWidget(tester);
        verifyNever(mockSignInController.signInWithAnonymous());
        await tester.tap(find.byType(OutlinedButton));
        verify(mockSignInController.signInWithAnonymous());
      },
    );

    testWidgets(
      'GoogleOAuthButton ボタンをタップすると SignInController#signInWithGoogle が呼ばれること',
      (tester) async {
        await pumpWidget(tester);
        verifyNever(mockSignInController.signInWithGoogle());
        await tester.tap(find.byType(GoogleOAuthButton));
        verify(mockSignInController.signInWithGoogle());
      },
    );
  });
}

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
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
  final faker = Faker();
  final mockSignInController = MockSignInController();

  setUpAll(() {
    GetIt.I.registerSingleton<SignInController>(mockSignInController);
  });

  tearDown(() {
    reset(mockSignInController);
  });

  group('正常系', () {
    testWidgets(
      '「${l10nJa.signIn}」ボタンをタップすると SignInController#signIn が呼ばれること',
      (tester) async {
        when(
          mockSignInController.signIn(
            email: anyNamed('email'),
            password: anyNamed('password'),
          ),
        );
        await tester.pumpWidget(
          const MaterialApp(
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: SignInView(),
          ),
        );
        await tester.enterText(
          find.byKey(const Key('email')),
          faker.internet.email(),
        );
        await tester.enterText(
          find.byKey(const Key('password')),
          faker.internet.password(),
        );
        verifyNever(
          mockSignInController.signIn(
            email: anyNamed('email'),
            password: anyNamed('password'),
          ),
        );
        await tester.tap(find.byKey(const Key('sign_in_button')));
        verify(
          mockSignInController.signIn(
            email: anyNamed('email'),
            password: anyNamed('password'),
          ),
        );
      },
    );
  });
}

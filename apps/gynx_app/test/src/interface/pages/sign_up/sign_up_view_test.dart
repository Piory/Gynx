import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/interface/pages/sign_up/sign_up_controller.dart';
import 'package:gynx_app/src/interface/pages/sign_up/sign_up_view.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_up_view_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SignUpController>(),
])
void main() {
  final l10nJa = L10nJa();
  final faker = Faker();
  final mockSignUpController = MockSignUpController();

  setUpAll(() {
    GetIt.I.registerSingleton<SignUpController>(mockSignUpController);
  });

  tearDown(() {
    reset(mockSignUpController);
  });

  group('正常系', () {
    testWidgets(
      '「${l10nJa.signUp}」ボタンをタップすると、SignUpController#signUp が呼ばれること',
      (tester) async {
        when(
          mockSignUpController.signUp(
            email: anyNamed('email'),
            password: anyNamed('password'),
          ),
        );
        await tester.pumpWidget(
          const MaterialApp(
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: SignUpView(),
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
          mockSignUpController.signUp(
            email: anyNamed('email'),
            password: anyNamed('password'),
          ),
        );
        await tester.tap(find.byKey(const Key('sign_up_button')));
        verify(
          mockSignUpController.signUp(
            email: anyNamed('email'),
            password: anyNamed('password'),
          ),
        );
      },
    );
  });
}

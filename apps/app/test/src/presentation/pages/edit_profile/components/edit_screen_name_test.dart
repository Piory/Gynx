import 'package:app/src/domain/usecases/check_screen_name_existence_usecase.dart';
import 'package:app/src/domain/usecases/suite_user_usecase.dart';
import 'package:app/src/presentation/dialogs/loading_dialog.dart';
import 'package:app/src/presentation/navigation/page_navigator.dart';
import 'package:app/src/presentation/pages/edit_profile/components/edit_screen_name.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get_it/get_it.dart';
import 'package:locales/locales.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../data/dummy_data_generator.dart';
import 'edit_screen_name_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LoadingDialog>(),
  MockSpec<PageNavigator>(),
  MockSpec<SuiteUserUseCase>(),
  MockSpec<CheckScreenNameExistenceUseCase>(),
])
void main() {
  final l10nJa = L10nJa();
  final formBuilderLocalizationJa = FormBuilderLocalizationsImplJa();
  final suiteUser = generateDummySuiteUser();
  final mockLoadingDialog = MockLoadingDialog();
  final mockPageNavigator = MockPageNavigator();
  final mockSuiteUserUseCase = MockSuiteUserUseCase();
  final mockCheckScreenNameExistenceUseCase = MockCheckScreenNameExistenceUseCase();

  setUpAll(() {
    GetIt.I.registerSingleton<LoadingDialog>(mockLoadingDialog);
    GetIt.I.registerSingleton<PageNavigator>(mockPageNavigator);
    GetIt.I.registerSingleton<SuiteUserUseCase>(mockSuiteUserUseCase);
    GetIt.I.registerSingleton<CheckScreenNameExistenceUseCase>(
      mockCheckScreenNameExistenceUseCase,
    );
  });

  tearDown(() {
    verifyNoMoreInteractions(mockLoadingDialog);
    verifyNoMoreInteractions(mockPageNavigator);
    verifyNoMoreInteractions(mockSuiteUserUseCase);
    verifyNoMoreInteractions(mockCheckScreenNameExistenceUseCase);
    reset(mockLoadingDialog);
    reset(mockPageNavigator);
    reset(mockSuiteUserUseCase);
    reset(mockCheckScreenNameExistenceUseCase);
  });

  Future<void> pumpWidget({
    required WidgetTester tester,
    required FormFieldSetter<String> onSaved,
  }) async {
    when(mockSuiteUserUseCase.execute()).thenAnswer((_) async => suiteUser);
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          locale: const Locale('ja'),
          localizationsDelegates: const [
            ...L10n.localizationsDelegates,
            ...FormBuilderLocalizations.localizationsDelegates,
          ],
          supportedLocales: L10n.supportedLocales,
          home: EditScreenName(
            onSaved: onSaved,
          ),
        ),
      ),
    );
    verify(mockSuiteUserUseCase.execute());
    await tester.pumpAndSettle();
  }

  //
  group('正常系', () {
    testWidgets('初期表示時に、TextField に、ScreenNameId が表示されること', (tester) async {
      await pumpWidget(
        tester: tester,
        onSaved: (_) => fail('unexpected onChanged'),
      );
      final formBuilderTextField = tester.widget<FormBuilderTextField>(
        find.byType(FormBuilderTextField),
      );
      expect(
        formBuilderTextField.initialValue,
        suiteUser.vUserDetail.screenName,
      );
    });

    testWidgets(
      'ScreenName を変更して、CloseButton をタップすると、onSaved は呼ばれないこと',
      (tester) async {
        await pumpWidget(
          tester: tester,
          onSaved: (_) => fail('unexpected onSaved'),
        );
        await tester.enterText(
          find.byType(FormBuilderTextField),
          'ScreenName',
        );
        await tester.tap(find.byType(CloseButton));
      },
    );

    testWidgets(
      'ScreenName を変更しないで、「${l10nJa.done}」をタップすると、onSaved は呼ばれないこと',
      (tester) async {
        await pumpWidget(
          tester: tester,
          onSaved: (_) => fail('unexpected onSaved'),
        );
        await tester.enterText(
          find.byType(FormBuilderTextField),
          suiteUser.vUserDetail.screenName,
        );
        verifyNever(mockLoadingDialog.show());
        verifyNever(mockPageNavigator.pop(any));
        verifyNever(mockLoadingDialog.hide());
        await tester.tap(find.widgetWithText(TextButton, l10nJa.done));
        verifyInOrder([
          mockLoadingDialog.show(),
          mockPageNavigator.pop(any),
          mockLoadingDialog.hide(),
        ]);
        verifyNever(mockCheckScreenNameExistenceUseCase.execute('ScreenName'));
      },
    );

    testWidgets(
      'ScreenName を変更して、「${l10nJa.done}」をタップすると、onSaved が呼ばれること',
      (tester) async {
        when(mockCheckScreenNameExistenceUseCase.execute('ScreenName')).thenAnswer((_) async => false);
        var onSavedCallCount = 0;
        await pumpWidget(
          tester: tester,
          onSaved: (screenName) {
            expect(screenName, 'ScreenName');
            onSavedCallCount++;
          },
        );
        await tester.enterText(
          find.byType(FormBuilderTextField),
          'ScreenName',
        );
        expect(onSavedCallCount, 0);
        verifyNever(mockLoadingDialog.show());
        verifyNever(mockCheckScreenNameExistenceUseCase.execute('ScreenName'));
        verifyNever(mockPageNavigator.pop(any));
        verifyNever(mockLoadingDialog.hide());
        await tester.tap(find.widgetWithText(TextButton, l10nJa.done));
        expect(onSavedCallCount, 1);
        verifyInOrder([
          mockLoadingDialog.show(),
          mockCheckScreenNameExistenceUseCase.execute('ScreenName'),
          mockPageNavigator.pop(any),
          mockLoadingDialog.hide(),
        ]);
      },
    );

    testWidgets(
      '文字列が${Constant.screenNameMaxLength + 1}文字以上の場合、「${l10nJa.done}」をタップしたら、${Constant.screenNameMaxLength + 1}文字目以降は切り取られること',
      (tester) async {
        var onSavedCallCount = 0;
        await pumpWidget(
          tester: tester,
          onSaved: (screenName) {
            expect(screenName, '1234567890123456');
            onSavedCallCount++;
          },
        );
        await tester.enterText(
          find.byType(FormBuilderTextField),
          '123456789012345678901234567890',
        );
        expect(onSavedCallCount, 0);
        verifyNever(mockLoadingDialog.show());
        verifyNever(
          mockCheckScreenNameExistenceUseCase.execute('1234567890123456'),
        );
        verifyNever(mockPageNavigator.pop(any));
        verifyNever(mockLoadingDialog.hide());
        await tester.tap(find.widgetWithText(TextButton, l10nJa.done));
        expect(onSavedCallCount, 1);
        verifyInOrder([
          mockLoadingDialog.show(),
          mockCheckScreenNameExistenceUseCase.execute('1234567890123456'),
          mockPageNavigator.pop(any),
          mockLoadingDialog.hide(),
        ]);
      },
    );
  });

  group('準正常系', () {
    testWidgets(
      'ScreenName が空文字の場合、「${l10nJa.done}」をタップしたら、onSaved が呼ばれなく、「${formBuilderLocalizationJa.minLengthErrorText(Constant.screenNameMinLength)}」が表示されること',
      (tester) async {
        final errorMessageFinder = find.text(
          formBuilderLocalizationJa.minLengthErrorText(Constant.screenNameMinLength),
        );
        await pumpWidget(
          tester: tester,
          onSaved: (_) => fail('unexpected onSaved'),
        );
        await tester.enterText(find.byType(FormBuilderTextField), '');
        verifyNever(mockLoadingDialog.show());
        verifyNever(mockLoadingDialog.hide());
        await tester.tap(find.widgetWithText(TextButton, l10nJa.done));
        verifyInOrder([
          mockLoadingDialog.show(),
          mockLoadingDialog.hide(),
        ]);
        expect(errorMessageFinder, findsNothing);
        await tester.pumpAndSettle();
        expect(errorMessageFinder, findsOneWidget);
        verifyNever(mockCheckScreenNameExistenceUseCase.execute(any));
        verifyNever(mockPageNavigator.pop(any));
      },
    );

    testWidgets(
      '文字列が3文字以下の場合、「${l10nJa.done}」をタップしたら、onSaved が呼ばれなく、「${formBuilderLocalizationJa.minLengthErrorText(Constant.screenNameMinLength)}」が表示されること',
      (tester) async {
        final errorMessageFinder = find.text(formBuilderLocalizationJa.minLengthErrorText(4));
        await pumpWidget(
          tester: tester,
          onSaved: (_) => fail('unexpected onSaved'),
        );
        await tester.enterText(find.byType(FormBuilderTextField), '123');
        verifyNever(mockLoadingDialog.show());
        verifyNever(mockLoadingDialog.hide());
        await tester.tap(find.widgetWithText(TextButton, l10nJa.done));
        verifyInOrder([
          mockLoadingDialog.show(),
          mockLoadingDialog.hide(),
        ]);
        expect(errorMessageFinder, findsNothing);
        await tester.pumpAndSettle();
        expect(errorMessageFinder, findsOneWidget);
        verifyNever(mockCheckScreenNameExistenceUseCase.execute(any));
        verifyNever(mockPageNavigator.pop(any));
      },
    );

    testWidgets(
      '既に存在する表示名を入力した場合は、「${l10nJa.editScreenNameExistenceError}」が表示されること',
      (tester) async {
        final errorMessageFinder = find.text(l10nJa.editScreenNameExistenceError);
        when(mockCheckScreenNameExistenceUseCase.execute('ScreenName')).thenAnswer((_) async => true);
        await pumpWidget(
          tester: tester,
          onSaved: (_) => fail('unexpected onSaved'),
        );
        await tester.enterText(
          find.byType(FormBuilderTextField),
          'ScreenName',
        );
        verifyNever(mockLoadingDialog.show());
        verifyNever(mockLoadingDialog.hide());
        await tester.tap(find.widgetWithText(TextButton, l10nJa.done));
        verifyInOrder([
          mockLoadingDialog.show(),
          mockCheckScreenNameExistenceUseCase.execute('ScreenName'),
          mockLoadingDialog.hide(),
        ]);
        expect(errorMessageFinder, findsNothing);
        await tester.pumpAndSettle();
        expect(errorMessageFinder, findsOneWidget);
        verifyNever(mockPageNavigator.pop(any));
      },
    );
  });
}

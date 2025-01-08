// ignore_for_file: lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/usecases/check_gynx_id_existence_usecase.dart';
import 'package:gynx_app/src/domain/usecases/suite_user_usecase.dart';
import 'package:gynx_app/src/presentation/dialogs/loading_dialog.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/pages/edit_profile/components/edit_gynx_id.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../data/dummy_data_generator.dart';
import 'edit_gynx_id_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LoadingDialog>(),
  MockSpec<PageNavigator>(),
  MockSpec<SuiteUserUseCase>(),
  MockSpec<CheckGynxIdExistenceUsecase>(),
])
void main() {
  final l10nJa = L10nJa();
  final formBuilderLocalizationJa = FormBuilderLocalizationsImplJa();
  final suiteUser = generateDummySuiteUser();
  final mockLoadingDialog = MockLoadingDialog();
  final mockPageNavigator = MockPageNavigator();
  final mockSuiteUserUseCase = MockSuiteUserUseCase();
  final mockCheckGynxIdExistenceUseCase = MockCheckGynxIdExistenceUsecase();

  setUpAll(() {
    GetIt.I.registerSingleton<LoadingDialog>(mockLoadingDialog);
    GetIt.I.registerSingleton<PageNavigator>(mockPageNavigator);
    GetIt.I.registerSingleton<SuiteUserUseCase>(mockSuiteUserUseCase);
    GetIt.I.registerSingleton<CheckGynxIdExistenceUsecase>(
      mockCheckGynxIdExistenceUseCase,
    );
  });

  tearDown(() {
    verifyNoMoreInteractions(mockLoadingDialog);
    verifyNoMoreInteractions(mockPageNavigator);
    verifyNoMoreInteractions(mockSuiteUserUseCase);
    verifyNoMoreInteractions(mockCheckGynxIdExistenceUseCase);
    reset(mockLoadingDialog);
    reset(mockPageNavigator);
    reset(mockSuiteUserUseCase);
    reset(mockCheckGynxIdExistenceUseCase);
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
          home: EditGynxId(
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
    testWidgets('初期表示時に、TextField に、GynxId が表示されること', (tester) async {
      await pumpWidget(
        tester: tester,
        onSaved: (_) => fail('unexpected onChanged'),
      );
      final formBuilderTextField = tester.widget<FormBuilderTextField>(
        find.byType(FormBuilderTextField),
      );
      expect(
        formBuilderTextField.initialValue,
        suiteUser.tUser.gynxId,
      );
    });

    testWidgets(
      'GynxID を変更して、CloseButton をタップすると、onSaved は呼ばれないこと',
      (tester) async {
        await pumpWidget(
          tester: tester,
          onSaved: (_) => fail('unexpected onSaved'),
        );
        await tester.enterText(
          find.byType(FormBuilderTextField),
          'gynx',
        );
        await tester.tap(find.byType(CloseButton));
      },
    );

    testWidgets(
      'GynxID を変更しないで、「${l10nJa.done}」をタップすると、onSaved は呼ばれないこと',
      (tester) async {
        await pumpWidget(
          tester: tester,
          onSaved: (_) => fail('unexpected onSaved'),
        );
        await tester.enterText(
          find.byType(FormBuilderTextField),
          suiteUser.tUser.gynxId,
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
        verifyNever(mockCheckGynxIdExistenceUseCase.execute('Gynx'));
      },
    );

    testWidgets(
      'GynxID を変更して、「${l10nJa.done}」をタップすると、onSaved が呼ばれること',
      (tester) async {
        when(mockCheckGynxIdExistenceUseCase.execute('Gynx'))
            .thenAnswer((_) async => false);
        var onSavedCallCount = 0;
        await pumpWidget(
          tester: tester,
          onSaved: (gynxId) {
            expect(gynxId, 'Gynx');
            onSavedCallCount++;
          },
        );
        await tester.enterText(
          find.byType(FormBuilderTextField),
          'Gynx',
        );
        expect(onSavedCallCount, 0);
        verifyNever(mockLoadingDialog.show());
        verifyNever(mockCheckGynxIdExistenceUseCase.execute('Gynx'));
        verifyNever(mockPageNavigator.pop(any));
        verifyNever(mockLoadingDialog.hide());
        await tester.tap(find.widgetWithText(TextButton, l10nJa.done));
        expect(onSavedCallCount, 1);
        verifyInOrder([
          mockLoadingDialog.show(),
          mockCheckGynxIdExistenceUseCase.execute('Gynx'),
          mockPageNavigator.pop(any),
          mockLoadingDialog.hide(),
        ]);
      },
    );

    testWidgets(
      '文字列が17文字以上の場合、「${l10nJa.done}」をタップしたら、17文字目以降は切り取られること',
      (tester) async {
        var onSavedCallCount = 0;
        await pumpWidget(
          tester: tester,
          onSaved: (gynxId) {
            expect(gynxId, '1234567890123456');
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
            mockCheckGynxIdExistenceUseCase.execute('1234567890123456'));
        verifyNever(mockPageNavigator.pop(any));
        verifyNever(mockLoadingDialog.hide());
        await tester.tap(find.widgetWithText(TextButton, l10nJa.done));
        expect(onSavedCallCount, 1);
        verifyInOrder([
          mockLoadingDialog.show(),
          mockCheckGynxIdExistenceUseCase.execute('1234567890123456'),
          mockPageNavigator.pop(any),
          mockLoadingDialog.hide(),
        ]);
      },
    );
  });

  group('準正常系', () {
    testWidgets(
      'GynxID が空文字の場合、「${l10nJa.done}」をタップしたら、onSaved が呼ばれなく、「${formBuilderLocalizationJa.minLengthErrorText(4)}」が表示されること',
      (tester) async {
        final errorMessageFinder =
            find.text(formBuilderLocalizationJa.minLengthErrorText(4));
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
        verifyNever(mockCheckGynxIdExistenceUseCase.execute(any));
        verifyNever(mockPageNavigator.pop(any));
      },
    );

    testWidgets(
      '文字列が3文字以下の場合、「${l10nJa.done}」をタップしたら、onSaved が呼ばれなく、「${formBuilderLocalizationJa.minLengthErrorText(4)}」が表示されること',
      (tester) async {
        final errorMessageFinder =
            find.text(formBuilderLocalizationJa.minLengthErrorText(4));
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
        verifyNever(mockCheckGynxIdExistenceUseCase.execute(any));
        verifyNever(mockPageNavigator.pop(any));
      },
    );

    testWidgets(
      '既に存在する GynxID を入力した場合は、「${l10nJa.editGynxIdExistenceError}」が表示されること',
      (tester) async {
        final errorMessageFinder = find.text(l10nJa.editGynxIdExistenceError);
        when(mockCheckGynxIdExistenceUseCase.execute('Gynx'))
            .thenAnswer((_) async => true);
        await pumpWidget(
          tester: tester,
          onSaved: (_) => fail('unexpected onSaved'),
        );
        await tester.enterText(
          find.byType(FormBuilderTextField),
          'Gynx',
        );
        verifyNever(mockLoadingDialog.show());
        verifyNever(mockLoadingDialog.hide());
        await tester.tap(find.widgetWithText(TextButton, l10nJa.done));
        verifyInOrder([
          mockLoadingDialog.show(),
          mockCheckGynxIdExistenceUseCase.execute('Gynx'),
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

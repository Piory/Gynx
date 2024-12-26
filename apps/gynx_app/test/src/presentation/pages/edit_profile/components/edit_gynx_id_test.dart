// ignore_for_file: lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/usecases/suite_user_usecase.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/pages/edit_profile/components/edit_gynx_id.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../data/dummy_data_generator.dart';
import 'edit_gynx_id_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<PageNavigator>(),
  MockSpec<SuiteUserUseCase>(),
])
void main() {
  final l10nJa = L10nJa();
  final formBuilderLocalizationJa = FormBuilderLocalizationsImplJa();
  final suiteUser = generateDummySuiteUser();
  final mockPageNavigator = MockPageNavigator();
  final mockSuiteUserUseCase = MockSuiteUserUseCase();

  setUpAll(() {
    GetIt.I.registerSingleton<PageNavigator>(mockPageNavigator);
    GetIt.I.registerSingleton<SuiteUserUseCase>(mockSuiteUserUseCase);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockPageNavigator);
    verifyNoMoreInteractions(mockSuiteUserUseCase);
    reset(mockPageNavigator);
    reset(mockSuiteUserUseCase);
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
      'GynxID を変更して、「${l10nJa.done}」をタップすると、onSaved が呼ばれること',
      (tester) async {
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
        verifyNever(mockPageNavigator.pop(any));
        await tester.tap(find.widgetWithText(TextButton, l10nJa.done));
        expect(onSavedCallCount, 1);
        verify(mockPageNavigator.pop(any));
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
        verifyNever(mockPageNavigator.pop(any));
        await tester.tap(find.widgetWithText(TextButton, l10nJa.done));
        expect(onSavedCallCount, 1);
        verify(mockPageNavigator.pop(any));
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
        await tester.tap(find.widgetWithText(TextButton, l10nJa.done));
        expect(errorMessageFinder, findsNothing);
        await tester.pumpAndSettle();
        expect(errorMessageFinder, findsOneWidget);
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
        await tester.tap(find.widgetWithText(TextButton, l10nJa.done));
        expect(errorMessageFinder, findsNothing);
        await tester.pumpAndSettle();
        expect(errorMessageFinder, findsOneWidget);
      },
    );
  });
}

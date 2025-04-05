// ignore_for_file: lines_longer_than_80_chars
import 'package:app/src/domain/usecases/suite_user_usecase.dart';
import 'package:app/src/presentation/navigation/page_navigator.dart';
import 'package:app/src/presentation/pages/edit_profile/components/edit_self_introduction.dart';
import 'package:config/config.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../data/dummy_data_generator.dart';
import 'edit_self_introduction_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<PageNavigator>(),
  MockSpec<SuiteUserUseCase>(),
])
void main() {
  final l10nJa = L10nJa();
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
          home: EditSelfIntroduction(
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
    testWidgets('初期表示時に、TextField に、selfIntroduction が表示されること', (tester) async {
      await pumpWidget(
        tester: tester,
        onSaved: (_) => fail('unexpected onChanged'),
      );
      final formBuilderTextField = tester.widget<FormBuilderTextField>(
        find.byType(FormBuilderTextField),
      );
      expect(
        formBuilderTextField.initialValue,
        suiteUser.vUserDetail.selfIntroduction,
      );
    });

    testWidgets(
      '自己紹介文を変更して、CloseButton をタップすると、onSaved は呼ばれないこと',
      (tester) async {
        await pumpWidget(
          tester: tester,
          onSaved: (_) => fail('unexpected onSaved'),
        );
        await tester.enterText(
          find.byType(FormBuilderTextField),
          'new self introduction',
        );
        await tester.tap(find.byType(CloseButton));
      },
    );

    testWidgets(
      '自己紹介文を変更して、「${l10nJa.done}」をタップすると、onSaved が呼ばれること',
      (tester) async {
        final newSelfIntroduction = faker.lorem.sentence();
        var onSavedCallCount = 0;
        await pumpWidget(
          tester: tester,
          onSaved: (selfIntroduction) {
            expect(selfIntroduction, newSelfIntroduction);
            onSavedCallCount++;
          },
        );
        await tester.enterText(
          find.byType(FormBuilderTextField),
          newSelfIntroduction,
        );
        expect(onSavedCallCount, 0);
        verifyNever(mockPageNavigator.pop(any));
        await tester.tap(find.widgetWithText(TextButton, l10nJa.done));
        expect(onSavedCallCount, 1);
        verify(mockPageNavigator.pop(any));
      },
    );

    testWidgets(
      '文字列が${Constant.selfIntroductionMaxLength + 1}文字以上の場合、「${l10nJa.done}」をタップしたら、${Constant.selfIntroductionMaxLength + 1}文字目以降は切り取られること',
      (tester) async {
        final newSelfIntroduction = 'a' * (Constant.selfIntroductionMaxLength + 1);
        var onSavedCallCount = 0;
        await pumpWidget(
          tester: tester,
          onSaved: (selfIntroduction) {
            expect(
              selfIntroduction,
              newSelfIntroduction.substring(
                0,
                Constant.selfIntroductionMaxLength,
              ),
            );
            onSavedCallCount++;
          },
        );
        await tester.enterText(
          find.byType(FormBuilderTextField),
          newSelfIntroduction,
        );
        expect(onSavedCallCount, 0);
        verifyNever(mockPageNavigator.pop(any));
        await tester.tap(find.widgetWithText(TextButton, l10nJa.done));
        expect(onSavedCallCount, 1);
        verify(mockPageNavigator.pop(any));
      },
    );
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/navigation/page_type.dart';
import 'package:gynx_app/src/presentation/pages/profile/components/edit_profile_button.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'edit_profile_button_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<PageNavigator>(),
])
void main() {
  final mockPageNavigator = MockPageNavigator();

  setUpAll(() {
    GetIt.I.registerSingleton<PageNavigator>(mockPageNavigator);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockPageNavigator);
    reset(mockPageNavigator);
  });

  group('EditProfileButton', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
    }) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            locale: Locale('ja'),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: Scaffold(
              body: EditProfileButton(),
            ),
          ),
        ),
      );
    }

    group('正常系', () {
      testWidgets('編集ボタンをタップすると、EditProfile 画面に遷移すること', (tester) async {
        await pumpWidget(
          tester: tester,
        );
        verifyNever(mockPageNavigator.push(any, PageType.editProfile));
        await tester.tap(find.byType(OutlinedButton));
        verify(mockPageNavigator.push(any, PageType.editProfile));
      });
    });
  });
}

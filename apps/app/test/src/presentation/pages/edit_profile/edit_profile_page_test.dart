import 'package:app/src/domain/usecases/suite_user_usecase.dart';
import 'package:app/src/presentation/pages/edit_profile/components/edit_avatar.dart';
import 'package:app/src/presentation/pages/edit_profile/components/edit_display_name.dart';
import 'package:app/src/presentation/pages/edit_profile/components/edit_screen_name.dart';
import 'package:app/src/presentation/pages/edit_profile/components/edit_self_introduction.dart';
import 'package:app/src/presentation/pages/edit_profile/edit_profile_controller.dart';
import 'package:app/src/presentation/pages/edit_profile/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:locales/locales.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../data/dummy_data_generator.dart';
import '../../../../extensions/widget_tester_extension.dart';
import 'edit_profile_page_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<EditProfileController>(),
  MockSpec<SuiteUserUseCase>(),
])
void main() {
  final l10nJa = L10nJa();
  final suiteUser = generateDummySuiteUser();
  final mockEditProfileController = MockEditProfileController();
  final mockSuiteUserUseCase = MockSuiteUserUseCase();

  setUpAll(() {
    GetIt.I.registerSingleton<EditProfileController>(mockEditProfileController);
    GetIt.I.registerSingleton<SuiteUserUseCase>(mockSuiteUserUseCase);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockEditProfileController);
    verifyNoMoreInteractions(mockSuiteUserUseCase);
    reset(mockEditProfileController);
    reset(mockSuiteUserUseCase);
  });

  Future<void> pumpWidget(WidgetTester tester) async {
    when(mockSuiteUserUseCase.execute()).thenAnswer((_) async => suiteUser);
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          locale: Locale('ja'),
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          home: EditProfilePage(),
        ),
      ),
    );
    verify(mockSuiteUserUseCase.execute());
    await tester.pump();
  }

  //
  group('正常系', () {
    testWidgets('EditAvatar、ユーザー名、表示名、自己紹介が表示されること', (tester) async {
      await pumpWidget(tester);
      final editAvatar = tester.widget<EditAvatar>(find.byType(EditAvatar));
      expect(editAvatar.avatarUrl, suiteUser.vUserDetail.avatarUrl);
      expect(find.text(suiteUser.vUserDetail.displayName), findsOneWidget);
      expect(find.text(suiteUser.vUserDetail.screenName), findsOneWidget);
      expect(
        find.text(suiteUser.vUserDetail.selfIntroduction),
        findsOneWidget,
      );
      verifyZeroInteractions(mockEditProfileController);
    });

    testWidgets('CloseButton をタップしても、EditProfileController#updateUserProfile が呼ばれないこと', (tester) async {
      await pumpWidget(tester);
      verifyZeroInteractions(mockEditProfileController);
      await tester.tap(find.byType(CloseButton));
      verifyZeroInteractions(mockEditProfileController);
    });

    testWidgets('「${l10nJa.done}」をタップすると、EditProfileController#updateUserProfile が呼ばれること', (tester) async {
      await pumpWidget(tester);
      verifyNever(
        mockEditProfileController.updateUserProfile(
          context: anyNamed('context'),
          l10n: anyNamed('l10n'),
          ref: anyNamed('ref'),
          screenName: null,
          displayName: null,
          avatarFile: null,
          isDeleteAvatar: false,
          selfIntroduction: null,
        ),
      );
      await tester.tap(find.text(l10nJa.done));
      verify(
        mockEditProfileController.updateUserProfile(
          context: anyNamed('context'),
          l10n: anyNamed('l10n'),
          ref: anyNamed('ref'),
          screenName: null,
          displayName: null,
          avatarFile: null,
          isDeleteAvatar: false,
          selfIntroduction: null,
        ),
      );
    });

    testWidgets('表示名をタップしたら、EditDisplayName を表示されること', (tester) async {
      await pumpWidget(tester);
      await tester.tap(find.text(suiteUser.vUserDetail.displayName));
      await tester.pump();
      await tester.waitForWidget(find.byType(EditDisplayName));
      expect(find.byType(EditDisplayName), findsOneWidget);
    });

    testWidgets('ハンドルをタップしたら、EditScreenName を表示されること', (tester) async {
      await pumpWidget(tester);
      await tester.tap(find.text(suiteUser.vUserDetail.screenName));
      await tester.waitForWidget(find.byType(EditScreenName));
      expect(find.byType(EditScreenName), findsOneWidget);
    });

    testWidgets('自己紹介をタップしたら、EditSelfIntroduction を表示されること', (tester) async {
      await pumpWidget(tester);
      await tester.tap(find.text(suiteUser.vUserDetail.selfIntroduction));
      await tester.pump();
      await tester.waitForWidget(find.byType(EditSelfIntroduction));
      expect(find.byType(EditSelfIntroduction), findsOneWidget);
    });
  });
}

// ignore_for_file: lines_longer_than_80_chars
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/presentation/dialogs/loading_dialog.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/pages/edit_profile/components/edit_avatar.dart';
import 'package:gynx_app/src/presentation/pages/edit_profile/components/edit_avatar_menu.dart';
import 'package:gynx_app/src/presentation/pages/edit_profile/edit_profile_controller.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'edit_avatar_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<EditProfileController>(),
  MockSpec<XFile>(),
  MockSpec<ImagePicker>(),
  MockSpec<LoadingDialog>(),
  MockSpec<PageNavigator>(),
])
void main() {
  final avatarUrl = faker.image.loremPicsum();
  final mockImagePicker = MockImagePicker();
  final mockLoadingDialog = MockLoadingDialog();
  final mockPageNavigator = MockPageNavigator();
  final mockEditProfileController = MockEditProfileController();

  setUpAll(() {
    GetIt.I.registerSingleton<ImagePicker>(mockImagePicker);
    GetIt.I.registerSingleton<LoadingDialog>(mockLoadingDialog);
    GetIt.I.registerSingleton<PageNavigator>(mockPageNavigator);
    GetIt.I.registerSingleton<EditProfileController>(mockEditProfileController);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockImagePicker);
    verifyNoMoreInteractions(mockLoadingDialog);
    verifyNoMoreInteractions(mockPageNavigator);
    verifyNoMoreInteractions(mockEditProfileController);
    reset(mockImagePicker);
    reset(mockLoadingDialog);
    reset(mockPageNavigator);
    reset(mockEditProfileController);
  });

  group('EditAvatar', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      required String? avatarUrl,
      required ValueChanged<XFile?> onChanged,
    }) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            locale: const Locale('ja'),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: Scaffold(
              body: EditAvatar(
                avatarUrl: avatarUrl,
                onChanged: onChanged,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    //
    group('正常系', () {
      testWidgets(
        'EditAvatar をタップすると、EditAvatarMenu が表示されること、avatarUrl を指定した場合は、visibleDelete が true になること',
        (tester) async {
          await pumpWidget(
            tester: tester,
            avatarUrl: avatarUrl,
            onChanged: (_) => fail('unexpected onChanged'),
          );
          final editAvatarMenuFinder = find.byType(EditAvatarMenu);
          expect(editAvatarMenuFinder, findsNothing);
          await tester.tap(find.byType(EditAvatar));
          await tester.pumpAndSettle();
          expect(editAvatarMenuFinder, findsOneWidget);
          final editAvatarMenu = tester.widget<EditAvatarMenu>(
            editAvatarMenuFinder,
          );
          expect(editAvatarMenu.visibleDelete, isTrue);
        },
      );

      testWidgets(
        'EditAvatar をタップすると、EditAvatarMenu が表示されること、avatarUrl に null を指定した場合は、visibleDelete が false になること',
        (tester) async {
          await pumpWidget(
            tester: tester,
            avatarUrl: null,
            onChanged: (_) => fail('unexpected onChanged'),
          );
          final editAvatarMenuFinder = find.byType(EditAvatarMenu);
          expect(editAvatarMenuFinder, findsNothing);
          await tester.tap(find.byType(EditAvatar));
          await tester.pumpAndSettle();
          expect(editAvatarMenuFinder, findsOneWidget);
          final editAvatarMenu = tester.widget<EditAvatarMenu>(
            editAvatarMenuFinder,
          );
          expect(editAvatarMenu.visibleDelete, isFalse);
        },
      );
    });
  });

  group('EditAvatar.loading', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
    }) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            locale: const Locale('ja'),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: Scaffold(
              body: EditAvatar.loading(),
            ),
          ),
        ),
      );
    }

    //
    group('正常系', () {
      testWidgets(
        'EditAvatar をタップしても、EditAvatarMenu が表示されないこと',
        (tester) async {
          await pumpWidget(
            tester: tester,
          );
          final editAvatarMenuFinder = find.byType(EditAvatarMenu);
          expect(editAvatarMenuFinder, findsNothing);
          await tester.tap(find.byType(EditAvatar));
          expect(editAvatarMenuFinder, findsNothing);
        },
      );
    });
  });
}

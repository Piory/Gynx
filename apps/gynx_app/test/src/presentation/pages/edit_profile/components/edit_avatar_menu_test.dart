// ignore_for_file: lines_longer_than_80_chars
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/presentation/dialogs/loading_dialog.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/pages/edit_profile/components/edit_avatar_menu.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'edit_avatar_menu_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<XFile>(),
  MockSpec<ImagePicker>(),
  MockSpec<LoadingDialog>(),
  MockSpec<PageNavigator>(),
])
void main() {
  final l10nJa = L10nJa();
  final mockXFile = MockXFile();
  final mockImagePicker = MockImagePicker();
  final mockLoadingDialog = MockLoadingDialog();
  final mockPageNavigator = MockPageNavigator();

  setUpAll(() {
    GetIt.I.registerSingleton<ImagePicker>(mockImagePicker);
    GetIt.I.registerSingleton<LoadingDialog>(mockLoadingDialog);
    GetIt.I.registerSingleton<PageNavigator>(mockPageNavigator);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockXFile);
    verifyNoMoreInteractions(mockImagePicker);
    verifyNoMoreInteractions(mockLoadingDialog);
    verifyNoMoreInteractions(mockPageNavigator);
    reset(mockXFile);
    reset(mockImagePicker);
    reset(mockLoadingDialog);
    reset(mockPageNavigator);
  });

  Future<void> pumpWidget({
    required WidgetTester tester,
    required bool visibleDelete,
    required ValueChanged<XFile?> onChanged,
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          locale: const Locale('ja'),
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          home: Scaffold(
            body: EditAvatarMenu(
              visibleDelete: visibleDelete,
              onChanged: onChanged,
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  //
  group('初期表示時', () {
    group('正常系', () {
      testWidgets('visibleDelete が true の場合、「${l10nJa.deleteImage}」が表示されること',
          (tester) async {
        await pumpWidget(
          tester: tester,
          visibleDelete: true,
          onChanged: (_) => fail('unexpected onChanged'),
        );
        expect(
          find.widgetWithIcon(ListTile, IconlyBold.camera),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(ListTile, l10nJa.takePhoto),
          findsOneWidget,
        );
        expect(
          find.widgetWithIcon(ListTile, IconlyBold.image),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(ListTile, l10nJa.selectFromLibrary),
          findsOneWidget,
        );
        expect(
          find.widgetWithIcon(ListTile, IconlyBold.delete),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(ListTile, l10nJa.deleteImage),
          findsOneWidget,
        );
        expect(
          find.text(l10nJa.cancel),
          findsOneWidget,
        );
      });

      testWidgets('visibleDelete が false の場合、「${l10nJa.deleteImage}」が表示されないこと',
          (tester) async {
        await pumpWidget(
          tester: tester,
          visibleDelete: false,
          onChanged: (_) => fail('unexpected onChanged'),
        );
        expect(
          find.widgetWithIcon(ListTile, IconlyBold.camera),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(ListTile, l10nJa.takePhoto),
          findsOneWidget,
        );
        expect(
          find.widgetWithIcon(ListTile, IconlyBold.image),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(ListTile, l10nJa.selectFromLibrary),
          findsOneWidget,
        );
        expect(
          find.widgetWithIcon(ListTile, IconlyBold.delete),
          findsNothing,
        );
        expect(
          find.widgetWithText(ListTile, l10nJa.deleteImage),
          findsNothing,
        );
        expect(
          find.text(l10nJa.cancel),
          findsOneWidget,
        );
      });

      group(l10nJa.takePhoto, () {
        testWidgets(
          'ImagePicker#pickImage で画像を選択した場合は, PageNavigator#pop が呼ばれること',
          (tester) async {
            var onChangedCallCount = 0;
            when(mockImagePicker.pickImage(source: ImageSource.camera))
                .thenAnswer((_) async => mockXFile);
            await pumpWidget(
              tester: tester,
              visibleDelete: faker.randomGenerator.boolean(),
              onChanged: (image) {
                expect(image, mockXFile);
                onChangedCallCount++;
              },
            );
            expect(onChangedCallCount, 0);
            await tester.tap(find.text(l10nJa.takePhoto));
            expect(onChangedCallCount, 1);
            verifyInOrder([
              mockLoadingDialog.show(),
              mockImagePicker.pickImage(source: ImageSource.camera),
              mockPageNavigator.pop(any),
              mockLoadingDialog.hide(),
            ]);
          },
        );

        testWidgets(
          'ImagePicker#pickImage で画像を選択しなかった場合は, PageNavigator#pop が呼ばれないこと',
          (tester) async {
            when(mockImagePicker.pickImage(source: ImageSource.camera))
                .thenAnswer((_) async => null);
            await pumpWidget(
              tester: tester,
              visibleDelete: faker.randomGenerator.boolean(),
              onChanged: (_) => fail('unexpected onChanged'),
            );
            await tester.tap(find.text(l10nJa.takePhoto));
            verifyInOrder([
              mockLoadingDialog.show(),
              mockImagePicker.pickImage(source: ImageSource.camera),
              mockLoadingDialog.hide(),
            ]);
            verifyZeroInteractions(mockPageNavigator);
          },
        );
      });

      group(l10nJa.selectFromLibrary, () {
        testWidgets(
          'ImagePicker#pickImage で画像を選択した場合は, PageNavigator#pop が呼ばれること',
          (tester) async {
            var onChangedCallCount = 0;
            when(mockImagePicker.pickImage(source: ImageSource.gallery))
                .thenAnswer((_) async => mockXFile);
            await pumpWidget(
              tester: tester,
              visibleDelete: faker.randomGenerator.boolean(),
              onChanged: (image) {
                expect(image, mockXFile);
                onChangedCallCount++;
              },
            );
            expect(onChangedCallCount, 0);
            await tester.tap(find.text(l10nJa.selectFromLibrary));
            expect(onChangedCallCount, 1);
            verifyInOrder([
              mockLoadingDialog.show(),
              mockImagePicker.pickImage(source: ImageSource.gallery),
              mockPageNavigator.pop(any),
              mockLoadingDialog.hide(),
            ]);
          },
        );

        testWidgets(
          'ImagePicker#pickImage で画像を選択しなかった場合は, PageNavigator#pop が呼ばれないこと',
          (tester) async {
            when(mockImagePicker.pickImage(source: ImageSource.gallery))
                .thenAnswer((_) async => null);
            await pumpWidget(
              tester: tester,
              visibleDelete: faker.randomGenerator.boolean(),
              onChanged: (_) => fail('unexpected onChanged'),
            );
            await tester.tap(find.text(l10nJa.selectFromLibrary));
            verifyInOrder([
              mockLoadingDialog.show(),
              mockImagePicker.pickImage(source: ImageSource.gallery),
              mockLoadingDialog.hide(),
            ]);
            verifyZeroInteractions(mockPageNavigator);
          },
        );
      });

      group(l10nJa.deleteImage, () {
        testWidgets(
          'タップしたら onChanged に null が渡され、PageNavigator#pop が呼ばれること',
          (tester) async {
            var onChangedCallCount = 0;
            await pumpWidget(
              tester: tester,
              visibleDelete: true,
              onChanged: (image) {
                expect(image, null);
                onChangedCallCount++;
              },
            );
            expect(onChangedCallCount, 0);
            await tester.tap(find.text(l10nJa.deleteImage));
            expect(onChangedCallCount, 1);
            verify(mockPageNavigator.pop(any));
          },
        );
      });

      testWidgets(
        'メニュー上の「${l10nJa.cancel}」をタップしたら、PageNavigator#pop が呼ばれること',
        (tester) async {
          await pumpWidget(
            tester: tester,
            visibleDelete: faker.randomGenerator.boolean(),
            onChanged: (_) => fail('unexpected onChanged'),
          );
          await tester.tap(find.text(l10nJa.cancel));
          verify(mockPageNavigator.pop(any));
        },
      );
    });
  });
}

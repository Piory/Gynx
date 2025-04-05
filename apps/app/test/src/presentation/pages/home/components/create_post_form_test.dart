import 'package:app/src/domain/usecases/suite_user_usecase.dart';
import 'package:app/src/presentation/components/elements/avatars/gynx_id.dart';
import 'package:app/src/presentation/components/elements/buttons/gradient_outlined_button.dart';
import 'package:app/src/presentation/components/elements/medias/media_list.dart';
import 'package:app/src/presentation/dialogs/loading_dialog.dart';
import 'package:app/src/presentation/navigation/page_navigator.dart';
import 'package:app/src/presentation/pages/home/components/create_post_form.dart';
import 'package:app/src/presentation/pages/home/home_controller.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locales/locales.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../data/dummy_data_generator.dart';
import 'create_post_form_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LoadingDialog>(),
  MockSpec<PageNavigator>(),
  MockSpec<XFile>(),
  MockSpec<ImagePicker>(),
  MockSpec<HomeController>(),
  MockSpec<SuiteUserUseCase>(),
])
void main() {
  final l10nJa = L10nJa();
  final suiteUser = generateDummySuiteUser();
  final mockLoadingDialog = MockLoadingDialog();
  final mockPageNavigator = MockPageNavigator();
  final mockImagePicker = MockImagePicker();
  final mockHomeController = MockHomeController();
  final mockSuiteUserUseCase = MockSuiteUserUseCase();

  final postText = faker.lorem.sentence();

  setUpAll(() {
    GetIt.I.registerSingleton<LoadingDialog>(mockLoadingDialog);
    GetIt.I.registerSingleton<PageNavigator>(mockPageNavigator);
    GetIt.I.registerSingleton<ImagePicker>(mockImagePicker);
    GetIt.I.registerSingleton<HomeController>(mockHomeController);
    GetIt.I.registerSingleton<SuiteUserUseCase>(mockSuiteUserUseCase);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockLoadingDialog);
    verifyNoMoreInteractions(mockPageNavigator);
    verifyNoMoreInteractions(mockImagePicker);
    verifyNoMoreInteractions(mockHomeController);
    verifyNoMoreInteractions(mockSuiteUserUseCase);
    reset(mockLoadingDialog);
    reset(mockPageNavigator);
    reset(mockImagePicker);
    reset(mockHomeController);
    reset(mockSuiteUserUseCase);
  });

  group('CreatePostForm', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
    }) async {
      when(mockSuiteUserUseCase.execute()).thenAnswer((_) async => suiteUser);
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            locale: Locale('ja'),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: Scaffold(
              body: CreatePostForm(),
            ),
          ),
        ),
      );
      verify(mockSuiteUserUseCase.execute());
      await tester.pumpAndSettle();
    }

    group('正常系', () {
      testWidgets('ユーザー名と Gynx ID が表示されること', (tester) async {
        await pumpWidget(
          tester: tester,
        );

        expect(find.text(suiteUser.vUserDetail.username), findsOneWidget);
        expect(find.byType(GynxId), findsOneWidget);
        final gynxId = tester.widget<GynxId>(find.byType(GynxId));
        expect(gynxId.id, suiteUser.vUserDetail.gynxId);
        expect(find.text(l10nJa.postRequiredError), findsNothing);
      });

      testWidgets('投稿文のみ入力して「${l10nJa.post}」ボタンをタップした場合、HomeController#creatPost が呼ばれること', (tester) async {
        when(
          mockHomeController.createPost(
            postMapNotifier: anyNamed('postMapNotifier'),
            suiteUserNotifier: anyNamed('suiteUserNotifier'),
            timelineNotifier: anyNamed('timelineNotifier'),
            text: postText,
            mediaPaths: [],
          ),
        ).thenAnswer((_) async {});
        await pumpWidget(
          tester: tester,
        );

        await tester.enterText(find.byType(FormBuilderTextField), postText);

        verifyNever(
          mockHomeController.createPost(
            postMapNotifier: anyNamed('postMapNotifier'),
            suiteUserNotifier: anyNamed('suiteUserNotifier'),
            timelineNotifier: anyNamed('timelineNotifier'),
            text: postText,
            mediaPaths: [],
          ),
        );
        await tester.tap(
          find.widgetWithText(GradientOutlinedButton, l10nJa.post),
        );
        expect(find.text(l10nJa.postRequiredError), findsNothing);
        verifyInOrder([
          mockLoadingDialog.show(),
          mockHomeController.createPost(
            postMapNotifier: anyNamed('postMapNotifier'),
            suiteUserNotifier: anyNamed('suiteUserNotifier'),
            timelineNotifier: anyNamed('timelineNotifier'),
            text: postText,
            mediaPaths: [],
          ),
          mockPageNavigator.pop(any),
          mockLoadingDialog.hide(),
        ]);
      });

      testWidgets('画像を選択した場合は、MediaList が表示され、「${l10nJa.post}」ボタンをタップした場合は、HomeController#createPost が呼ばれること', (tester) async {
        final path = faker.image.loremPicsum();
        final mockXFile = MockXFile();
        when(mockXFile.path).thenReturn(path);
        when(
          mockImagePicker.pickImage(source: ImageSource.camera),
        ).thenAnswer((_) async => mockXFile);
        when(
          mockHomeController.createPost(
            postMapNotifier: anyNamed('postMapNotifier'),
            suiteUserNotifier: anyNamed('suiteUserNotifier'),
            timelineNotifier: anyNamed('timelineNotifier'),
            text: postText,
            mediaPaths: [path],
          ),
        ).thenAnswer((_) async {});
        await pumpWidget(
          tester: tester,
        );

        await tester.enterText(find.byType(FormBuilderTextField), postText);
        expect(find.byType(MediaList), findsNothing);
        await tester.tap(find.byIcon(IconlyLight.camera));
        await tester.pumpAndSettle();
        verifyInOrder([
          mockLoadingDialog.show(),
          mockImagePicker.pickImage(source: ImageSource.camera),
          mockLoadingDialog.hide(),
        ]);
        expect(find.byType(MediaList), findsOneWidget);

        verifyNever(
          mockHomeController.createPost(
            postMapNotifier: anyNamed('postMapNotifier'),
            suiteUserNotifier: anyNamed('suiteUserNotifier'),
            timelineNotifier: anyNamed('timelineNotifier'),
            text: postText,
            mediaPaths: [],
          ),
        );
        await tester.tap(
          find.widgetWithText(GradientOutlinedButton, l10nJa.post),
        );
        expect(find.text(l10nJa.postRequiredError), findsNothing);
        verifyInOrder([
          mockLoadingDialog.show(),
          mockHomeController.createPost(
            postMapNotifier: anyNamed('postMapNotifier'),
            suiteUserNotifier: anyNamed('suiteUserNotifier'),
            timelineNotifier: anyNamed('timelineNotifier'),
            text: postText,
            mediaPaths: [path],
          ),
          mockPageNavigator.pop(any),
          mockLoadingDialog.hide(),
        ]);
      });
    });

    group('準正常系', () {
      testWidgets('投稿文が未入力の場合、「${l10nJa.postRequiredError}」が表示されること', (tester) async {
        await pumpWidget(
          tester: tester,
        );

        await tester.tap(
          find.widgetWithText(GradientOutlinedButton, l10nJa.post),
        );
        expect(find.text(l10nJa.postRequiredError), findsNothing);
        await tester.pumpAndSettle();
        expect(find.text(l10nJa.postRequiredError), findsOneWidget);
        verifyInOrder([
          mockLoadingDialog.show(),
          mockLoadingDialog.hide(),
        ]);
      });
    });
  });
}

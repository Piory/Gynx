import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/usecases/suite_user_usecase.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post_list.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/navigation/page_type.dart';
import 'package:gynx_app/src/presentation/pages/profile/profile_controller.dart';
import 'package:gynx_app/src/presentation/pages/profile/profile_page.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:iconly/iconly.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../data/dummy_data_generator.dart';
import 'profile_page_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ProfileController>(),
  MockSpec<SuiteUserUseCase>(),
  MockSpec<PageNavigator>(),
])
void main() {
  final l10nJa = L10nJa();
  final suiteUser = generateDummySuiteUser();
  final mockProfileController = MockProfileController();
  final mockSuiteUserUseCase = MockSuiteUserUseCase();
  final mockPageNavigator = MockPageNavigator();

  setUpAll(() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    GetIt.I.registerSingleton<ProfileController>(mockProfileController);
    GetIt.I.registerSingleton<SuiteUserUseCase>(mockSuiteUserUseCase);
    GetIt.I.registerSingleton<PageNavigator>(mockPageNavigator);
  });

  tearDown(() {
    reset(mockProfileController);
    reset(mockSuiteUserUseCase);
    reset(mockPageNavigator);
  });

  Future<void> pumpWidget(WidgetTester tester) async {
    when(mockSuiteUserUseCase.execute()).thenAnswer((_) async => suiteUser);
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          locale: Locale('ja'),
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          home: ProfilePage(),
        ),
      ),
    );
    verify(mockSuiteUserUseCase.execute());
  }

  group('正常系', () {
    testWidgets(
      'IconlyBold.setting をタップしたら、PageNavigator#push が呼ばれること',
      (tester) async {
        await pumpWidget(tester);
        verifyNever(mockPageNavigator.push(any, PageType.setting));
        await tester.tap(find.byIcon(IconlyBold.setting));
        verify(mockPageNavigator.push(any, PageType.setting));
      },
    );

    testWidgets(
      '初期表示では、「${l10nJa.posts}」タブが表示されて、タブ内に PostList が表示されていること',
      (tester) async {
        await pumpWidget(tester);
        await tester.pump();
        final postListFinder = find.byKey(const Key('posts'));
        expect(postListFinder, findsOneWidget);
        final favoriteListFinder = find.byKey(const Key('favorites'));
        expect(favoriteListFinder, findsNothing);
        expect(
          find.descendant(of: postListFinder, matching: find.byType(PostList)),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '「${l10nJa.favorites}」タブをタップしたら、タブ内に PostList が表示されていること',
      (tester) async {
        await pumpWidget(tester);
        await tester.pump();
        await tester.tap(find.text(l10nJa.favorites));
        await tester.pumpAndSettle();
        final postListFinder = find.byKey(const Key('posts'));
        expect(postListFinder, findsNothing);
        final favoriteListFinder = find.byKey(const Key('favorites'));
        expect(favoriteListFinder, findsOneWidget);
        expect(
          find.descendant(
              of: favoriteListFinder, matching: find.byType(PostList)),
          findsOneWidget,
        );
      },
    );
  });
}

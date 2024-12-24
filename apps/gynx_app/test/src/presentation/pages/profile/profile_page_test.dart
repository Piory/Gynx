import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/usecases/suite_user_usecase.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/pages/profile/components/user_profile.dart';
import 'package:gynx_app/src/presentation/pages/profile/profile_controller.dart';
import 'package:gynx_app/src/presentation/pages/profile/profile_page.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
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
    await tester.pumpAndSettle();
  }

  //
  group('初期表示時', () {
    group('正常系', () {
      testWidgets('ユーザー名、GynxID、自己紹介が表示されること', (tester) async {
        await pumpWidget(tester);
        final userProfileFinder = find.byType(UserProfile);
        expect(userProfileFinder, findsOneWidget);
        final userProfileWidget = tester.widget<UserProfile>(userProfileFinder);
        expect(userProfileWidget.suiteUser, suiteUser);
      });
    });
  });
}

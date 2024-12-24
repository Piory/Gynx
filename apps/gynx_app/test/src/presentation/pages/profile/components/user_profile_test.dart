import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/pages/profile/components/user_profile.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../data/dummy_data_generator.dart';
import 'user_profile_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<PageNavigator>(),
])
void main() {
  final suiteUser = generateDummySuiteUser();
  final tUser = suiteUser.tUser;
  final tUserProfile = suiteUser.tUserProfile;
  final mockPageNavigator = MockPageNavigator();

  setUpAll(() {
    GetIt.I.registerSingleton<PageNavigator>(mockPageNavigator);
  });

  tearDown(() {
    reset(mockPageNavigator);
  });

  Future<void> pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          locale: const Locale('ja'),
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          home: UserProfile(suiteUser: suiteUser),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  //
  group('初期表示時', () {
    group('正常系', () {
      testWidgets('ユーザー名、GynxID、自己紹介が表示されること', (tester) async {
        await pumpWidget(tester);
        expect(find.text(tUserProfile.username), findsOneWidget);
        expect(find.text('@${tUser.gynxId}'), findsOneWidget);
        expect(find.text(tUserProfile.selfIntroduction), findsOneWidget);
      });
    });
  });
}

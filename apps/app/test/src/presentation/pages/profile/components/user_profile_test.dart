// ignore_for_file: lines_longer_than_80_chars
import 'package:app/src/domain/models/suite_user.dart';
import 'package:app/src/domain/usecases/suite_user_usecase.dart';
import 'package:app/src/presentation/components/elements/avatars/gynx_id.dart';
import 'package:app/src/presentation/pages/profile/components/follow_count.dart';
import 'package:app/src/presentation/pages/profile/components/follower_count.dart';
import 'package:app/src/presentation/pages/profile/components/self_introduction.dart';
import 'package:app/src/presentation/pages/profile/components/user_profile.dart';
import 'package:app/src/presentation/pages/profile/components/username.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../data/dummy_data_generator.dart';
import 'user_profile_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SuiteUserUseCase>(),
])
void main() {
  final mockSuiteUserUseCase = MockSuiteUserUseCase();

  setUpAll(() {
    GetIt.I.registerSingleton<SuiteUserUseCase>(mockSuiteUserUseCase);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockSuiteUserUseCase);
    reset(mockSuiteUserUseCase);
  });

  group('UserProfile', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      required SuiteUser suiteUser,
    }) async {
      when(mockSuiteUserUseCase.execute()).thenAnswer((_) async => suiteUser);
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            locale: Locale('ja'),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: Scaffold(
              body: UserProfile(),
            ),
          ),
        ),
      );
      verify(mockSuiteUserUseCase.execute());
      await tester.pump();
    }

    group('正常系', () {
      testWidgets('ユーザー名、GynxID、自己紹介、フォロー数、フォロワー数が表示されること', (tester) async {
        final suiteUser = generateDummySuiteUser();
        final tUser = suiteUser.vUserDetail;
        final tUserProfile = suiteUser.vUserDetail;
        await pumpWidget(
          tester: tester,
          suiteUser: suiteUser,
        );
        expect(find.text(tUserProfile.username), findsOneWidget);
        expect(find.byType(GynxId), findsOneWidget);
        final gynxId = tester.widget<GynxId>(find.byType(GynxId));
        expect(gynxId.id, tUser.gynxId);
        expect(find.byType(Username), findsOneWidget);
        expect(find.byType(SelfIntroduction), findsOneWidget);
        expect(find.byType(FollowCount), findsOneWidget);
        expect(find.byType(FollowerCount), findsOneWidget);
      });
    });
  });
}

// ignore_for_file: lines_longer_than_80_chars
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/models/suite_user.dart';
import 'package:gynx_app/src/presentation/components/elements/avatars/gynx_id.dart';
import 'package:gynx_app/src/presentation/components/elements/avatars/user_avatar.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/navigation/page_type.dart';
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
  final l10nJa = L10nJa();
  final mockPageNavigator = MockPageNavigator();

  setUpAll(() {
    GetIt.I.registerSingleton<PageNavigator>(mockPageNavigator);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockPageNavigator);
    reset(mockPageNavigator);
  });

  group('UserProfile', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      required SuiteUser suiteUser,
    }) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            locale: const Locale('ja'),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: Scaffold(
              body: UserProfile(suiteUser: suiteUser),
            ),
          ),
        ),
      );
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
        expect(find.text(tUserProfile.selfIntroduction), findsOneWidget);
        final followCount = suiteUser.vUserDetail.followCount;
        expect(find.text(l10nJa.follow(followCount)), findsOneWidget);
        final followerCount = suiteUser.vUserDetail.followerCount;
        expect(find.text(l10nJa.follower(followerCount)), findsOneWidget);
      });

      testWidgets(
        'UserAvatar をタップすると、PageNavigator#push に PageType.profileAvatar が渡されていること',
        (tester) async {
          final suiteUser = generateDummySuiteUser();
          await pumpWidget(
            tester: tester,
            suiteUser: suiteUser.copyWith(
              vUserDetail: suiteUser.vUserDetail.copyWith(
                avatarUrl: faker.image.loremPicsum(),
              ),
            ),
          );
          verifyNever(mockPageNavigator.push(any, PageType.profileAvatar));
          await tester.tap(find.byType(UserAvatar));
          verify(mockPageNavigator.push(any, PageType.profileAvatar));
        },
      );

      testWidgets(
        'avatarUrl が設定されていない場合は、UserAvatar をタップしても、PageNavigator#push は呼ばれないこと',
        (tester) async {
          final suiteUser = generateDummySuiteUser();
          await pumpWidget(
            tester: tester,
            suiteUser: suiteUser.copyWith(
              vUserDetail: suiteUser.vUserDetail.copyWith(
                avatarUrl: null,
              ),
            ),
          );
          await tester.tap(find.byType(UserAvatar));
          verifyZeroInteractions(mockPageNavigator);
        },
      );

      testWidgets(
        '「${l10nJa.edit}」をタップすると、PageNavigator#push に PageType.editProfile が渡されていること',
        (tester) async {
          final suiteUser = generateDummySuiteUser();
          await pumpWidget(
            tester: tester,
            suiteUser: suiteUser,
          );
          verifyNever(mockPageNavigator.push(any, PageType.editProfile));
          await tester.tap(find.text(l10nJa.edit));
          verify(mockPageNavigator.push(any, PageType.editProfile));
        },
      );
    });
  });

  group('UserProfile.loading', () {
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
              body: UserProfile.loading(),
            ),
          ),
        ),
      );
    }

    group('正常系', () {
      testWidgets(
        'UserAvatar をタップしても、PageNavigator#push は呼ばれないこと',
        (tester) async {
          await pumpWidget(
            tester: tester,
          );
          await tester.tap(find.byType(UserAvatar));
          verifyZeroInteractions(mockPageNavigator);
        },
      );

      testWidgets(
        '「${l10nJa.edit}」をタップしても、PageNavigator#push は呼ばれないこと',
        (tester) async {
          await pumpWidget(
            tester: tester,
          );
          await tester.tap(find.text(l10nJa.edit));
          verifyZeroInteractions(mockPageNavigator);
        },
      );

      testWidgets(
        '「${l10nJa.share}」をタップしても、PageNavigator#push は呼ばれないこと',
        (tester) async {
          await pumpWidget(
            tester: tester,
          );
          await tester.tap(find.text(l10nJa.share));
          verifyZeroInteractions(mockPageNavigator);
        },
      );
    });
  });
}

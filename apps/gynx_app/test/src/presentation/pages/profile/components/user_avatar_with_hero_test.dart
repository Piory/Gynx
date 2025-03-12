// ignore_for_file: lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/models/suite_user.dart';
import 'package:gynx_app/src/domain/usecases/find_user_detail_usecase.dart';
import 'package:gynx_app/src/domain/usecases/find_user_usecase.dart';
import 'package:gynx_app/src/domain/usecases/suite_user_usecase.dart';
import 'package:gynx_app/src/presentation/components/elements/avatars/user_avatar.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/navigation/page_type.dart';
import 'package:gynx_app/src/presentation/pages/profile/components/user_avatar_with_hero.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../data/dummy_data_generator.dart';
import 'user_avatar_with_hero_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<PageNavigator>(),
  MockSpec<SuiteUserUseCase>(),
  MockSpec<FindUserUseCase>(),
  MockSpec<FindUserDetailUseCase>(),
])
void main() {
  final suiteUser = generateDummySuiteUser();
  final vUser = generateDummyVUser();
  final mockPageNavigator = MockPageNavigator();
  final mockSuiteUserUseCase = MockSuiteUserUseCase();
  final mockFindUserUseCase = MockFindUserUseCase();
  final mockFindUserDetailUseCase = MockFindUserDetailUseCase();

  setUpAll(() {
    GetIt.I.registerSingleton<PageNavigator>(mockPageNavigator);
    GetIt.I.registerSingleton<SuiteUserUseCase>(mockSuiteUserUseCase);
    GetIt.I.registerSingleton<FindUserUseCase>(mockFindUserUseCase);
    GetIt.I.registerSingleton<FindUserDetailUseCase>(mockFindUserDetailUseCase);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockPageNavigator);
    verifyNoMoreInteractions(mockSuiteUserUseCase);
    verifyNoMoreInteractions(mockFindUserUseCase);
    verifyNoMoreInteractions(mockFindUserDetailUseCase);
    reset(mockPageNavigator);
    reset(mockSuiteUserUseCase);
    reset(mockFindUserUseCase);
    reset(mockFindUserDetailUseCase);
  });

  group('UserAvatarWithHero', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      required SuiteUser suiteUser,
    }) async {
      when(mockSuiteUserUseCase.execute()).thenAnswer((_) async => suiteUser);
      when(mockFindUserUseCase.execute(suiteUser.vUserDetail.userId))
          .thenAnswer((_) async => vUser);
      when(mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId))
          .thenAnswer((_) async => suiteUser.vUserDetail);
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            locale: Locale('ja'),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: Scaffold(
              body: UserAvatarWithHero(),
            ),
          ),
        ),
      );
    }

    group('正常系', () {
      testWidgets(
          'avatarUrl が取得されるまでは、UserAvatar の isLoading に true が指定され、タップしても PageNavigator#push が呼ばれないこと',
          (tester) async {
        await pumpWidget(
          tester: tester,
          suiteUser: suiteUser,
        );
        verifyInOrder([
          mockSuiteUserUseCase.execute(),
          mockFindUserUseCase.execute(suiteUser.vUserDetail.userId),
          mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId),
        ]);
        final userAvatar = tester.widget<UserAvatar>(find.byType(UserAvatar));
        expect(userAvatar.isLoading, isTrue);
        expect(find.byType(Hero), findsNothing);
        await tester.tap(find.byType(InkWell));
        verifyZeroInteractions(mockPageNavigator);
      });

      testWidgets(
        'avatarUrl が取得された場合は、UserAvatar の isLoading に false が指定され、タップしたら PageNavigator#push が呼ばれること',
        (tester) async {
          await pumpWidget(
            tester: tester,
            suiteUser: suiteUser.copyWith(
              vUserDetail: suiteUser.vUserDetail.copyWith(
                avatarUrl: null,
              ),
            ),
          );
          verifyInOrder([
            mockSuiteUserUseCase.execute(),
            mockFindUserUseCase.execute(suiteUser.vUserDetail.userId),
            mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId),
          ]);
          final userAvatar = tester.widget<UserAvatar>(find.byType(UserAvatar));
          expect(userAvatar.isLoading, isTrue);
          expect(find.byType(Hero), findsNothing);
          await tester.pumpAndSettle();
          final userAvatarAfterPump =
              tester.widget<UserAvatar>(find.byType(UserAvatar));
          expect(userAvatarAfterPump.isLoading, isFalse);
          expect(find.byType(Hero), findsOneWidget);
          verifyNever(mockPageNavigator.push(any, PageType.profileAvatar));
          await tester.tap(find.byType(InkWell));
          verify(mockPageNavigator.push(any, PageType.profileAvatar));
        },
      );
    });
  });
}

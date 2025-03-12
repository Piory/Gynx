// ignore_for_file: lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/models/suite_user.dart';
import 'package:gynx_app/src/domain/usecases/find_user_detail_usecase.dart';
import 'package:gynx_app/src/domain/usecases/find_user_usecase.dart';
import 'package:gynx_app/src/domain/usecases/suite_user_usecase.dart';
import 'package:gynx_app/src/presentation/components/elements/shimmers/shimmer.dart';
import 'package:gynx_app/src/presentation/pages/profile/components/follow_count.dart';
import 'package:gynx_app/src/presentation/pages/profile/components/username.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../data/dummy_data_generator.dart';
import 'username_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SuiteUserUseCase>(),
  MockSpec<FindUserUseCase>(),
  MockSpec<FindUserDetailUseCase>(),
])
void main() {
  final suiteUser = generateDummySuiteUser();
  final vUser = generateDummyVUser();
  final mockSuiteUserUseCase = MockSuiteUserUseCase();
  final mockFindUserUseCase = MockFindUserUseCase();
  final mockFindUserDetailUseCase = MockFindUserDetailUseCase();

  setUpAll(() {
    GetIt.I.registerSingleton<SuiteUserUseCase>(mockSuiteUserUseCase);
    GetIt.I.registerSingleton<FindUserUseCase>(mockFindUserUseCase);
    GetIt.I.registerSingleton<FindUserDetailUseCase>(mockFindUserDetailUseCase);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockSuiteUserUseCase);
    verifyNoMoreInteractions(mockFindUserUseCase);
    verifyNoMoreInteractions(mockFindUserDetailUseCase);
    reset(mockSuiteUserUseCase);
    reset(mockFindUserUseCase);
    reset(mockFindUserDetailUseCase);
  });

  group('Username', () {
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
              body: Username(),
            ),
          ),
        ),
      );
    }

    group('正常系', () {
      testWidgets('ユーザー名が取得されるまでは、Shimmer が表示されていること', (tester) async {
        await pumpWidget(
          tester: tester,
          suiteUser: suiteUser,
        );
        verifyInOrder([
          mockSuiteUserUseCase.execute(),
          mockFindUserUseCase.execute(suiteUser.vUserDetail.userId),
          mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId),
        ]);
        expect(find.byType(Shimmer), findsOneWidget);
        expect(find.byType(Text), findsNothing);
      });

      testWidgets('ユーザー名が表示されていること', (tester) async {
        await pumpWidget(
          tester: tester,
          suiteUser: suiteUser,
        );
        verifyInOrder([
          mockSuiteUserUseCase.execute(),
          mockFindUserUseCase.execute(suiteUser.vUserDetail.userId),
          mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId),
        ]);
        expect(find.byType(Shimmer), findsOneWidget);
        expect(find.byType(Text), findsNothing);
        await tester.pumpAndSettle();
        expect(find.byType(Shimmer), findsNothing);
        expect(find.text(suiteUser.vUserDetail.username), findsOneWidget);
      });
    });
  });
}

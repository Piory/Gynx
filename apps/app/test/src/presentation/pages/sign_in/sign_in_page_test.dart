// ignore_for_file: lines_longer_than_80_chars
import 'package:app/src/presentation/navigation/page_navigator.dart';
import 'package:app/src/presentation/pages/sign_in/components/google_oauth_button.dart';
import 'package:app/src/presentation/pages/sign_in/sign_in_controller.dart';
import 'package:app/src/presentation/pages/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:locales/locales.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_page_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SignInController>(),
  // MockSpec<SupabaseClient>(),
  // MockSpec<GoTrueClient>(),
  // MockSpec<AuthState>(),
  // MockSpec<Session>(),
  MockSpec<PageNavigator>(),
])
void main() {
  final l10nJa = L10nJa();
  // final mockSupabaseClient = MockSupabaseClient();
  // final mockGoTrueClient = MockGoTrueClient();
  final mockSignInController = MockSignInController();
  final mockPageNavigator = MockPageNavigator();

  setUpAll(() {
    GetIt.I.registerSingleton<SignInController>(mockSignInController);
    // GetIt.I.registerSingleton<SupabaseClient>(mockSupabaseClient);
    GetIt.I.registerSingleton<PageNavigator>(mockPageNavigator);
  });

  setUp(() {
    //   when(mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
  });

  tearDown(() {
    // verify(mockSupabaseClient.auth);
    // verify(mockGoTrueClient.onAuthStateChange);
    // verifyNoMoreInteractions(mockSupabaseClient);
    // verifyNoMoreInteractions(mockGoTrueClient);
    // reset(mockSupabaseClient);
    // reset(mockGoTrueClient);
    verifyNoMoreInteractions(mockSignInController);
    verifyNoMoreInteractions(mockPageNavigator);
    reset(mockSignInController);
    reset(mockPageNavigator);
  });

  Future<void> pumpWidget(WidgetTester tester) {
    return tester.pumpWidget(
      const MaterialApp(
        locale: Locale('ja'),
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        home: SignInPage(),
      ),
    );
  }

  group('「${l10nJa.continueAsGuest}」をタップ', () {
    group('正常系', () {
      testWidgets(
        'SignInController#signInWithAnonymous が呼ばれること',
        (tester) async {
          await pumpWidget(tester);
          verifyNever(mockSignInController.signInWithAnonymous(any));
          await tester.tap(
            find.widgetWithText(OutlinedButton, l10nJa.continueAsGuest),
          );
          verify(mockSignInController.signInWithAnonymous(any));
        },
      );
    });
  });

  group('「${l10nJa.continueWithGoogle}」をタップ', () {
    group('正常系', () {
      testWidgets(
        'GoogleOAuthButton ボタンをタップすると SignInController#signInWithGoogle が呼ばれること',
        (tester) async {
          await pumpWidget(tester);
          verifyNever(mockSignInController.signInWithGoogle(any));
          await tester.tap(find.byType(GoogleOAuthButton));
          verify(mockSignInController.signInWithGoogle(any));
        },
      );
    });
  });

  // group('リダイレクト', () {
  //   group('正常系', () {
  //     testWidgets(
  //       'data.session に値が存在しない（未ログイン状態）場合、PageRouter#pushReplacement が呼ばれないこと',
  //       (tester) async {
  //         final mockAuthState = MockAuthState();
  //         when(mockGoTrueClient.onAuthStateChange).thenAnswer((_) {
  //           return Stream.value(mockAuthState);
  //         });
  //         when(mockAuthState.session).thenReturn(null);
  //         await pumpWidget(tester);
  //         verify(mockAuthState.session);
  //         verifyNoMoreInteractions(mockAuthState);
  //       },
  //     );
  //
  //     testWidgets(
  //       'data.session に値が存在する（ログイン状態）場合、PageRouter#pushReplacement が呼ばれること',
  //       (tester) async {
  //         final mockAuthState = MockAuthState();
  //         final mockSession = MockSession();
  //         when(mockGoTrueClient.onAuthStateChange).thenAnswer((_) {
  //           return Stream.value(mockAuthState);
  //         });
  //         when(mockAuthState.session).thenReturn(mockSession);
  //         await pumpWidget(tester);
  //         verifyInOrder([
  //           mockAuthState.session,
  //           mockPageNavigator.pushReplacement(any, PageType.home),
  //         ]);
  //         verifyNoMoreInteractions(mockAuthState);
  //       },
  //     );
  //   });
  // });
}

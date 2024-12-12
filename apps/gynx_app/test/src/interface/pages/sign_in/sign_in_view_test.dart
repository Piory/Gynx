// ignore_for_file: lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/interface/pages/sign_in/components/google_oauth_button.dart';
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_controller.dart';
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_view.dart';
import 'package:gynx_app/src/interface/router/page_router.dart';
import 'package:gynx_app/src/interface/router/page_type.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'sign_in_view_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SignInController>(),
  MockSpec<SupabaseClient>(),
  MockSpec<GoTrueClient>(),
  MockSpec<AuthState>(),
  MockSpec<Session>(),
  MockSpec<PageRouter>(),
])
void main() {
  final l10nJa = L10nJa();
  final mockSupabaseClient = MockSupabaseClient();
  final mockGoTrueClient = MockGoTrueClient();
  final mockSignInController = MockSignInController();
  final mockPageRouter = MockPageRouter();

  setUpAll(() {
    GetIt.I.registerSingleton<SignInController>(mockSignInController);
    GetIt.I.registerSingleton<SupabaseClient>(mockSupabaseClient);
    GetIt.I.registerSingleton<PageRouter>(mockPageRouter);
  });

  setUp(() {
    when(mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
  });

  tearDown(() {
    verify(mockSupabaseClient.auth);
    verify(mockGoTrueClient.onAuthStateChange);
    verifyNoMoreInteractions(mockSupabaseClient);
    verifyNoMoreInteractions(mockGoTrueClient);
    reset(mockSupabaseClient);
    reset(mockGoTrueClient);
    reset(mockSignInController);
    reset(mockPageRouter);
  });

  Future<void> pumpWidget(WidgetTester tester) {
    return tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        home: SignInView(),
      ),
    );
  }

  group('正常系', () {
    testWidgets(
      '「${l10nJa.continueAsGuest}」をタップすると SignInController#signInWithAnonymous が呼ばれること',
      (tester) async {
        await pumpWidget(tester);
        verifyNever(mockSignInController.signInWithAnonymous());
        await tester.tap(find.byType(OutlinedButton));
        verify(mockSignInController.signInWithAnonymous());
      },
    );

    testWidgets(
      'GoogleOAuthButton ボタンをタップすると SignInController#signInWithGoogle が呼ばれること',
      (tester) async {
        await pumpWidget(tester);
        verifyNever(mockSignInController.signInWithGoogle());
        await tester.tap(find.byType(GoogleOAuthButton));
        verify(mockSignInController.signInWithGoogle());
      },
    );

    testWidgets(
      'data.session に値が存在する場合、PageRouter#pushReplacement が呼ばれないこと',
      (tester) async {
        final mockAuthState = MockAuthState();
        when(mockGoTrueClient.onAuthStateChange).thenAnswer((_) {
          return Stream.value(mockAuthState);
        });
        when(mockAuthState.session).thenReturn(null);
        await pumpWidget(tester);
        verify(mockAuthState.session);
        verifyNoMoreInteractions(mockAuthState);
      },
    );

    testWidgets(
      'data.session に値が存在する場合、PageRouter#pushReplacement が呼ばれること',
      (tester) async {
        final mockAuthState = MockAuthState();
        final mockSession = MockSession();
        when(mockGoTrueClient.onAuthStateChange).thenAnswer((_) {
          return Stream.value(mockAuthState);
        });
        when(mockAuthState.session).thenReturn(mockSession);
        await pumpWidget(tester);
        verifyInOrder([
          mockAuthState.session,
          mockPageRouter.pushReplacement(any, PageType.home),
        ]);
        verifyNoMoreInteractions(mockAuthState);
      },
    );
  });
}

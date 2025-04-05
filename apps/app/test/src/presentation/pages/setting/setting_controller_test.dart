// ignore_for_file: lines_longer_than_80_chars
import 'package:app/src/domain/usecases/sign_out_usecase.dart';
import 'package:app/src/presentation/dialogs/alert.dart';
import 'package:app/src/presentation/dialogs/loading_dialog.dart';
import 'package:app/src/presentation/dialogs/notify.dart';
import 'package:app/src/presentation/pages/setting/setting_controller.dart';
import 'package:faker/faker.dart';
import 'package:locales/locales.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'setting_controller_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LoadingDialog>(),
  MockSpec<Notify>(),
  MockSpec<Alert>(),
  MockSpec<SignOutUseCase>(),
])
void main() {
  final l10nJa = L10nJa();
  final mockLoadingDialog = MockLoadingDialog();
  final mockNotify = MockNotify();
  final mockAlert = MockAlert();
  final mockSignOutUseCase = MockSignOutUseCase();
  final controller = SettingController(
    mockLoadingDialog,
    mockNotify,
    mockAlert,
    mockSignOutUseCase,
  );

  tearDown(() {
    verifyNoMoreInteractions(mockLoadingDialog);
    verifyNoMoreInteractions(mockNotify);
    verifyNoMoreInteractions(mockAlert);
    verifyNoMoreInteractions(mockSignOutUseCase);
    reset(mockLoadingDialog);
    reset(mockNotify);
    reset(mockAlert);
    reset(mockSignOutUseCase);
  });

  group('#signOut', () {
    group('正常系', () {
      test(
        'Alert#showAlert で AlertResultType.right が返ってきた場合は、SignOutUseCase#execute が呼ばれないこと',
        () async {
          when(
            mockAlert.showAlert(
              title: l10nJa.signOut,
              text: l10nJa.signOutMessage,
              leftButtonText: l10nJa.cancel,
              rightButtonText: l10nJa.signOut,
            ),
          ).thenAnswer((_) async => AlertResultType.left);
          await controller.signOut(l10nJa);
          verifyInOrder([
            mockAlert.showAlert(
              title: l10nJa.signOut,
              text: l10nJa.signOutMessage,
              leftButtonText: l10nJa.cancel,
              rightButtonText: l10nJa.signOut,
            ),
          ]);
        },
      );

      test(
        'Alert#showAlert で AlertResultType.right が返ってきた場合は、SignOutUseCase#execute が呼ばれること',
        () async {
          when(
            mockAlert.showAlert(
              title: l10nJa.signOut,
              text: l10nJa.signOutMessage,
              leftButtonText: l10nJa.cancel,
              rightButtonText: l10nJa.signOut,
            ),
          ).thenAnswer((_) async => AlertResultType.right);
          await controller.signOut(l10nJa);
          verifyInOrder([
            mockAlert.showAlert(
              title: l10nJa.signOut,
              text: l10nJa.signOutMessage,
              leftButtonText: l10nJa.cancel,
              rightButtonText: l10nJa.signOut,
            ),
            mockLoadingDialog.show(),
            mockSignOutUseCase.execute(),
            mockLoadingDialog.hide(),
          ]);
        },
      );
    });

    group('異常系', () {
      test('エラーが発生したら、LoadingDialog#hide が呼ばれること', () async {
        when(
          mockAlert.showAlert(
            title: l10nJa.signOut,
            text: l10nJa.signOutMessage,
            leftButtonText: l10nJa.cancel,
            rightButtonText: l10nJa.signOut,
          ),
        ).thenAnswer((_) async => AlertResultType.right);
        final exception = Exception(faker.guid.guid());
        when(mockSignOutUseCase.execute()).thenThrow(exception);
        await expectLater(() => controller.signOut(l10nJa), throwsA(exception));
        verifyInOrder([
          mockAlert.showAlert(
            title: l10nJa.signOut,
            text: l10nJa.signOutMessage,
            leftButtonText: l10nJa.cancel,
            rightButtonText: l10nJa.signOut,
          ),
          mockLoadingDialog.show(),
          mockSignOutUseCase.execute(),
          mockNotify.showError(message: l10nJa.signOutError),
          mockLoadingDialog.hide(),
        ]);
      });
    });
  });
}

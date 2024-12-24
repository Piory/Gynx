import 'package:faker/faker.dart';
import 'package:gynx_app/src/domain/usecases/sign_out_usecase.dart';
import 'package:gynx_app/src/presentation/dialogs/loading_dialog.dart';
import 'package:gynx_app/src/presentation/dialogs/notify.dart';
import 'package:gynx_app/src/presentation/pages/profile/profile_controller.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'profile_controller_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LoadingDialog>(),
  MockSpec<Notify>(),
  MockSpec<SignOutUseCase>(),
])
void main() {
  final l10nJa = L10nJa();
  final mockLoadingDialog = MockLoadingDialog();
  final mockNotify = MockNotify();
  final mockSignOutUseCase = MockSignOutUseCase();
  final controller = ProfileController(
    mockLoadingDialog,
    mockNotify,
    mockSignOutUseCase,
  );

  tearDown(() {
    verifyNoMoreInteractions(mockLoadingDialog);
    verifyNoMoreInteractions(mockNotify);
    verifyNoMoreInteractions(mockSignOutUseCase);
    reset(mockLoadingDialog);
    reset(mockNotify);
    reset(mockSignOutUseCase);
  });

  group('#signOut', () {
    group('正常系', () {
      test('SignOutUseCase#execute が呼ばれること', () async {
        await controller.signOut(l10nJa);
        verifyInOrder([
          mockLoadingDialog.show(),
          mockSignOutUseCase.execute(),
          mockLoadingDialog.hide(),
        ]);
      });
    });

    group('異常系', () {
      test('エラーが発生したら、LoadingDialog#hide が呼ばれること', () async {
        final exception = Exception(faker.guid.guid());
        when(mockSignOutUseCase.execute()).thenThrow(exception);
        await expectLater(() => controller.signOut(l10nJa), throwsA(exception));
        verifyInOrder([
          mockLoadingDialog.show(),
          mockSignOutUseCase.execute(),
          mockNotify.showError(message: l10nJa.signOutError),
          mockLoadingDialog.hide(),
        ]);
      });
    });
  });
}

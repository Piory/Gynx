import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gynx_app/src/domain/usecases/update_user_profile_usecase.dart';
import 'package:gynx_app/src/presentation/dialogs/loading_dialog.dart';
import 'package:gynx_app/src/presentation/dialogs/notify.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/notifiers/user_notifier.dart';
import 'package:gynx_app/src/presentation/pages/edit_profile/edit_profile_controller.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'edit_profile_controller_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<BuildContext>(),
  MockSpec<WidgetRef>(),
  MockSpec<XFile>(),
  MockSpec<PageNavigator>(),
  MockSpec<LoadingDialog>(),
  MockSpec<Notify>(),
  MockSpec<UpdateUserProfileUseCase>(),
])
void main() {
  final gynxId = faker.guid.guid();
  final username = faker.person.name();
  final isDeleteAvatar = faker.randomGenerator.boolean();
  final selfIntroduction = faker.lorem.sentence();

  final l10nJa = L10nJa();
  final mockBuildContext = MockBuildContext();
  final mockWidgetRef = MockWidgetRef();
  final mockXFile = MockXFile();
  final mockPageNavigator = MockPageNavigator();
  final mockLoadingDialog = MockLoadingDialog();
  final mockNotify = MockNotify();
  final mockUpdateUserProfileUseCase = MockUpdateUserProfileUseCase();
  final controller = EditProfileController(
    mockPageNavigator,
    mockLoadingDialog,
    mockNotify,
    mockUpdateUserProfileUseCase,
  );

  tearDown(() {
    verifyNoMoreInteractions(mockBuildContext);
    verifyNoMoreInteractions(mockWidgetRef);
    verifyNoMoreInteractions(mockXFile);
    verifyNoMoreInteractions(mockPageNavigator);
    verifyNoMoreInteractions(mockLoadingDialog);
    verifyNoMoreInteractions(mockNotify);
    verifyNoMoreInteractions(mockUpdateUserProfileUseCase);
    reset(mockBuildContext);
    reset(mockWidgetRef);
    reset(mockXFile);
    reset(mockPageNavigator);
    reset(mockLoadingDialog);
    reset(mockNotify);
    reset(mockUpdateUserProfileUseCase);
  });

  group('#updateUserProfile', () {
    group('正常系', () {
      // TODO(Piory): AvatarImage のテストは後々対応予定
      test('更新対象の値を全て指定した場合に、正常に EditUserProfileUseCase#execute が呼ばれること',
          () async {
        when(mockBuildContext.mounted).thenReturn(true);
        await controller.updateUserProfile(
          context: mockBuildContext,
          l10n: l10nJa,
          ref: mockWidgetRef,
          gynxId: gynxId,
          username: username,
          avatarFile: null,
          isDeleteAvatar: isDeleteAvatar,
          selfIntroduction: selfIntroduction,
        );
        verifyInOrder([
          mockLoadingDialog.show(),
          mockUpdateUserProfileUseCase.execute(
            gynxId: gynxId,
            username: username,
            avatarImage: null,
            isDeleteAvatar: isDeleteAvatar,
            selfIntroduction: selfIntroduction,
          ),
          mockWidgetRef.invalidate(userNotifierProvider),
          mockBuildContext.mounted,
          mockPageNavigator.pop(mockBuildContext),
          mockLoadingDialog.hide(),
        ]);
      });

      test('更新対象の値を全て null にした場合に、正常に EditUserProfileUseCase#execute が呼ばれること',
          () async {
        when(mockBuildContext.mounted).thenReturn(true);
        await controller.updateUserProfile(
          context: mockBuildContext,
          l10n: l10nJa,
          ref: mockWidgetRef,
          gynxId: null,
          username: null,
          avatarFile: null,
          isDeleteAvatar: isDeleteAvatar,
          selfIntroduction: null,
        );
        verifyInOrder([
          mockLoadingDialog.show(),
          mockUpdateUserProfileUseCase.execute(
            gynxId: null,
            username: null,
            avatarImage: null,
            isDeleteAvatar: isDeleteAvatar,
            selfIntroduction: null,
          ),
          mockWidgetRef.invalidate(userNotifierProvider),
          mockBuildContext.mounted,
          mockPageNavigator.pop(mockBuildContext),
          mockLoadingDialog.hide(),
        ]);
      });
    });

    group('異常系', () {
      test('エラーが発生したら、LoadingDialog#hide が呼ばれること', () async {
        final exception = Exception(faker.guid.guid());
        when(
          mockUpdateUserProfileUseCase.execute(
            gynxId: null,
            username: null,
            avatarImage: null,
            isDeleteAvatar: isDeleteAvatar,
            selfIntroduction: null,
          ),
        ).thenThrow(exception);
        when(mockBuildContext.mounted).thenReturn(true);
        await expectLater(
          () => controller.updateUserProfile(
            context: mockBuildContext,
            l10n: l10nJa,
            ref: mockWidgetRef,
            gynxId: null,
            username: null,
            avatarFile: null,
            isDeleteAvatar: isDeleteAvatar,
            selfIntroduction: null,
          ),
          throwsA(exception),
        );
        verifyInOrder([
          mockLoadingDialog.show(),
          mockUpdateUserProfileUseCase.execute(
            gynxId: null,
            username: null,
            avatarImage: null,
            isDeleteAvatar: isDeleteAvatar,
            selfIntroduction: null,
          ),
          mockBuildContext.mounted,
          mockNotify.showError(message: l10nJa.updateUserProfileError),
          mockLoadingDialog.hide(),
        ]);
      });
    });
  });
}

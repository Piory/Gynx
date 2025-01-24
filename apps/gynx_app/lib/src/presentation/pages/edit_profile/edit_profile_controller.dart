import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gynx_app/src/domain/usecases/update_user_profile_usecase.dart';
import 'package:gynx_app/src/presentation/dialogs/loading_dialog.dart';
import 'package:gynx_app/src/presentation/dialogs/notify.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@singleton
class EditProfileController {
  const EditProfileController(
    this._pageNavigator,
    this._loadingDialog,
    this._notify,
    this._updateUserProfileUseCase,
  );

  final PageNavigator _pageNavigator;
  final LoadingDialog _loadingDialog;
  final Notify _notify;
  final UpdateUserProfileUseCase _updateUserProfileUseCase;

  Future<void> updateUserProfile({
    required BuildContext context,
    required L10n l10n,
    required WidgetRef ref,
    required String? gynxId,
    required String? username,
    required XFile? avatarFile,
    required bool isDeleteAvatar,
    required String? selfIntroduction,
  }) async {
    try {
      _loadingDialog.show();
      await _updateUserProfileUseCase.execute(
        gynxId: gynxId,
        username: username,
        avatarImage: avatarFile == null ? null : File(avatarFile.path),
        isDeleteAvatar: isDeleteAvatar,
        selfIntroduction: selfIntroduction,
      );
      ref.invalidate(suiteUserNotifierProvider);
      if (context.mounted) {
        _pageNavigator.pop(context);
      }
    } on Exception catch (_) {
      if (context.mounted) {
        _notify.showError(message: l10n.updateUserProfileError);
      }
      rethrow;
    } finally {
      _loadingDialog.hide();
    }
  }
}

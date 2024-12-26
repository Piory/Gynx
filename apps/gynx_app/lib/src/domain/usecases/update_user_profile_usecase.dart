// ignore_for_file: one_member_abstracts

import 'dart:io';

abstract interface class UpdateUserProfileUseCase {
  Future<void> execute({
    required String? gynxId,
    required String? username,
    required File? avatarImage,
    required bool isDeleteAvatar,
    required String? selfIntroduction,
  });
}

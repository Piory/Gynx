import 'dart:async';
import 'dart:io';

import 'package:gynx_app/src/domain/entities/t_user_profile.dart';
import 'package:gynx_app/src/domain/enums/storage_type.dart';
import 'package:gynx_app/src/domain/exceptions/user_not_signed_in_exception.dart';
import 'package:gynx_app/src/domain/generators/uuid_generator.dart';
import 'package:gynx_app/src/domain/repositories/auth_repository.dart';
import 'package:gynx_app/src/domain/repositories/storage_repository.dart';
import 'package:gynx_app/src/domain/repositories/t_user_profile_repository.dart';
import 'package:gynx_app/src/domain/repositories/t_user_repository.dart';
import 'package:gynx_app/src/domain/usecases/update_user_profile_usecase.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: UpdateUserProfileUseCase)
class UpdateUserProfileInteractor implements UpdateUserProfileUseCase {
  const UpdateUserProfileInteractor(
    this._uuidGenerator,
    this._authRepository,
    this._storageRepository,
    this._tUserRepository,
    this._tUserProfileRepository,
  );

  static const _avatarFolderName = 'avatars';

  final UuidGenerator _uuidGenerator;
  final AuthRepository _authRepository;
  final StorageRepository _storageRepository;
  final TUserRepository _tUserRepository;
  final TUserProfileRepository _tUserProfileRepository;

  @override
  Future<void> execute({
    required String? gynxId,
    required String? username,
    required File? avatarImage,
    required bool isDeleteAvatar,
    required String? selfIntroduction,
  }) async {
    if (gynxId == null &&
        username == null &&
        avatarImage == null &&
        !isDeleteAvatar &&
        selfIntroduction == null) {
      return;
    }
    final userId = _authRepository.currentUser?.id;
    if (userId == null) {
      throw const UserNotSignedInException();
    }
    await _updateGynxId(
      userId: userId,
      gynxId: gynxId,
    );
    await _updateProfile(
      userId: userId,
      username: username,
      avatarImage: avatarImage,
      isDeleteAvatar: isDeleteAvatar,
      selfIntroduction: selfIntroduction,
    );
  }

  Future<void> _updateGynxId({
    required String userId,
    required String? gynxId,
  }) async {
    if (gynxId == null) {
      return;
    }
    final tUser = await _tUserRepository.findByPrimaryKey(userId);
    if (tUser.gynxId != gynxId) {
      await _tUserRepository.updateByPrimaryKey(
        id: userId,
        gynxId: gynxId,
      );
    }
  }

  Future<void> _updateProfile({
    required String userId,
    required String? username,
    required File? avatarImage,
    required bool isDeleteAvatar,
    required String? selfIntroduction,
  }) async {
    if (username == null &&
        avatarImage == null &&
        !isDeleteAvatar &&
        selfIntroduction == null) {
      return;
    }
    final uploadedAvatarUrl = await _uploadAvatarImage(
      userId: userId,
      avatarImage: avatarImage,
      isDeleteAvatar: isDeleteAvatar,
    );
    final tUserProfile = await _tUserProfileRepository.findByPrimaryKey(userId);
    if (tUserProfile.username != username ||
        tUserProfile.selfIntroduction != selfIntroduction) {
      await _tUserProfileRepository.updateByPrimaryKeySelective(
        userId: userId,
        username: username,
        avatarUrl: uploadedAvatarUrl,
        isDeleteAvatarUrl: isDeleteAvatar,
        selfIntroduction: selfIntroduction,
      );
    }
    await _deleteAvatarImage(
      tUserProfile: tUserProfile,
      avatarImage: avatarImage,
      isDeleteAvatar: isDeleteAvatar,
    );
  }

  Future<String?> _uploadAvatarImage({
    required String userId,
    required File? avatarImage,
    required bool isDeleteAvatar,
  }) async {
    if (avatarImage == null || isDeleteAvatar) {
      return null;
    }
    return _storageRepository.uploadFile(
      storageType: StorageType.users,
      path: '$userId/$_avatarFolderName',
      filename: _uuidGenerator.generate(),
      file: avatarImage,
    );
  }

  Future<void> _deleteAvatarImage({
    required TUserProfile tUserProfile,
    required File? avatarImage,
    required bool isDeleteAvatar,
  }) async {
    if (avatarImage == null && !isDeleteAvatar) {
      return;
    }
    final beforeFilename = tUserProfile.avatarUrl?.split('/').last;
    if (beforeFilename != null) {
      await _storageRepository.deleteFile(
        storageType: StorageType.users,
        path: '${tUserProfile.userId}/$_avatarFolderName/$beforeFilename',
      );
    }
  }
}

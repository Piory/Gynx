import 'dart:async';
import 'dart:io';

import 'package:app/src/domain/entities/v_post.dart';
import 'package:app/src/domain/enums/storage_type.dart';
import 'package:app/src/domain/enums/timeline_type.dart';
import 'package:app/src/domain/exceptions/user_not_signed_in_exception.dart';
import 'package:app/src/domain/generators/uuid_generator.dart';
import 'package:app/src/domain/models/media.dart';
import 'package:app/src/domain/models/media_list.dart';
import 'package:app/src/domain/repositories/auth_repository.dart';
import 'package:app/src/domain/repositories/post_repository.dart';
import 'package:app/src/domain/repositories/storage_repository.dart';
import 'package:app/src/domain/repositories/v_post_repository.dart';
import 'package:app/src/domain/usecases/create_post_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CreatePostUseCase)
class CreatePostInteractor implements CreatePostUseCase {
  const CreatePostInteractor(
    this._uuidGenerator,
    this._authRepository,
    this._storageRepository,
    this._postRepository,
    this._vPostRepository,
  );

  static const _path = 'medias';

  final UuidGenerator _uuidGenerator;
  final AuthRepository _authRepository;
  final StorageRepository _storageRepository;
  final PostRepository _postRepository;
  final VPostRepository _vPostRepository;

  @override
  Future<VPost> execute({
    required String text,
    required MediaList mediaList,
  }) async {
    final userId = _authRepository.currentUser?.id;
    if (userId == null) {
      throw const UserNotSignedInException();
    }
    final postId = await _postRepository.create(
      TimelineType.follow,
      text,
      await _uploadMediaList(mediaList),
    );
    return _vPostRepository.findByPostId(postId);
  }

  Future<MediaList> _uploadMediaList(MediaList mediaList) async {
    final uploadedMedias = <Media>[];
    for (final media in mediaList.medias) {
      final url = await _storageRepository.uploadFile(
        storageType: StorageType.posts,
        path: _path,
        filename: _uuidGenerator.generate(),
        file: File(media.url),
      );
      uploadedMedias.add(
        media.copyWith(
          url: url,
        ),
      );
    }
    return MediaList(uploadedMedias);
  }
}

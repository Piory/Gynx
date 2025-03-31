import 'dart:async';

import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/domain/exceptions/user_not_signed_in_exception.dart';
import 'package:gynx_app/src/domain/repositories/auth_repository.dart';
import 'package:gynx_app/src/domain/repositories/t_user_post_favorite_repository.dart';
import 'package:gynx_app/src/domain/repositories/v_post_repository.dart';
import 'package:gynx_app/src/domain/usecases/favorite_post_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FavoritePostUseCase)
class FavoritePostInteractor implements FavoritePostUseCase {
  const FavoritePostInteractor(
    this._authRepository,
    this._tUserPostFavoriteRepository,
    this._vPostRepository,
  );

  final AuthRepository _authRepository;
  final TUserPostFavoriteRepository _tUserPostFavoriteRepository;
  final VPostRepository _vPostRepository;

  @override
  Future<VPost> execute({
    required int postId,
  }) async {
    final userId = _authRepository.currentUser?.id;
    if (userId == null) {
      throw const UserNotSignedInException();
    }
    final tUserPostFavorite = await _tUserPostFavoriteRepository.findByUniqueKey(userId, postId);
    if (tUserPostFavorite == null) {
      await _tUserPostFavoriteRepository.create(
        userId: userId,
        postId: postId,
      );
    } else {
      await _tUserPostFavoriteRepository.deleteByUniqueKey(userId, postId);
    }
    return _vPostRepository.findByPostId(postId);
  }
}

import 'dart:async';

import 'package:app/src/domain/models/post_id_list.dart';
import 'package:app/src/domain/models/t_user_post_favorite_list.dart';
import 'package:app/src/domain/models/v_post_with_favorite_list.dart';
import 'package:app/src/domain/repositories/t_user_post_favorite_repository.dart';
import 'package:app/src/domain/repositories/v_post_repository.dart';
import 'package:app/src/domain/usecases/fetch_user_post_favorite_usecase.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FetchUserPostFavoriteUseCase)
class FetchUserPostFavoriteInteractor implements FetchUserPostFavoriteUseCase {
  const FetchUserPostFavoriteInteractor(
    this._tUserPostFavoriteRepository,
    this._vPostRepository,
  );

  static const int _count = Constant.fetchPostCount;

  final TUserPostFavoriteRepository _tUserPostFavoriteRepository;
  final VPostRepository _vPostRepository;

  @override
  Future<VPostWithFavoriteList> execute({
    required String userId,
    DateTime? latestAt,
    DateTime? oldestAt,
  }) async {
    final tUserPostFavoriteList = await _findTUserPostFavoriteList(
      userId: userId,
      latestAt: latestAt,
      oldestAt: oldestAt,
    );
    final postIds = tUserPostFavoriteList.values.map((e) => e.postId).toList(growable: false);
    final vPostList = await _vPostRepository.findByPostIdList(PostIdList(postIds));
    return VPostWithFavoriteList.by(vPostList, tUserPostFavoriteList);
  }

  Future<TUserPostFavoriteList> _findTUserPostFavoriteList({
    required String userId,
    DateTime? latestAt,
    DateTime? oldestAt,
  }) {
    if (latestAt != null) {
      return _tUserPostFavoriteRepository.findByUserIdAndLatestAt(
        userId,
        latestAt,
        _count,
      );
    } else if (oldestAt != null) {
      return _tUserPostFavoriteRepository.findByUserIdAndOldestAt(
        userId,
        oldestAt,
        _count,
      );
    } else {
      return _tUserPostFavoriteRepository.findByUserIdAndLatest(
        userId,
        _count,
      );
    }
  }
}

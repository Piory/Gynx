import 'dart:async';

import 'package:gynx_app/src/domain/models/v_post_list.dart';
import 'package:gynx_app/src/domain/repositories/v_post_repository.dart';
import 'package:gynx_app/src/domain/usecases/fetch_user_post_usecase.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FetchUserPostUseCase)
class FetchUserPostInteractor implements FetchUserPostUseCase {
  const FetchUserPostInteractor(
    this._vPostRepository,
  );

  static const int _count = Constant.fetchPostCount;

  final VPostRepository _vPostRepository;

  @override
  Future<VPostList> execute({
    required String userId,
    int? sincePostId,
    int? maxPostId,
  }) {
    if (sincePostId != null) {
      return _vPostRepository.findByUserIdAndSincePostId(
        userId,
        sincePostId,
        _count,
      );
    } else if (maxPostId != null) {
      return _vPostRepository.findByUserIdAndMaxPostId(
        userId,
        maxPostId,
        _count,
      );
    } else {
      return _vPostRepository.findByUserIdAndLatest(
        userId,
        _count,
      );
    }
  }
}

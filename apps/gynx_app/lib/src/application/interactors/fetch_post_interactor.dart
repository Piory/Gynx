import 'dart:async';

import 'package:gynx_app/src/domain/models/v_post_list.dart';
import 'package:gynx_app/src/domain/repositories/v_post_repository.dart';
import 'package:gynx_app/src/domain/usecases/fetch_post_usecase.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: FetchPostUseCase)
class FetchPostInteractor implements FetchPostUseCase {
  const FetchPostInteractor(
    this._vPostRepository,
  );

  static const int _count = Constant.fetchPostCount;

  final VPostRepository _vPostRepository;

  @override
  Future<VPostList> execute({
    int? sincePostId,
    int? maxPostId,
  }) async {
    if (sincePostId != null) {
      return _vPostRepository.findBySincePostId(sincePostId, _count);
    } else if (maxPostId != null) {
      return _vPostRepository.findByMaxPostId(maxPostId, _count);
    } else {
      return _vPostRepository.findByLatest(_count);
    }
  }
}

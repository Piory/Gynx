import 'dart:async';

import 'package:app/src/domain/entities/v_user_detail.dart';
import 'package:app/src/domain/repositories/v_user_detail_repository.dart';
import 'package:app/src/domain/usecases/find_user_detail_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FindUserDetailUseCase)
class FindUserDetailInteractor implements FindUserDetailUseCase {
  const FindUserDetailInteractor(
    this._vUserDetailRepository,
  );

  final VUserDetailRepository _vUserDetailRepository;

  @override
  Future<VUserDetail> execute(String userId) {
    return _vUserDetailRepository.findByUserId(userId);
  }
}

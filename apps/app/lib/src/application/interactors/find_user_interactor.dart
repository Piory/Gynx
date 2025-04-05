import 'dart:async';

import 'package:app/src/domain/entities/v_user.dart';
import 'package:app/src/domain/repositories/v_user_repository.dart';
import 'package:app/src/domain/usecases/find_user_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FindUserUseCase)
class FindUserInteractor implements FindUserUseCase {
  const FindUserInteractor(
    this._vUserRepository,
  );

  final VUserRepository _vUserRepository;

  @override
  Future<VUser> execute(String userId) {
    return _vUserRepository.findByUserId(userId);
  }
}

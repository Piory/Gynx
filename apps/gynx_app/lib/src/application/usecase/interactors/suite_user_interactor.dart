import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gynx_app/src/application/usecase/results/suite_user_result.dart';
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart';
import 'package:gynx_app/src/domain/repositories/t_user_profile_reposirory.dart';
import 'package:gynx_app/src/domain/repositories/t_user_reposirory.dart';
import 'package:injectable/injectable.dart';

@singleton
class SuiteUserInteractor extends UseCase<SuiteUserResult, void> {
  SuiteUserInteractor(
    this._authRepository,
    this._tUserRepository,
    this._tUserProfileRepository,
  );

  final AuthRepository _authRepository;
  final TUserRepository _tUserRepository;
  final TUserProfileRepository _tUserProfileRepository;

  @override
  Future<Stream<SuiteUserResult>> buildUseCaseStream(void params) async {
    final streamController = StreamController<SuiteUserResult>();
    try {
      final user = _authRepository.currentUser;
      if (user == null) {
        throw Exception('User is not signed in');
      }
      final tUser = await _tUserRepository.findById(user.id);
      final tUserProfile = await _tUserProfileRepository.findByUserId(user.id);
      streamController.add(
        SuiteUserResult(
          tUser: tUser,
          tUserProfile: tUserProfile,
        ),
      );
      unawaited(streamController.close());
    } on Exception catch (e) {
      streamController.addError(e);
    }
    return streamController.stream;
  }
}

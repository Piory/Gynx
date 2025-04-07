import 'package:app/src/domain/repositories/t_user_repository.dart';
import 'package:app/src/domain/usecases/check_screen_name_existence_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CheckScreenNameExistenceUseCase)
class CheckScreenNameExistenceInteractor implements CheckScreenNameExistenceUseCase {
  const CheckScreenNameExistenceInteractor(this._tUserRepository);

  final TUserRepository _tUserRepository;

  @override
  Future<bool> execute(String screenName) {
    return _tUserRepository.existsByScreenName(screenName);
  }
}

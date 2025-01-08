import 'package:gynx_app/src/domain/repositories/t_user_repository.dart';
import 'package:gynx_app/src/domain/usecases/check_gynx_id_existence_usecase.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: CheckGynxIdExistenceUsecase)
class CheckGynxIdExistenceInteractor implements CheckGynxIdExistenceUsecase {
  const CheckGynxIdExistenceInteractor(this._tUserRepository);

  final TUserRepository _tUserRepository;

  @override
  Future<bool> execute(String gynxId) async {
    return _tUserRepository.existsById(gynxId);
  }
}

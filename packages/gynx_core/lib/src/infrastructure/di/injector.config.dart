// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:gynx_core/src/application/usecase/interactors/sign_in_interactor.dart'
    as _i913;
import 'package:gynx_core/src/domain/repositories/auth_reposirory.dart'
    as _i601;
import 'package:gynx_core/src/infrastructure/repositories/auth_repository_impl.dart'
    as _i926;
import 'package:gynx_core/src/interface/controllers/auth_controller.dart'
    as _i278;
import 'package:gynx_core/src/interface/presenters/sign_in_presenter.dart'
    as _i1012;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i601.AuthRepository>(() => const _i926.AuthRepositoryImpl());
    gh.singleton<_i913.SignInInteractor>(
        () => _i913.SignInInteractor(gh<_i601.AuthRepository>()));
    gh.singleton<_i1012.SignInPresenter>(
        () => _i1012.SignInPresenter(gh<_i913.SignInInteractor>()));
    gh.singleton<_i278.AuthController>(
        () => _i278.AuthController(gh<_i1012.SignInPresenter>()));
    return this;
  }
}

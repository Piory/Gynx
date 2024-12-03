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
import 'package:gynx_core/src/application/usecase/interactors/sign_up_interactor.dart'
    as _i155;
import 'package:gynx_core/src/domain/repositories/auth_reposirory.dart'
    as _i601;
import 'package:gynx_core/src/domain/repositories/user_reposirory.dart'
    as _i449;
import 'package:gynx_core/src/infrastructure/repositories/auth_repository_impl.dart'
    as _i926;
import 'package:gynx_core/src/infrastructure/repositories/user_repository_impl.dart'
    as _i882;
import 'package:gynx_core/src/infrastructure/supabase/supabase_module.dart'
    as _i627;
import 'package:gynx_core/src/interface/pages/sign_in/sign_in_controller.dart'
    as _i188;
import 'package:gynx_core/src/interface/pages/sign_in/sign_in_presenter.dart'
    as _i614;
import 'package:gynx_core/src/interface/pages/sign_up/sign_up_controller.dart'
    as _i232;
import 'package:gynx_core/src/interface/pages/sign_up/sign_up_presenter.dart'
    as _i853;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

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
    final supabaseModule = _$SupabaseModule();
    gh.factory<_i454.SupabaseClient>(() => supabaseModule.client);
    gh.singleton<_i449.UserRepository>(
        () => _i882.UserRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.singleton<_i601.AuthRepository>(
        () => _i926.AuthRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.singleton<_i155.SignUpInteractor>(
        () => _i155.SignUpInteractor(gh<_i601.AuthRepository>()));
    gh.singleton<_i913.SignInInteractor>(
        () => _i913.SignInInteractor(gh<_i601.AuthRepository>()));
    gh.singleton<_i614.SignInPresenter>(
        () => _i614.SignInPresenter(gh<_i913.SignInInteractor>()));
    gh.singleton<_i853.SignUpPresenter>(
        () => _i853.SignUpPresenter(gh<_i155.SignUpInteractor>()));
    gh.factory<_i188.SignInController>(
        () => _i188.SignInController(gh<_i614.SignInPresenter>()));
    gh.factory<_i232.SignUpController>(
        () => _i232.SignUpController(gh<_i853.SignUpPresenter>()));
    return this;
  }
}

class _$SupabaseModule extends _i627.SupabaseModule {}

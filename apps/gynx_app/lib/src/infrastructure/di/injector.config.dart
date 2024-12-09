// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:gynx_app/src/application/usecase/interactors/sign_in_interactor.dart'
    as _i955;
import 'package:gynx_app/src/application/usecase/interactors/sign_up_interactor.dart'
    as _i690;
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart' as _i200;
import 'package:gynx_app/src/domain/repositories/user_reposirory.dart' as _i886;
import 'package:gynx_app/src/infrastructure/repositories/auth_repository_impl.dart'
    as _i19;
import 'package:gynx_app/src/infrastructure/repositories/user_repository_impl.dart'
    as _i830;
import 'package:gynx_app/src/infrastructure/supabase/supabase_module.dart'
    as _i345;
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_controller.dart'
    as _i821;
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_presenter.dart'
    as _i886;
import 'package:gynx_app/src/interface/pages/sign_up/sign_up_controller.dart'
    as _i215;
import 'package:gynx_app/src/interface/pages/sign_up/sign_up_presenter.dart'
    as _i71;
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
    gh.singleton<_i886.UserRepository>(
        () => _i830.UserRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.singleton<_i200.AuthRepository>(
        () => _i19.AuthRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.singleton<_i690.SignUpInteractor>(
        () => _i690.SignUpInteractor(gh<_i200.AuthRepository>()));
    gh.singleton<_i955.SignInInteractor>(
        () => _i955.SignInInteractor(gh<_i200.AuthRepository>()));
    gh.singleton<_i886.SignInPresenter>(
        () => _i886.SignInPresenter(gh<_i955.SignInInteractor>()));
    gh.singleton<_i71.SignUpPresenter>(
        () => _i71.SignUpPresenter(gh<_i690.SignUpInteractor>()));
    gh.factory<_i215.SignUpController>(
        () => _i215.SignUpController(gh<_i71.SignUpPresenter>()));
    gh.factory<_i821.SignInController>(
        () => _i821.SignInController(gh<_i886.SignInPresenter>()));
    return this;
  }
}

class _$SupabaseModule extends _i345.SupabaseModule {}

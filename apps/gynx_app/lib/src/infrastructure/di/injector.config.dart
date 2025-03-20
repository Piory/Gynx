// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:gynx_app/src/application/usecase/interactors/link_identity_interactor.dart'
    as _i612;
import 'package:gynx_app/src/application/usecase/interactors/sign_in_with_anonymous_interactor.dart'
    as _i711;
import 'package:gynx_app/src/application/usecase/interactors/sign_in_with_oauth_interactor.dart'
    as _i912;
import 'package:gynx_app/src/application/usecase/interactors/sign_out_interactor.dart'
    as _i69;
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart' as _i200;
import 'package:gynx_app/src/domain/repositories/user_reposirory.dart' as _i886;
import 'package:gynx_app/src/infrastructure/google/google_module.dart' as _i15;
import 'package:gynx_app/src/infrastructure/repositories/auth_repository_impl.dart'
    as _i19;
import 'package:gynx_app/src/infrastructure/repositories/user_repository_impl.dart'
    as _i830;
import 'package:gynx_app/src/infrastructure/supabase/supabase_module.dart'
    as _i345;
import 'package:gynx_app/src/interface/pages/profile/profile_controller.dart'
    as _i28;
import 'package:gynx_app/src/interface/pages/profile/profile_presenter.dart'
    as _i415;
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_controller.dart'
    as _i821;
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_presenter.dart'
    as _i886;
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
    final googleModule = _$GoogleModule();
    final supabaseModule = _$SupabaseModule();
    gh.factory<_i116.GoogleSignIn>(() => googleModule.googleSignIn);
    gh.factory<_i454.SupabaseClient>(() => supabaseModule.client);
    gh.singleton<_i886.UserRepository>(
        () => _i830.UserRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.singleton<_i200.AuthRepository>(() => _i19.AuthRepositoryImpl(
          gh<_i454.SupabaseClient>(),
          gh<_i116.GoogleSignIn>(),
        ));
    gh.singleton<_i69.SignOutInteractor>(
        () => _i69.SignOutInteractor(gh<_i200.AuthRepository>()));
    gh.singleton<_i612.LinkIdentityInteractor>(
        () => _i612.LinkIdentityInteractor(gh<_i200.AuthRepository>()));
    gh.singleton<_i711.SignInWithAnonymousInteractor>(
        () => _i711.SignInWithAnonymousInteractor(gh<_i200.AuthRepository>()));
    gh.singleton<_i912.SignInWithOAuthInteractor>(
        () => _i912.SignInWithOAuthInteractor(gh<_i200.AuthRepository>()));
    gh.singleton<_i415.ProfilePresenter>(
        () => _i415.ProfilePresenter(gh<_i69.SignOutInteractor>()));
    gh.singleton<_i886.SignInPresenter>(() => _i886.SignInPresenter(
          gh<_i711.SignInWithAnonymousInteractor>(),
          gh<_i912.SignInWithOAuthInteractor>(),
        ));
    gh.factory<_i28.ProfileController>(
        () => _i28.ProfileController(gh<_i415.ProfilePresenter>()));
    gh.factory<_i821.SignInController>(
        () => _i821.SignInController(gh<_i886.SignInPresenter>()));
    return this;
  }
}

class _$GoogleModule extends _i15.GoogleModule {}

class _$SupabaseModule extends _i345.SupabaseModule {}

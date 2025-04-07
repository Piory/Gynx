// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app/src/application/interactors/check_screen_name_existence_interactor.dart'
    as _i396;
import 'package:app/src/application/interactors/create_post_interactor.dart'
    as _i702;
import 'package:app/src/application/interactors/favorite_post_interactor.dart'
    as _i201;
import 'package:app/src/application/interactors/fetch_post_interactor.dart'
    as _i398;
import 'package:app/src/application/interactors/fetch_user_post_favorite_interactor.dart'
    as _i180;
import 'package:app/src/application/interactors/fetch_user_post_interactor.dart'
    as _i91;
import 'package:app/src/application/interactors/find_user_detail_interactor.dart'
    as _i1044;
import 'package:app/src/application/interactors/find_user_interactor.dart'
    as _i436;
import 'package:app/src/application/interactors/link_identity_interactor.dart'
    as _i842;
import 'package:app/src/application/interactors/sign_in_with_anonymous_interactor.dart'
    as _i1010;
import 'package:app/src/application/interactors/sign_in_with_oauth_interactor.dart'
    as _i163;
import 'package:app/src/application/interactors/sign_out_interactor.dart'
    as _i633;
import 'package:app/src/application/interactors/suite_user_interactor.dart'
    as _i525;
import 'package:app/src/application/interactors/update_user_profile_interactor.dart'
    as _i438;
import 'package:app/src/domain/generators/uuid_generator.dart' as _i887;
import 'package:app/src/domain/repositories/auth_repository.dart' as _i840;
import 'package:app/src/domain/repositories/post_repository.dart' as _i952;
import 'package:app/src/domain/repositories/storage_repository.dart' as _i677;
import 'package:app/src/domain/repositories/t_post_media_repository.dart'
    as _i730;
import 'package:app/src/domain/repositories/t_post_repository.dart' as _i149;
import 'package:app/src/domain/repositories/t_user_follow_repository.dart'
    as _i620;
import 'package:app/src/domain/repositories/t_user_post_favorite_repository.dart'
    as _i518;
import 'package:app/src/domain/repositories/t_user_profile_repository.dart'
    as _i109;
import 'package:app/src/domain/repositories/t_user_repository.dart' as _i916;
import 'package:app/src/domain/repositories/t_user_timeline_repository.dart'
    as _i862;
import 'package:app/src/domain/repositories/v_post_repository.dart' as _i733;
import 'package:app/src/domain/repositories/v_user_detail_repository.dart'
    as _i752;
import 'package:app/src/domain/repositories/v_user_repository.dart' as _i397;
import 'package:app/src/domain/usecases/check_screen_name_existence_usecase.dart'
    as _i894;
import 'package:app/src/domain/usecases/create_post_usecase.dart' as _i1041;
import 'package:app/src/domain/usecases/favorite_post_usecase.dart' as _i748;
import 'package:app/src/domain/usecases/fetch_post_usecase.dart' as _i732;
import 'package:app/src/domain/usecases/fetch_user_post_favorite_usecase.dart'
    as _i531;
import 'package:app/src/domain/usecases/fetch_user_post_usecase.dart' as _i164;
import 'package:app/src/domain/usecases/find_user_detail_usecase.dart' as _i492;
import 'package:app/src/domain/usecases/find_user_usecase.dart' as _i620;
import 'package:app/src/domain/usecases/link_identity_usecase.dart' as _i621;
import 'package:app/src/domain/usecases/sign_in_with_anonymous_usecase.dart'
    as _i365;
import 'package:app/src/domain/usecases/sign_in_with_oauth_usecase.dart'
    as _i486;
import 'package:app/src/domain/usecases/sign_out_usecase.dart' as _i935;
import 'package:app/src/domain/usecases/suite_user_usecase.dart' as _i709;
import 'package:app/src/domain/usecases/update_user_profile_usecase.dart'
    as _i668;
import 'package:app/src/infrastructure/di/modules/flutter_video_info_module.dart'
    as _i552;
import 'package:app/src/infrastructure/di/modules/google_module.dart' as _i196;
import 'package:app/src/infrastructure/di/modules/image_picker_module.dart'
    as _i945;
import 'package:app/src/infrastructure/di/modules/supabase_module.dart'
    as _i376;
import 'package:app/src/infrastructure/di/modules/uuid_module.dart' as _i416;
import 'package:app/src/infrastructure/dialogs/alert_impl.dart' as _i190;
import 'package:app/src/infrastructure/dialogs/loading_dialog_impl.dart'
    as _i843;
import 'package:app/src/infrastructure/dialogs/notify_impl.dart' as _i226;
import 'package:app/src/infrastructure/generators/uuid_generator_impl.dart'
    as _i769;
import 'package:app/src/infrastructure/images/image_compressor.dart' as _i32;
import 'package:app/src/infrastructure/repositories/auth_repository_impl.dart'
    as _i631;
import 'package:app/src/infrastructure/repositories/post_repository_impl.dart'
    as _i762;
import 'package:app/src/infrastructure/repositories/storage_repository_impl.dart'
    as _i580;
import 'package:app/src/infrastructure/repositories/t_post_media_repository_impl.dart'
    as _i968;
import 'package:app/src/infrastructure/repositories/t_post_repository_impl.dart'
    as _i634;
import 'package:app/src/infrastructure/repositories/t_user_follow_repository_impl.dart'
    as _i676;
import 'package:app/src/infrastructure/repositories/t_user_post_favorite_repository_impl.dart'
    as _i978;
import 'package:app/src/infrastructure/repositories/t_user_profile_repository_impl.dart'
    as _i907;
import 'package:app/src/infrastructure/repositories/t_user_repository_impl.dart'
    as _i56;
import 'package:app/src/infrastructure/repositories/t_user_timeline_repository_impl.dart'
    as _i734;
import 'package:app/src/infrastructure/repositories/v_post_repository_impl.dart'
    as _i298;
import 'package:app/src/infrastructure/repositories/v_user_detail_repository_impl.dart'
    as _i180;
import 'package:app/src/infrastructure/repositories/v_user_repository_impl.dart'
    as _i760;
import 'package:app/src/infrastructure/router/page_navigator_impl.dart'
    as _i612;
import 'package:app/src/presentation/dialogs/alert.dart' as _i96;
import 'package:app/src/presentation/dialogs/loading_dialog.dart' as _i667;
import 'package:app/src/presentation/dialogs/notify.dart' as _i207;
import 'package:app/src/presentation/navigation/page_navigator.dart' as _i312;
import 'package:app/src/presentation/pages/edit_profile/edit_profile_controller.dart'
    as _i667;
import 'package:app/src/presentation/pages/home/home_controller.dart' as _i706;
import 'package:app/src/presentation/pages/profile/profile_controller.dart'
    as _i854;
import 'package:app/src/presentation/pages/setting/setting_controller.dart'
    as _i651;
import 'package:app/src/presentation/pages/sign_in/sign_in_controller.dart'
    as _i920;
import 'package:flutter_video_info/flutter_video_info.dart' as _i766;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;
import 'package:uuid/uuid.dart' as _i706;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final supabaseModule = _$SupabaseModule();
    final uuidModule = _$UuidModule();
    final googleModule = _$GoogleModule();
    final imagePickerModule = _$ImagePickerModule();
    final flutterVideoInfoModule = _$FlutterVideoInfoModule();
    await gh.factoryAsync<_i454.SupabaseClient>(
      () => supabaseModule.client,
      preResolve: true,
    );
    gh.lazySingleton<_i706.Uuid>(() => uuidModule.uuid);
    gh.lazySingleton<_i116.GoogleSignIn>(() => googleModule.googleSignIn);
    gh.lazySingleton<_i183.ImagePicker>(() => imagePickerModule.imagePicker);
    gh.lazySingleton<_i766.FlutterVideoInfo>(
        () => flutterVideoInfoModule.flutterVideoInfo);
    gh.lazySingleton<_i32.ImageCompressor>(() => const _i32.ImageCompressor());
    gh.lazySingleton<_i667.LoadingDialog>(() => _i843.DialogImpl());
    gh.lazySingleton<_i312.PageNavigator>(() => _i612.PageNavigatorImpl());
    gh.lazySingleton<_i207.Notify>(() => _i226.NotifyImpl());
    gh.lazySingleton<_i887.UuidGenerator>(
        () => _i769.UuidGeneratorImpl(gh<_i706.Uuid>()));
    gh.lazySingleton<_i96.Alert>(() => _i190.AlertImpl());
    gh.lazySingleton<_i752.VUserDetailRepository>(
        () => _i180.VUserDetailRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i677.StorageRepository>(() => _i580.StorageRepositoryImpl(
          gh<_i454.SupabaseClient>(),
          gh<_i32.ImageCompressor>(),
        ));
    gh.lazySingleton<_i952.PostRepository>(
        () => _i762.PostRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i109.TUserProfileRepository>(
        () => _i907.TUserProfileRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i518.TUserPostFavoriteRepository>(() =>
        _i978.TUserPostFavoriteRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i916.TUserRepository>(
        () => _i56.TUserRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i730.TPostMediaRepository>(
        () => _i968.TPostMediaRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i620.TUserFollowRepository>(
        () => _i676.TUserFollowRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i149.TPostRepository>(
        () => _i634.TPostRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i733.VPostRepository>(
        () => _i298.VPostRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i397.VUserRepository>(
        () => _i760.VUserRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i840.AuthRepository>(() => _i631.AuthRepositoryImpl(
          gh<_i454.SupabaseClient>(),
          gh<_i116.GoogleSignIn>(),
        ));
    gh.lazySingleton<_i862.TUserTimelineRepository>(
        () => _i734.TUserTimelineRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i709.SuiteUserUseCase>(() => _i525.SuiteUserInteractor(
          gh<_i840.AuthRepository>(),
          gh<_i752.VUserDetailRepository>(),
        ));
    gh.lazySingleton<_i894.CheckScreenNameExistenceUseCase>(() =>
        _i396.CheckScreenNameExistenceInteractor(gh<_i916.TUserRepository>()));
    gh.lazySingleton<_i492.FindUserDetailUseCase>(() =>
        _i1044.FindUserDetailInteractor(gh<_i752.VUserDetailRepository>()));
    gh.lazySingleton<_i935.SignOutUseCase>(
        () => _i633.SignOutInteractor(gh<_i840.AuthRepository>()));
    gh.lazySingleton<_i365.SignInWithAnonymousUseCase>(
        () => _i1010.SignInWithAnonymousInteractor(gh<_i840.AuthRepository>()));
    gh.lazySingleton<_i748.FavoritePostUseCase>(
        () => _i201.FavoritePostInteractor(
              gh<_i840.AuthRepository>(),
              gh<_i518.TUserPostFavoriteRepository>(),
              gh<_i733.VPostRepository>(),
            ));
    gh.lazySingleton<_i620.FindUserUseCase>(
        () => _i436.FindUserInteractor(gh<_i397.VUserRepository>()));
    gh.lazySingleton<_i668.UpdateUserProfileUseCase>(
        () => _i438.UpdateUserProfileInteractor(
              gh<_i887.UuidGenerator>(),
              gh<_i840.AuthRepository>(),
              gh<_i677.StorageRepository>(),
              gh<_i916.TUserRepository>(),
              gh<_i109.TUserProfileRepository>(),
            ));
    gh.lazySingleton<_i531.FetchUserPostFavoriteUseCase>(
        () => _i180.FetchUserPostFavoriteInteractor(
              gh<_i518.TUserPostFavoriteRepository>(),
              gh<_i733.VPostRepository>(),
            ));
    gh.lazySingleton<_i621.LinkIdentityUseCase>(
        () => _i842.LinkIdentityInteractor(gh<_i840.AuthRepository>()));
    gh.lazySingleton<_i486.SignInWithOAuthUseCase>(
        () => _i163.SignInWithOAuthInteractor(gh<_i840.AuthRepository>()));
    gh.lazySingleton<_i1041.CreatePostUseCase>(() => _i702.CreatePostInteractor(
          gh<_i887.UuidGenerator>(),
          gh<_i840.AuthRepository>(),
          gh<_i677.StorageRepository>(),
          gh<_i952.PostRepository>(),
          gh<_i733.VPostRepository>(),
        ));
    gh.lazySingleton<_i732.FetchPostUseCase>(
        () => _i398.FetchPostInteractor(gh<_i733.VPostRepository>()));
    gh.lazySingleton<_i164.FetchUserPostUseCase>(
        () => _i91.FetchUserPostInteractor(gh<_i733.VPostRepository>()));
    gh.lazySingleton<_i651.SettingController>(() => _i651.SettingController(
          gh<_i667.LoadingDialog>(),
          gh<_i207.Notify>(),
          gh<_i96.Alert>(),
          gh<_i935.SignOutUseCase>(),
        ));
    gh.lazySingleton<_i854.ProfileController>(() => _i854.ProfileController(
          gh<_i667.LoadingDialog>(),
          gh<_i207.Notify>(),
          gh<_i935.SignOutUseCase>(),
        ));
    gh.lazySingleton<_i667.EditProfileController>(
        () => _i667.EditProfileController(
              gh<_i312.PageNavigator>(),
              gh<_i667.LoadingDialog>(),
              gh<_i207.Notify>(),
              gh<_i668.UpdateUserProfileUseCase>(),
            ));
    gh.lazySingleton<_i920.SignInController>(() => _i920.SignInController(
          gh<_i486.SignInWithOAuthUseCase>(),
          gh<_i365.SignInWithAnonymousUseCase>(),
          gh<_i667.LoadingDialog>(),
          gh<_i207.Notify>(),
          gh<_i96.Alert>(),
        ));
    gh.lazySingleton<_i706.HomeController>(
        () => _i706.HomeController(gh<_i1041.CreatePostUseCase>()));
    return this;
  }
}

class _$SupabaseModule extends _i376.SupabaseModule {}

class _$UuidModule extends _i416.UuidModule {}

class _$GoogleModule extends _i196.GoogleModule {}

class _$ImagePickerModule extends _i945.ImagePickerModule {}

class _$FlutterVideoInfoModule extends _i552.FlutterVideoInfoModule {}

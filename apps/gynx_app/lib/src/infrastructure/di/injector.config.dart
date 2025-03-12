// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_video_info/flutter_video_info.dart' as _i766;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:gynx_app/src/application/interactors/check_gynx_id_existence_interactor.dart'
    as _i1022;
import 'package:gynx_app/src/application/interactors/create_post_interactor.dart'
    as _i1009;
import 'package:gynx_app/src/application/interactors/fetch_post_interactor.dart'
    as _i785;
import 'package:gynx_app/src/application/interactors/fetch_user_post_favorite_interactor.dart'
    as _i261;
import 'package:gynx_app/src/application/interactors/fetch_user_post_interactor.dart'
    as _i265;
import 'package:gynx_app/src/application/interactors/find_user_detail_interactor.dart'
    as _i345;
import 'package:gynx_app/src/application/interactors/find_user_interactor.dart'
    as _i868;
import 'package:gynx_app/src/application/interactors/link_identity_interactor.dart'
    as _i994;
import 'package:gynx_app/src/application/interactors/sign_in_with_anonymous_interactor.dart'
    as _i566;
import 'package:gynx_app/src/application/interactors/sign_in_with_oauth_interactor.dart'
    as _i496;
import 'package:gynx_app/src/application/interactors/sign_out_interactor.dart'
    as _i154;
import 'package:gynx_app/src/application/interactors/suite_user_interactor.dart'
    as _i977;
import 'package:gynx_app/src/application/interactors/update_user_profile_interactor.dart'
    as _i484;
import 'package:gynx_app/src/domain/generators/uuid_generator.dart' as _i8;
import 'package:gynx_app/src/domain/repositories/auth_repository.dart' as _i714;
import 'package:gynx_app/src/domain/repositories/post_repository.dart' as _i940;
import 'package:gynx_app/src/domain/repositories/storage_repository.dart'
    as _i850;
import 'package:gynx_app/src/domain/repositories/t_post_media_repository.dart'
    as _i978;
import 'package:gynx_app/src/domain/repositories/t_post_repository.dart'
    as _i957;
import 'package:gynx_app/src/domain/repositories/t_user_follow_repository.dart'
    as _i787;
import 'package:gynx_app/src/domain/repositories/t_user_post_favorite_repository.dart'
    as _i56;
import 'package:gynx_app/src/domain/repositories/t_user_profile_repository.dart'
    as _i429;
import 'package:gynx_app/src/domain/repositories/t_user_repository.dart'
    as _i252;
import 'package:gynx_app/src/domain/repositories/t_user_timeline_repository.dart'
    as _i655;
import 'package:gynx_app/src/domain/repositories/v_post_repository.dart'
    as _i290;
import 'package:gynx_app/src/domain/repositories/v_user_detail_repository.dart'
    as _i675;
import 'package:gynx_app/src/domain/repositories/v_user_repository.dart'
    as _i532;
import 'package:gynx_app/src/domain/usecases/check_gynx_id_existence_usecase.dart'
    as _i599;
import 'package:gynx_app/src/domain/usecases/create_post_usecase.dart' as _i751;
import 'package:gynx_app/src/domain/usecases/fetch_post_usecase.dart' as _i926;
import 'package:gynx_app/src/domain/usecases/fetch_user_post_favorite_usecase.dart'
    as _i721;
import 'package:gynx_app/src/domain/usecases/fetch_user_post_usecase.dart'
    as _i526;
import 'package:gynx_app/src/domain/usecases/find_user_detail_usecase.dart'
    as _i67;
import 'package:gynx_app/src/domain/usecases/find_user_usecase.dart' as _i826;
import 'package:gynx_app/src/domain/usecases/link_identity_usecase.dart'
    as _i89;
import 'package:gynx_app/src/domain/usecases/sign_in_with_anonymous_usecase.dart'
    as _i928;
import 'package:gynx_app/src/domain/usecases/sign_in_with_oauth_usecase.dart'
    as _i67;
import 'package:gynx_app/src/domain/usecases/sign_out_usecase.dart' as _i990;
import 'package:gynx_app/src/domain/usecases/suite_user_usecase.dart' as _i650;
import 'package:gynx_app/src/domain/usecases/update_user_profile_usecase.dart'
    as _i433;
import 'package:gynx_app/src/infrastructure/di/modules/flutter_video_info_module.dart'
    as _i224;
import 'package:gynx_app/src/infrastructure/di/modules/google_module.dart'
    as _i337;
import 'package:gynx_app/src/infrastructure/di/modules/image_picker_module.dart'
    as _i704;
import 'package:gynx_app/src/infrastructure/di/modules/supabase_module.dart'
    as _i412;
import 'package:gynx_app/src/infrastructure/di/modules/uuid_module.dart'
    as _i650;
import 'package:gynx_app/src/infrastructure/dialogs/alert_impl.dart' as _i1056;
import 'package:gynx_app/src/infrastructure/dialogs/loading_dialog_impl.dart'
    as _i64;
import 'package:gynx_app/src/infrastructure/dialogs/notify_impl.dart' as _i136;
import 'package:gynx_app/src/infrastructure/generators/uuid_generator_impl.dart'
    as _i291;
import 'package:gynx_app/src/infrastructure/images/image_compressor.dart'
    as _i265;
import 'package:gynx_app/src/infrastructure/repositories/auth_repository_impl.dart'
    as _i19;
import 'package:gynx_app/src/infrastructure/repositories/post_repository_impl.dart'
    as _i6;
import 'package:gynx_app/src/infrastructure/repositories/storage_repository_impl.dart'
    as _i165;
import 'package:gynx_app/src/infrastructure/repositories/t_post_media_repository_impl.dart'
    as _i129;
import 'package:gynx_app/src/infrastructure/repositories/t_post_repository_impl.dart'
    as _i35;
import 'package:gynx_app/src/infrastructure/repositories/t_user_follow_repository_impl.dart'
    as _i315;
import 'package:gynx_app/src/infrastructure/repositories/t_user_post_favorite_repository_impl.dart'
    as _i231;
import 'package:gynx_app/src/infrastructure/repositories/t_user_profile_repository_impl.dart'
    as _i883;
import 'package:gynx_app/src/infrastructure/repositories/t_user_repository_impl.dart'
    as _i69;
import 'package:gynx_app/src/infrastructure/repositories/t_user_timeline_repository_impl.dart'
    as _i351;
import 'package:gynx_app/src/infrastructure/repositories/v_post_repository_impl.dart'
    as _i313;
import 'package:gynx_app/src/infrastructure/repositories/v_user_detail_repository_impl.dart'
    as _i525;
import 'package:gynx_app/src/infrastructure/repositories/v_user_repository_impl.dart'
    as _i557;
import 'package:gynx_app/src/infrastructure/router/page_navigator_impl.dart'
    as _i83;
import 'package:gynx_app/src/presentation/dialogs/alert.dart' as _i862;
import 'package:gynx_app/src/presentation/dialogs/loading_dialog.dart' as _i190;
import 'package:gynx_app/src/presentation/dialogs/notify.dart' as _i703;
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart'
    as _i626;
import 'package:gynx_app/src/presentation/pages/edit_profile/edit_profile_controller.dart'
    as _i69;
import 'package:gynx_app/src/presentation/pages/home/home_controller.dart'
    as _i1004;
import 'package:gynx_app/src/presentation/pages/profile/profile_controller.dart'
    as _i723;
import 'package:gynx_app/src/presentation/pages/setting/setting_controller.dart'
    as _i50;
import 'package:gynx_app/src/presentation/pages/sign_in/sign_in_controller.dart'
    as _i400;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;
import 'package:uuid/uuid.dart' as _i706;

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
    final uuidModule = _$UuidModule();
    final googleModule = _$GoogleModule();
    final supabaseModule = _$SupabaseModule();
    final imagePickerModule = _$ImagePickerModule();
    final flutterVideoInfoModule = _$FlutterVideoInfoModule();
    gh.singleton<_i706.Uuid>(() => uuidModule.uuid);
    gh.singleton<_i116.GoogleSignIn>(() => googleModule.googleSignIn);
    gh.singleton<_i454.SupabaseClient>(() => supabaseModule.client);
    gh.singleton<_i183.ImagePicker>(() => imagePickerModule.imagePicker);
    gh.singleton<_i766.FlutterVideoInfo>(
        () => flutterVideoInfoModule.flutterVideoInfo);
    gh.singleton<_i265.ImageCompressor>(() => const _i265.ImageCompressor());
    gh.singleton<_i190.LoadingDialog>(() => _i64.DialogImpl());
    gh.singleton<_i703.Notify>(() => _i136.NotifyImpl());
    gh.singleton<_i626.PageNavigator>(() => _i83.PageNavigatorImpl());
    gh.singleton<_i862.Alert>(() => _i1056.AlertImpl());
    gh.singleton<_i8.UuidGenerator>(
        () => _i291.UuidGeneratorImpl(gh<_i706.Uuid>()));
    gh.singleton<_i429.TUserProfileRepository>(
        () => _i883.TUserProfileRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.singleton<_i850.StorageRepository>(() => _i165.StorageRepositoryImpl(
          gh<_i454.SupabaseClient>(),
          gh<_i265.ImageCompressor>(),
        ));
    gh.singleton<_i675.VUserDetailRepository>(
        () => _i525.VUserDetailRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.singleton<_i290.VPostRepository>(
        () => _i313.VPostRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.singleton<_i714.AuthRepository>(() => _i19.AuthRepositoryImpl(
          gh<_i454.SupabaseClient>(),
          gh<_i116.GoogleSignIn>(),
        ));
    gh.singleton<_i787.TUserFollowRepository>(
        () => _i315.TUserFollowRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.singleton<_i978.TPostMediaRepository>(
        () => _i129.TPostMediaRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.singleton<_i655.TUserTimelineRepository>(
        () => _i351.TUserTimelineRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.singleton<_i990.SignOutUseCase>(
        () => _i154.SignOutInteractor(gh<_i714.AuthRepository>()));
    gh.singleton<_i957.TPostRepository>(
        () => _i35.TPostRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.singleton<_i526.FetchUserPostUseCase>(
        () => _i265.FetchUserPostInteractor(gh<_i290.VPostRepository>()));
    gh.singleton<_i252.TUserRepository>(
        () => _i69.TUserRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.singleton<_i532.VUserRepository>(
        () => _i557.VUserRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.singleton<_i56.TUserPostFavoriteRepository>(() =>
        _i231.TUserPostFavoriteRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.singleton<_i926.FetchPostUseCase>(
        () => _i785.FetchPostInteractor(gh<_i290.VPostRepository>()));
    gh.singleton<_i940.PostRepository>(
        () => _i6.PostRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.singleton<_i723.ProfileController>(() => _i723.ProfileController(
          gh<_i190.LoadingDialog>(),
          gh<_i703.Notify>(),
          gh<_i990.SignOutUseCase>(),
        ));
    gh.singleton<_i599.CheckGynxIdExistenceUsecase>(() =>
        _i1022.CheckGynxIdExistenceInteractor(gh<_i252.TUserRepository>()));
    gh.singleton<_i67.FindUserDetailUseCase>(() =>
        _i345.FindUserDetailInteractor(gh<_i675.VUserDetailRepository>()));
    gh.singleton<_i751.CreatePostUseCase>(() => _i1009.CreatePostInteractor(
          gh<_i8.UuidGenerator>(),
          gh<_i714.AuthRepository>(),
          gh<_i850.StorageRepository>(),
          gh<_i940.PostRepository>(),
          gh<_i290.VPostRepository>(),
        ));
    gh.singleton<_i650.SuiteUserUseCase>(() => _i977.SuiteUserInteractor(
          gh<_i714.AuthRepository>(),
          gh<_i675.VUserDetailRepository>(),
        ));
    gh.singleton<_i89.LinkIdentityUseCase>(
        () => _i994.LinkIdentityInteractor(gh<_i714.AuthRepository>()));
    gh.singleton<_i928.SignInWithAnonymousUseCase>(
        () => _i566.SignInWithAnonymousInteractor(gh<_i714.AuthRepository>()));
    gh.singleton<_i433.UpdateUserProfileUseCase>(
        () => _i484.UpdateUserProfileInteractor(
              gh<_i8.UuidGenerator>(),
              gh<_i714.AuthRepository>(),
              gh<_i850.StorageRepository>(),
              gh<_i252.TUserRepository>(),
              gh<_i429.TUserProfileRepository>(),
            ));
    gh.singleton<_i50.SettingController>(() => _i50.SettingController(
          gh<_i190.LoadingDialog>(),
          gh<_i703.Notify>(),
          gh<_i862.Alert>(),
          gh<_i990.SignOutUseCase>(),
        ));
    gh.singleton<_i67.SignInWithOAuthUseCase>(
        () => _i496.SignInWithOAuthInteractor(gh<_i714.AuthRepository>()));
    gh.singleton<_i1004.HomeController>(
        () => _i1004.HomeController(gh<_i751.CreatePostUseCase>()));
    gh.singleton<_i721.FetchUserPostFavoriteUseCase>(
        () => _i261.FetchUserPostFavoriteInteractor(
              gh<_i56.TUserPostFavoriteRepository>(),
              gh<_i290.VPostRepository>(),
            ));
    gh.singleton<_i826.FindUserUseCase>(
        () => _i868.FindUserInteractor(gh<_i532.VUserRepository>()));
    gh.singleton<_i400.SignInController>(() => _i400.SignInController(
          gh<_i67.SignInWithOAuthUseCase>(),
          gh<_i928.SignInWithAnonymousUseCase>(),
          gh<_i190.LoadingDialog>(),
          gh<_i703.Notify>(),
          gh<_i862.Alert>(),
        ));
    gh.singleton<_i69.EditProfileController>(() => _i69.EditProfileController(
          gh<_i626.PageNavigator>(),
          gh<_i190.LoadingDialog>(),
          gh<_i703.Notify>(),
          gh<_i433.UpdateUserProfileUseCase>(),
        ));
    return this;
  }
}

class _$UuidModule extends _i650.UuidModule {}

class _$GoogleModule extends _i337.GoogleModule {}

class _$SupabaseModule extends _i412.SupabaseModule {}

class _$ImagePickerModule extends _i704.ImagePickerModule {}

class _$FlutterVideoInfoModule extends _i224.FlutterVideoInfoModule {}

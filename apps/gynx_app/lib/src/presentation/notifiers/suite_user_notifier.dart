import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/domain/models/suite_user.dart';
import 'package:gynx_app/src/domain/usecases/fetch_user_post_favorite_usecase.dart';
import 'package:gynx_app/src/domain/usecases/fetch_user_post_usecase.dart';
import 'package:gynx_app/src/domain/usecases/suite_user_usecase.dart';
import 'package:gynx_app/src/presentation/notifiers/post_map_notifier.dart';
import 'package:gynx_app/src/presentation/notifiers/user_detail_notifier.dart';
import 'package:gynx_app/src/presentation/notifiers/user_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../generated/src/presentation/notifiers/suite_user_notifier.g.dart';

@riverpod
class SuiteUserNotifier extends _$SuiteUserNotifier {
  @override
  FutureOr<SuiteUser> build() async {
    final suiteUser = await GetIt.I<SuiteUserUseCase>().execute();
    final userId = suiteUser.vUserDetail.userId;
    ref
      ..invalidate(userNotifierProvider.call(userId))
      ..invalidate(userDetailNotifierProvider.call(userId));
    ref.read(postMapNotifierProvider.notifier)
      ..putByList(suiteUser.vUserDetail.latestPostList)
      ..putByList(suiteUser.vUserDetail.favoritePostList);
    return suiteUser;
  }

  void addPost(VPost vPost) {
    final vUserDetail = state.requireValue.vUserDetail;
    state = AsyncData(
      state.requireValue.copyWith(
        vUserDetail: vUserDetail.copyWith(
          latestPosts: vUserDetail.latestPostList.add(vPost).vPosts,
        ),
      ),
    );
  }

  void addFavoritePost(VPost vPost) {
    final vUserDetail = state.requireValue.vUserDetail;
    state = AsyncData(
      state.requireValue.copyWith(
        vUserDetail: vUserDetail.copyWith(
          favoritePosts: vUserDetail.favoritePostList.add(vPost).vPosts,
        ),
      ),
    );
  }

  void removeFavoritePostByPostId(int postId) {
    final vUserDetail = state.requireValue.vUserDetail;
    state = AsyncData(
      state.requireValue.copyWith(
        vUserDetail: vUserDetail.copyWith(
          favoritePosts: vUserDetail.favoritePostList.removeByPostId(postId).vPosts,
        ),
      ),
    );
  }

  Future<void> fetchNextForLatestPosts() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final vUserDetail = state.requireValue.vUserDetail;
      final latestPostList = await GetIt.I<FetchUserPostUseCase>().execute(
        userId: vUserDetail.userId,
        sincePostId: vUserDetail.latestPostList.maxPostId,
      );
      ref.read(postMapNotifierProvider.notifier).putByList(latestPostList);
      return state.requireValue.copyWith(
        vUserDetail: vUserDetail.copyWith(
          latestPosts: vUserDetail.latestPostList.addAll(latestPostList).vPosts,
        ),
      );
    });
  }

  Future<bool> fetchPreviousForLatestPosts() async {
    var isNoMoreData = false;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final vUserDetail = state.requireValue.vUserDetail;
      final latestPostList = await GetIt.I<FetchUserPostUseCase>().execute(
        userId: vUserDetail.userId,
        maxPostId: vUserDetail.latestPostList.minPostId,
      );
      isNoMoreData = latestPostList.isEmpty;
      ref.read(postMapNotifierProvider.notifier).putByList(latestPostList);
      return state.requireValue.copyWith(
        vUserDetail: vUserDetail.copyWith(
          latestPosts: vUserDetail.latestPostList.addAll(latestPostList).vPosts,
        ),
      );
    });
    return isNoMoreData;
  }

  Future<void> fetchNextForFavoritePosts() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final vUserDetail = state.requireValue.vUserDetail;
      final favoritePostList = await GetIt.I<FetchUserPostFavoriteUseCase>().execute(
        userId: vUserDetail.userId,
        latestAt: vUserDetail.favoritePostList.latestPost.createdAt,
      );
      ref.read(postMapNotifierProvider.notifier).putByList(favoritePostList.vPostList);
      return state.requireValue.copyWith(
        vUserDetail: vUserDetail.copyWith(
          favoritePosts: vUserDetail.favoritePostList.addAll(favoritePostList.vPostList).vPosts,
        ),
      );
    });
  }

  Future<bool> fetchPreviousForFavoritePosts() async {
    var isNoMoreData = false;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final vUserDetail = state.requireValue.vUserDetail;
      final favoritePostList = await GetIt.I<FetchUserPostFavoriteUseCase>().execute(
        userId: vUserDetail.userId,
        oldestAt: vUserDetail.favoritePostList.oldestPost.createdAt,
      );
      isNoMoreData = favoritePostList.isEmpty;
      ref.read(postMapNotifierProvider.notifier).putByList(favoritePostList.vPostList);
      return state.requireValue.copyWith(
        vUserDetail: vUserDetail.copyWith(
          favoritePosts: vUserDetail.favoritePostList.addAll(favoritePostList.vPostList).vPosts,
        ),
      );
    });
    return isNoMoreData;
  }
}

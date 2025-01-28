import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/domain/models/suite_user.dart';
import 'package:gynx_app/src/domain/usecases/suite_user_usecase.dart';
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
}

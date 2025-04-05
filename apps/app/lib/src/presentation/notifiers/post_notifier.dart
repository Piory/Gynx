import 'package:app/src/domain/entities/v_post.dart';
import 'package:app/src/domain/usecases/favorite_post_usecase.dart';
import 'package:app/src/presentation/notifiers/post_map_notifier.dart';
import 'package:app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../generated/src/presentation/notifiers/post_notifier.g.dart';

@riverpod
class PostNotifier extends _$PostNotifier {
  @override
  VPost build(int postId) {
    return ref.watch(postMapNotifierProvider.select((value) => value[postId]!));
  }

  Future<void> toggleFavorite() async {
    try {
      final result = await GetIt.I<FavoritePostUseCase>().execute(
        postId: state.postId,
      );
      final after = result.vPost;
      final suiteUserNotifier = ref.read(suiteUserNotifierProvider.notifier);
      if (result.isDeleted) {
        suiteUserNotifier.removeFavoritePostByPostId(state.postId);
      } else {
        suiteUserNotifier.addFavoritePost(after);
      }
      ref.read(postMapNotifierProvider.notifier).put(after);
      state = after;
    } on Exception catch (_) {
      // do nothing
    }
  }
}

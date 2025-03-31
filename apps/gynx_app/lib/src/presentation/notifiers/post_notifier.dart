import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/domain/usecases/favorite_post_usecase.dart';
import 'package:gynx_app/src/presentation/notifiers/post_map_notifier.dart';
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
      final after = await GetIt.I<FavoritePostUseCase>().execute(
        postId: state.postId,
      );
      state = after;
      ref.read(postMapNotifierProvider.notifier).put(after);
    } on Exception catch (_) {
      // do nothing
    }
  }
}

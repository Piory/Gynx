import 'package:gynx_app/src/domain/entities/v_post.dart';

abstract interface class FavoritePostUseCase {
  Future<VPost> execute({
    required int postId,
  });
}

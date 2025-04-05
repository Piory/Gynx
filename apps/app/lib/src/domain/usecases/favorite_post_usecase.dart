import 'package:app/src/domain/entities/v_post.dart';

abstract interface class FavoritePostUseCase {
  Future<({VPost vPost, bool isDeleted})> execute({
    required int postId,
  });
}

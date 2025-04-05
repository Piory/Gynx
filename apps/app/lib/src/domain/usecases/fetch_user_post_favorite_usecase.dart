// ignore_for_file: one_member_abstracts

import 'package:app/src/domain/models/v_post_with_favorite_list.dart';

abstract interface class FetchUserPostFavoriteUseCase {
  Future<VPostWithFavoriteList> execute({
    required String userId,
    DateTime? latestAt,
    DateTime? oldestAt,
  });
}

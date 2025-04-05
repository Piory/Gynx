// ignore_for_file: one_member_abstracts

import 'package:app/src/domain/models/v_post_list.dart';

abstract interface class FetchUserPostUseCase {
  Future<VPostList> execute({
    required String userId,
    int? sincePostId,
    int? maxPostId,
  });
}

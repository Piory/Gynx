// ignore_for_file: one_member_abstracts

import 'package:gynx_app/src/domain/models/v_post_list.dart';

abstract interface class FetchPostUseCase {
  Future<VPostList> execute({
    int? sincePostId,
    int? maxPostId,
  });
}

// ignore_for_file: one_member_abstracts

import 'package:app/src/domain/entities/v_post.dart';
import 'package:app/src/domain/models/media_list.dart';

abstract interface class CreatePostUseCase {
  Future<VPost> execute({
    required String text,
    required MediaList mediaList,
  });
}

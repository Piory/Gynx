// ignore_for_file: one_member_abstracts

import 'package:gynx_app/src/domain/enums/timeline_type.dart';
import 'package:gynx_app/src/domain/models/media_list.dart';

abstract interface class PostRepository {
  Future<int> create(
    String userId,
    TimelineType timelineType,
    String text,
    MediaList mediaList,
  );
}

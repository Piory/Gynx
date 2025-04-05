// ignore_for_file: one_member_abstracts

import 'package:app/src/domain/enums/timeline_type.dart';
import 'package:app/src/domain/models/media_list.dart';

abstract interface class PostRepository {
  Future<int> create(
    TimelineType timelineType,
    String text,
    MediaList mediaList,
  );
}

import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/models/post_id_list.freezed.dart';

@freezed
class PostIdList with _$PostIdList {
  const PostIdList(this.postIds);

  static const empty = PostIdList([]);

  @override
  final List<int> postIds;

  int? get maxPostId {
    if (postIds.isEmpty) {
      return null;
    }
    return postIds.reduce(max);
  }

  int? get minPostId {
    if (postIds.isEmpty) {
      return null;
    }
    return postIds.reduce(min);
  }

  bool get isEmpty => postIds.isEmpty;

  int get length => postIds.length;

  int getByIndex(int index) {
    return postIds[index];
  }

  PostIdList add(int postId) {
    return PostIdList([...postIds, postId]);
  }

  PostIdList addAll(PostIdList vPostList) {
    return PostIdList([...postIds, ...vPostList.postIds]);
  }

  PostIdList sort({
    bool descending = false,
  }) {
    return PostIdList(
      List<int>.from(postIds)
        ..sort(
          (a, b) {
            if (descending) {
              return b.compareTo(a);
            }
            return a.compareTo(b);
          },
        ),
    );
  }
}

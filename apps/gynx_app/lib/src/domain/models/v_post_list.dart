import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/domain/models/post_id_list.dart';

part '../../generated/src/domain/models/v_post_list.freezed.dart';
part '../../generated/src/domain/models/v_post_list.g.dart';

@freezed
class VPostList with _$VPostList {
  const factory VPostList(List<VPost> vPosts) = _VPostList;

  const VPostList._();

  factory VPostList.fromJson(List<Map<String, dynamic>> json) =>
      VPostList(json.map(VPost.fromJson).toList());

  static const empty = VPostList([]);

  int? get maxPostId {
    if (vPosts.isEmpty) {
      return null;
    }
    return vPosts.map((vPost) => vPost.postId).reduce(max);
  }

  int? get minPostId {
    if (vPosts.isEmpty) {
      return null;
    }
    return vPosts.map((vPost) => vPost.postId).reduce(min);
  }

  bool get isEmpty => vPosts.isEmpty;

  int get length => vPosts.length;

  PostIdList get postIdList {
    if (vPosts.isEmpty) {
      return PostIdList.empty;
    }
    return PostIdList(
      vPosts.map((vPost) => vPost.postId).toList(),
    );
  }

  VPost getByIndex(int index) {
    return vPosts[index];
  }

  VPost getByPostId(int postId) {
    return vPosts.firstWhere((vPost) => vPost.postId == postId);
  }

  VPostList add(VPost vPost) {
    return VPostList([...vPosts, vPost]);
  }

  VPostList addAll(VPostList vPostList) {
    return VPostList([...vPosts, ...vPostList.vPosts]);
  }

  VPostList sortPostId({
    bool descending = false,
  }) {
    return VPostList(
      List<VPost>.from(vPosts)
        ..sort(
          (a, b) {
            if (descending) {
              return b.postId.compareTo(a.postId);
            }
            return a.postId.compareTo(b.postId);
          },
        ),
    );
  }
}

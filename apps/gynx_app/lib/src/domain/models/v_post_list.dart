import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/domain/models/post_id_list.dart';

part '../../generated/src/domain/models/v_post_list.freezed.dart';
part '../../generated/src/domain/models/v_post_list.g.dart';

@freezed
@JsonSerializable()
class VPostList with _$VPostList {
  const VPostList(this.vPosts);

  factory VPostList.fromJson(List<Map<String, dynamic>> json) => VPostList(json.map(VPost.fromJson).toList());

  static const empty = VPostList([]);

  @override
  final List<VPost> vPosts;

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

  VPost get latestPost {
    return sortPostId(descending: true).vPosts.first;
  }

  VPost get oldestPost {
    return sortPostId().vPosts.first;
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

  VPostList removeByPostId(int postId) {
    return VPostList(
      vPosts.where((vPost) => vPost.postId != postId).toList(),
    );
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

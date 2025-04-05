import 'package:app/src/domain/entities/v_post.dart';
import 'package:app/src/domain/models/v_post_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/models/v_post_map.freezed.dart';

@freezed
class VPostMap with _$VPostMap {
  const VPostMap(@protected this.map);

  factory VPostMap.byVPostList(VPostList vPostList) => VPostMap(
        Map.fromEntries(
          vPostList.vPosts.map((vPost) => MapEntry(vPost.postId, vPost)),
        ),
      );

  static const empty = VPostMap({});

  @override
  final Map<int, VPost> map;

  Map<int, VPost> get values => map;

  bool containsKey(int postId) => map.containsKey(postId);

  VPost getRequired(int postId) {
    final vPost = map[postId];
    if (vPost == null) {
      throw ArgumentError('postId not found: $postId');
    }
    return vPost;
  }
}

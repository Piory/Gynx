import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/domain/models/v_post_list.dart';

part '../../generated/src/domain/models/v_post_map.freezed.dart';

@freezed
class VPostMap with _$VPostMap {
  const factory VPostMap(@protected Map<int, VPost> map) = _VPostMap;

  const VPostMap._();

  factory VPostMap.byVPostList(VPostList vPostList) => VPostMap(
        Map.fromEntries(
          vPostList.vPosts.map((vPost) => MapEntry(vPost.postId, vPost)),
        ),
      );

  static const empty = VPostMap({});

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

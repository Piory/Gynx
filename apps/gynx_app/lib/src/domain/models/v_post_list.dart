import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/v_post.dart';

part '../../generated/src/domain/models/v_post_list.freezed.dart';
part '../../generated/src/domain/models/v_post_list.g.dart';

@freezed
class VPostList with _$VPostList {
  const factory VPostList(List<VPost> vPosts) = _VPostList;

  const VPostList._();

  factory VPostList.fromJson(List<Map<String, dynamic>> json) =>
      VPostList(json.map(VPost.fromJson).toList());

  static const empty = VPostList([]);
}

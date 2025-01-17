import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/t_post.dart';

part '../../generated/src/domain/models/t_post_list.freezed.dart';
part '../../generated/src/domain/models/t_post_list.g.dart';

@freezed
class TPostList with _$TPostList {
  const factory TPostList(List<TPost> tPosts) = _TPostList;

  const TPostList._();

  factory TPostList.fromJson(List<Map<String, dynamic>> json) =>
      _$TPostListFromJson({'tPosts': json});

  static const empty = TPostList([]);
}

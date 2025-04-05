import 'package:app/src/domain/entities/t_post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/models/t_post_list.freezed.dart';
part '../../generated/src/domain/models/t_post_list.g.dart';

@freezed
@JsonSerializable()
class TPostList with _$TPostList {
  const TPostList(this.tPosts);

  factory TPostList.fromJson(List<Map<String, dynamic>> json) => _$TPostListFromJson({'tPosts': json});

  static const empty = TPostList([]);

  @override
  final List<TPost> tPosts;
}

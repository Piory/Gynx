import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/t_post.dart';

part '../../generated/src/domain/models/t_post_list.freezed.dart';

@freezed
class TPostList with _$TPostList {
  const factory TPostList(List<TPost> tPosts) = _TPostList;

  factory TPostList.fromIterator(
    Iterator<Map<String, dynamic>> iterator,
  ) {
    final list = <TPost>[];
    while (iterator.moveNext()) {
      list.add(TPost.fromJson(iterator.current));
    }
    return TPostList(list);
  }

  const TPostList._();

  static const empty = TPostList([]);
}

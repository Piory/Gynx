import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/t_user_follow.dart';

part '../../generated/src/domain/models/t_user_follow_list.freezed.dart';

@freezed
class TUserFollowList with _$TUserFollowList {
  const factory TUserFollowList(List<TUserFollow> tUserFollows) =
      _TUserFollowList;

  factory TUserFollowList.fromIterator(
    Iterator<Map<String, dynamic>> iterator,
  ) {
    final list = <TUserFollow>[];
    while (iterator.moveNext()) {
      list.add(TUserFollow.fromJson(iterator.current));
    }
    return TUserFollowList(list);
  }

  const TUserFollowList._();

  static const empty = TUserFollowList([]);
}

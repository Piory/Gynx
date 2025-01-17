import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/t_user_follow.dart';

part '../../generated/src/domain/models/t_user_follow_list.freezed.dart';
part '../../generated/src/domain/models/t_user_follow_list.g.dart';

@freezed
class TUserFollowList with _$TUserFollowList {
  const factory TUserFollowList(List<TUserFollow> tUserFollows) =
      _TUserFollowList;

  const TUserFollowList._();

  factory TUserFollowList.fromJson(List<Map<String, dynamic>> json) =>
      _$TUserFollowListFromJson({'tUserFollows': json});

  static const empty = TUserFollowList([]);
}

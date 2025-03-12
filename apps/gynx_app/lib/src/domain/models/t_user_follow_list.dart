import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/t_user_follow.dart';

part '../../generated/src/domain/models/t_user_follow_list.freezed.dart';
part '../../generated/src/domain/models/t_user_follow_list.g.dart';

@freezed
@JsonSerializable()
class TUserFollowList with _$TUserFollowList {
  const TUserFollowList(this.tUserFollows);

  factory TUserFollowList.fromJson(List<Map<String, dynamic>> json) =>
      _$TUserFollowListFromJson({'tUserFollows': json});

  static const empty = TUserFollowList([]);

  @override
  final List<TUserFollow> tUserFollows;
}

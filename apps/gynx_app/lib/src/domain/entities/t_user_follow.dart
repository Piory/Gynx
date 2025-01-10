import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/entities/t_user_follow.freezed.dart';
part '../../generated/src/domain/entities/t_user_follow.g.dart';

@freezed
class TUserFollow with _$TUserFollow {
  const factory TUserFollow({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'follow_user_id') required String followUserId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'deleted_at') required DateTime? deletedAt,
  }) = _TUserFollow;

  const TUserFollow._();

  factory TUserFollow.fromJson(Map<String, dynamic> json) =>
      _$TUserFollowFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/entities/t_user_follow.freezed.dart';
part '../../generated/src/domain/entities/t_user_follow.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class TUserFollow with _$TUserFollow {
  const TUserFollow({
    required this.id,
    required this.userId,
    required this.followUserId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory TUserFollow.fromJson(Map<String, dynamic> json) =>
      _$TUserFollowFromJson(json);

  @override
  final int id;
  @override
  final String userId;
  @override
  final String followUserId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  Map<String, dynamic> toJson() => _$TUserFollowToJson(this);
}

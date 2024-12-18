import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/entities/t_user.freezed.dart';
part '../../generated/src/domain/entities/t_user.g.dart';

@freezed
class TUser with _$TUser {
  const factory TUser({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'gynx_id') required String gynxId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'deleted_at') required DateTime? deletedAt,
  }) = _TUser;

  const TUser._();

  factory TUser.fromJson(Map<String, dynamic> json) => _$TUserFromJson(json);
}

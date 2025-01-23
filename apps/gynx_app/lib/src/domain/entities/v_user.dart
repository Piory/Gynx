import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/entities/v_user.freezed.dart';
part '../../generated/src/domain/entities/v_user.g.dart';

@freezed
class VUser with _$VUser {
  const factory VUser({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'gynx_id') required String gynxId,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'avatar_url') required String? avatarUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _VUser;

  const VUser._();

  factory VUser.fromJson(Map<String, dynamic> json) => _$VUserFromJson(json);
}

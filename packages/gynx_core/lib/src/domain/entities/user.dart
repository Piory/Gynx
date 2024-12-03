import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/entities/user.freezed.dart';
part '../../generated/src/domain/entities/user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'auth_user_id') required String authUserId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'deleted_at') required DateTime? deletedAt,
  }) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

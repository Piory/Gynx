import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/entities/v_user.freezed.dart';
part '../../generated/src/domain/entities/v_user.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class VUser with _$VUser {
  const VUser({
    required this.userId,
    required this.gynxId,
    required this.username,
    required this.avatarUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VUser.fromJson(Map<String, dynamic> json) => _$VUserFromJson(json);

  @override
  final String userId;
  @override
  final String gynxId;
  @override
  final String username;
  @override
  final String? avatarUrl;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => _$VUserToJson(this);
}

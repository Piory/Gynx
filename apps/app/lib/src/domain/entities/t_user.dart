import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/entities/t_user.freezed.dart';
part '../../generated/src/domain/entities/t_user.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class TUser with _$TUser {
  const TUser({
    required this.id,
    required this.screenName,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory TUser.fromJson(Map<String, dynamic> json) => _$TUserFromJson(json);

  @override
  final String id;
  @override
  final String screenName;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  Map<String, dynamic> toJson() => _$TUserToJson(this);
}

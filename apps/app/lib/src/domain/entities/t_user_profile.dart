import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/entities/t_user_profile.freezed.dart';
part '../../generated/src/domain/entities/t_user_profile.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class TUserProfile with _$TUserProfile {
  const TUserProfile({
    required this.userId,
    required this.displayName,
    required this.avatarUrl,
    required this.selfIntroduction,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory TUserProfile.fromJson(Map<String, dynamic> json) => _$TUserProfileFromJson(json);

  @override
  final String userId;
  @override
  final String displayName;
  @override
  final String? avatarUrl;
  @override
  final String selfIntroduction;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  Map<String, dynamic> toJson() => _$TUserProfileToJson(this);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/entities/t_user_profile.freezed.dart';
part '../../generated/src/domain/entities/t_user_profile.g.dart';

@freezed
class TUserProfile with _$TUserProfile {
  const factory TUserProfile({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'avatar_url') required String? avatarUrl,
    @JsonKey(name: 'self_introduction') required String selfIntroduction,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'deleted_at') required DateTime? deletedAt,
  }) = _TUserProfile;

  const TUserProfile._();

  factory TUserProfile.fromJson(Map<String, dynamic> json) =>
      _$TUserProfileFromJson(json);
}

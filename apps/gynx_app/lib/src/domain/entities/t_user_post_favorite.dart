import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/entities/t_user_post_favorite.freezed.dart';
part '../../generated/src/domain/entities/t_user_post_favorite.g.dart';

@freezed
class TUserPostFavorite with _$TUserPostFavorite {
  const factory TUserPostFavorite({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'post_id') required int postId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'deleted_at') required DateTime? deletedAt,
  }) = _TUserPostFavorite;

  const TUserPostFavorite._();

  factory TUserPostFavorite.fromJson(Map<String, dynamic> json) =>
      _$TUserPostFavoriteFromJson(json);
}

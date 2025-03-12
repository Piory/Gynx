import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/entities/t_user_post_favorite.freezed.dart';
part '../../generated/src/domain/entities/t_user_post_favorite.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class TUserPostFavorite with _$TUserPostFavorite {
  const TUserPostFavorite({
    required this.id,
    required this.userId,
    required this.postId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory TUserPostFavorite.fromJson(Map<String, dynamic> json) =>
      _$TUserPostFavoriteFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final int postId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  Map<String, dynamic> toJson() => _$TUserPostFavoriteToJson(this);
}

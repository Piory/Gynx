import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/entities/t_post.freezed.dart';
part '../../generated/src/domain/entities/t_post.g.dart';

@freezed
class TPost with _$TPost {
  const factory TPost({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'text') required String text,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'deleted_at') required DateTime? deletedAt,
  }) = _TPost;

  const TPost._();

  factory TPost.fromJson(Map<String, dynamic> json) => _$TPostFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/entities/t_post.freezed.dart';
part '../../generated/src/domain/entities/t_post.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class TPost with _$TPost {
  const TPost({
    required this.id,
    required this.userId,
    required this.text,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory TPost.fromJson(Map<String, dynamic> json) => _$TPostFromJson(json);

  @override
  final int id;
  @override
  final String userId;
  @override
  final String text;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  Map<String, dynamic> toJson() => _$TPostToJson(this);
}

import 'package:app/src/domain/enums/media_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/entities/t_post_media.freezed.dart';
part '../../generated/src/domain/entities/t_post_media.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class TPostMedia with _$TPostMedia {
  const TPostMedia({
    required this.id,
    required this.postId,
    required this.displayOrder,
    required this.type,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory TPostMedia.fromJson(Map<String, dynamic> json) => _$TPostMediaFromJson(json);

  @override
  final String id;
  @override
  final int postId;
  @override
  final int displayOrder;
  @override
  final MediaType type;
  @override
  final String url;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  Map<String, dynamic> toJson() => _$TPostMediaToJson(this);
}

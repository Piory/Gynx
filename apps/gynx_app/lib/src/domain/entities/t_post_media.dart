import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/enums/media_type.dart';

part '../../generated/src/domain/entities/t_post_media.freezed.dart';
part '../../generated/src/domain/entities/t_post_media.g.dart';

@freezed
class TPostMedia with _$TPostMedia {
  const factory TPostMedia({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'post_id') required int postId,
    @JsonKey(name: 'display_order') required int displayOrder,
    @JsonKey(name: 'type') required MediaType type,
    @JsonKey(name: 'url') required String url,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'deleted_at') required DateTime? deletedAt,
  }) = _TPostMedia;

  const TPostMedia._();

  factory TPostMedia.fromJson(Map<String, dynamic> json) =>
      _$TPostMediaFromJson(json);
}

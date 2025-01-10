import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/enums/timeline_type.dart';

part '../../generated/src/domain/entities/t_user_timeline.freezed.dart';
part '../../generated/src/domain/entities/t_user_timeline.g.dart';

@freezed
class TUserTimeline with _$TUserTimeline {
  const factory TUserTimeline({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'type') required TimelineType type,
    @JsonKey(name: 'post_id') required int postId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'deleted_at') required DateTime? deletedAt,
  }) = _TUserTimeline;

  const TUserTimeline._();

  factory TUserTimeline.fromJson(Map<String, dynamic> json) =>
      _$TUserTimelineFromJson(json);
}

import 'package:app/src/domain/enums/timeline_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/entities/t_user_timeline.freezed.dart';
part '../../generated/src/domain/entities/t_user_timeline.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class TUserTimeline with _$TUserTimeline {
  const TUserTimeline({
    required this.id,
    required this.userId,
    required this.type,
    required this.postId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory TUserTimeline.fromJson(Map<String, dynamic> json) => _$TUserTimelineFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final TimelineType type;
  @override
  final int postId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  Map<String, dynamic> toJson() => _$TUserTimelineToJson(this);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/t_post_media.dart';
import 'package:gynx_app/src/domain/models/t_post_media_list.dart';

part '../../generated/src/domain/entities/v_post.freezed.dart';
part '../../generated/src/domain/entities/v_post.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class VPost with _$VPost {
  const VPost({
    required this.postId,
    required this.userId,
    required this.repost,
    required this.text,
    this.medias = const [],
    required this.repostCount,
    required this.favoriteCount,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory VPost.fromJson(Map<String, dynamic> json) => _$VPostFromJson(json);

  @override
  final int postId;
  @override
  final String userId;
  @override
  final VPost? repost;
  @override
  final String? text;
  @protected
  @override
  final List<TPostMedia> medias;
  @override
  final int repostCount;
  @override
  final int favoriteCount;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  TPostMediaList get tPostMediaList => TPostMediaList(medias);

  Map<String, dynamic> toJson() => _$VPostToJson(this);
}

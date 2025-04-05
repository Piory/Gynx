import 'package:app/src/domain/entities/t_post_media.dart';
import 'package:app/src/domain/enums/repost_type.dart';
import 'package:app/src/domain/models/t_post_media_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/entities/v_post.freezed.dart';
part '../../generated/src/domain/entities/v_post.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class VPost with _$VPost {
  const VPost({
    required this.postId,
    required this.userId,
    required this.originalPostId,
    required this.originalUserId,
    required this.repostType,
    required this.displayText,
    required this.displayMedias,
    required this.quoteText,
    required this.quoteMedias,
    required this.isReposted,
    required this.repostCount,
    required this.isFavorited,
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
  final int? originalPostId;
  @override
  final String? originalUserId;
  @override
  final RepostType repostType;
  @override
  final String? displayText;
  @protected
  @override
  final List<TPostMedia> displayMedias;
  @override
  final String? quoteText;
  @override
  final List<TPostMedia>? quoteMedias;
  @override
  final bool isReposted;
  @override
  final int repostCount;
  @override
  final bool isFavorited;
  @override
  final int favoriteCount;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  TPostMediaList get displayTPostMediaList => TPostMediaList(displayMedias);

  TPostMediaList? get quoteTPostMediaList => quoteMedias == null ? null : TPostMediaList(quoteMedias!);

  Map<String, dynamic> toJson() => _$VPostToJson(this);
}

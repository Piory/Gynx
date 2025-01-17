import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/t_post_media.dart';
import 'package:gynx_app/src/domain/models/t_post_media_list.dart';

part '../../generated/src/domain/entities/v_post.freezed.dart';
part '../../generated/src/domain/entities/v_post.g.dart';

@freezed
class VPost with _$VPost {
  const factory VPost({
    @JsonKey(name: 'post_id') required int postId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'repost') required VPost? repost,
    @JsonKey(name: 'text') required String? text,
    @JsonKey(name: 'medias') @protected required List<TPostMedia> medias,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    @JsonKey(name: 'self_introduction') required String selfIntroduction,
    @JsonKey(name: 'follow_count') required int followCount,
    @JsonKey(name: 'follower_count') required int followerCount,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'deleted_at') required DateTime? deletedAt,
  }) = _VPost;

  const VPost._();

  factory VPost.fromJson(Map<String, dynamic> json) => _$VPostFromJson(json);

  TPostMediaList get mediasList => TPostMediaList(medias);
}

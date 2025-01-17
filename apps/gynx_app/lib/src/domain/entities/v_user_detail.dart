import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/domain/models/v_post_list.dart';

part '../../generated/src/domain/entities/v_user_detail.freezed.dart';
part '../../generated/src/domain/entities/v_user_detail.g.dart';

@freezed
class VUserDetail with _$VUserDetail {
  const factory VUserDetail({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'gynx_id') required String gynxId,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'avatar_url') required String? avatarUrl,
    @JsonKey(name: 'self_introduction') required String selfIntroduction,
    @JsonKey(name: 'latest_posts') @protected required List<VPost> latestPosts,
    @JsonKey(name: 'follow_count') required int followCount,
    @JsonKey(name: 'follower_count') required int followerCount,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'deleted_at') required DateTime? deletedAt,
  }) = _VUserDetail;

  const VUserDetail._();

  factory VUserDetail.fromJson(Map<String, dynamic> json) =>
      _$VUserDetailFromJson(json);

  VPostList get latestPostsList => VPostList(latestPosts);
}

import 'package:app/src/domain/entities/v_post.dart';
import 'package:app/src/domain/models/v_post_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/entities/v_user_detail.freezed.dart';
part '../../generated/src/domain/entities/v_user_detail.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class VUserDetail with _$VUserDetail {
  const VUserDetail({
    required this.userId,
    required this.screenName,
    required this.displayName,
    required this.avatarUrl,
    required this.selfIntroduction,
    this.latestPosts = const [],
    this.favoritePosts = const [],
    required this.followCount,
    required this.followerCount,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory VUserDetail.fromJson(Map<String, dynamic> json) => _$VUserDetailFromJson(json);

  @override
  final String userId;
  @override
  final String screenName;
  @override
  final String displayName;
  @override
  final String? avatarUrl;
  @override
  final String selfIntroduction;
  @protected
  @override
  final List<VPost> latestPosts;
  @protected
  @override
  final List<VPost> favoritePosts;
  @override
  final int followCount;
  @override
  final int followerCount;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  VPostList get latestPostList => VPostList(latestPosts);

  VPostList get favoritePostList => VPostList(favoritePosts);

  Map<String, dynamic> toJson() => _$VUserDetailToJson(this);
}

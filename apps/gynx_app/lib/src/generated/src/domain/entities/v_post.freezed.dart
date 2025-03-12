// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/entities/v_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VPost {
  int get postId;
  String get userId;
  VPost? get repost;
  String? get text;
  List<TPostMedia> get medias;
  int get repostCount;
  int get favoriteCount;
  DateTime get createdAt;
  DateTime get updatedAt;
  DateTime? get deletedAt;

  /// Create a copy of VPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VPostCopyWith<VPost> get copyWith =>
      _$VPostCopyWithImpl<VPost>(this as VPost, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VPost &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.repost, repost) || other.repost == repost) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other.medias, medias) &&
            (identical(other.repostCount, repostCount) ||
                other.repostCount == repostCount) &&
            (identical(other.favoriteCount, favoriteCount) ||
                other.favoriteCount == favoriteCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      postId,
      userId,
      repost,
      text,
      const DeepCollectionEquality().hash(medias),
      repostCount,
      favoriteCount,
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'VPost(postId: $postId, userId: $userId, repost: $repost, text: $text, medias: $medias, repostCount: $repostCount, favoriteCount: $favoriteCount, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $VPostCopyWith<$Res> {
  factory $VPostCopyWith(VPost value, $Res Function(VPost) _then) =
      _$VPostCopyWithImpl;
  @useResult
  $Res call(
      {int postId,
      String userId,
      VPost? repost,
      String? text,
      List<TPostMedia> medias,
      int repostCount,
      int favoriteCount,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});
}

/// @nodoc
class _$VPostCopyWithImpl<$Res> implements $VPostCopyWith<$Res> {
  _$VPostCopyWithImpl(this._self, this._then);

  final VPost _self;
  final $Res Function(VPost) _then;

  /// Create a copy of VPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? userId = null,
    Object? repost = freezed,
    Object? text = freezed,
    Object? medias = null,
    Object? repostCount = null,
    Object? favoriteCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(VPost(
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      repost: freezed == repost
          ? _self.repost
          : repost // ignore: cast_nullable_to_non_nullable
              as VPost?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      medias: null == medias
          ? _self.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<TPostMedia>,
      repostCount: null == repostCount
          ? _self.repostCount
          : repostCount // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteCount: null == favoriteCount
          ? _self.favoriteCount
          : favoriteCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on

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
  int? get originalPostId;
  String? get originalUserId;
  RepostType get repostType;
  String? get displayText;
  List<TPostMedia> get displayMedias;
  String? get quoteText;
  List<TPostMedia>? get quoteMedias;
  bool get isReposted;
  int get repostCount;
  bool get isFavorited;
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
            (identical(other.originalPostId, originalPostId) ||
                other.originalPostId == originalPostId) &&
            (identical(other.originalUserId, originalUserId) ||
                other.originalUserId == originalUserId) &&
            (identical(other.repostType, repostType) ||
                other.repostType == repostType) &&
            (identical(other.displayText, displayText) ||
                other.displayText == displayText) &&
            const DeepCollectionEquality()
                .equals(other.displayMedias, displayMedias) &&
            (identical(other.quoteText, quoteText) ||
                other.quoteText == quoteText) &&
            const DeepCollectionEquality()
                .equals(other.quoteMedias, quoteMedias) &&
            (identical(other.isReposted, isReposted) ||
                other.isReposted == isReposted) &&
            (identical(other.repostCount, repostCount) ||
                other.repostCount == repostCount) &&
            (identical(other.isFavorited, isFavorited) ||
                other.isFavorited == isFavorited) &&
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
      originalPostId,
      originalUserId,
      repostType,
      displayText,
      const DeepCollectionEquality().hash(displayMedias),
      quoteText,
      const DeepCollectionEquality().hash(quoteMedias),
      isReposted,
      repostCount,
      isFavorited,
      favoriteCount,
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'VPost(postId: $postId, userId: $userId, originalPostId: $originalPostId, originalUserId: $originalUserId, repostType: $repostType, displayText: $displayText, displayMedias: $displayMedias, quoteText: $quoteText, quoteMedias: $quoteMedias, isReposted: $isReposted, repostCount: $repostCount, isFavorited: $isFavorited, favoriteCount: $favoriteCount, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
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
      int? originalPostId,
      String? originalUserId,
      RepostType repostType,
      String? displayText,
      List<TPostMedia> displayMedias,
      String? quoteText,
      List<TPostMedia>? quoteMedias,
      bool isReposted,
      int repostCount,
      bool isFavorited,
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
    Object? originalPostId = freezed,
    Object? originalUserId = freezed,
    Object? repostType = null,
    Object? displayText = freezed,
    Object? displayMedias = null,
    Object? quoteText = freezed,
    Object? quoteMedias = freezed,
    Object? isReposted = null,
    Object? repostCount = null,
    Object? isFavorited = null,
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
      originalPostId: freezed == originalPostId
          ? _self.originalPostId
          : originalPostId // ignore: cast_nullable_to_non_nullable
              as int?,
      originalUserId: freezed == originalUserId
          ? _self.originalUserId
          : originalUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      repostType: null == repostType
          ? _self.repostType
          : repostType // ignore: cast_nullable_to_non_nullable
              as RepostType,
      displayText: freezed == displayText
          ? _self.displayText
          : displayText // ignore: cast_nullable_to_non_nullable
              as String?,
      displayMedias: null == displayMedias
          ? _self.displayMedias
          : displayMedias // ignore: cast_nullable_to_non_nullable
              as List<TPostMedia>,
      quoteText: freezed == quoteText
          ? _self.quoteText
          : quoteText // ignore: cast_nullable_to_non_nullable
              as String?,
      quoteMedias: freezed == quoteMedias
          ? _self.quoteMedias
          : quoteMedias // ignore: cast_nullable_to_non_nullable
              as List<TPostMedia>?,
      isReposted: null == isReposted
          ? _self.isReposted
          : isReposted // ignore: cast_nullable_to_non_nullable
              as bool,
      repostCount: null == repostCount
          ? _self.repostCount
          : repostCount // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorited: null == isFavorited
          ? _self.isFavorited
          : isFavorited // ignore: cast_nullable_to_non_nullable
              as bool,
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

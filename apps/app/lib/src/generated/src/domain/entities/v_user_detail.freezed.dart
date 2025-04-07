// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/entities/v_user_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VUserDetail {
  String get userId;
  String get screenName;
  String get displayName;
  String? get avatarUrl;
  String get selfIntroduction;
  List<VPost> get latestPosts;
  List<VPost> get favoritePosts;
  int get followCount;
  int get followerCount;
  DateTime get createdAt;
  DateTime get updatedAt;
  DateTime? get deletedAt;

  /// Create a copy of VUserDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VUserDetailCopyWith<VUserDetail> get copyWith =>
      _$VUserDetailCopyWithImpl<VUserDetail>(this as VUserDetail, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VUserDetail &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.screenName, screenName) ||
                other.screenName == screenName) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.selfIntroduction, selfIntroduction) ||
                other.selfIntroduction == selfIntroduction) &&
            const DeepCollectionEquality()
                .equals(other.latestPosts, latestPosts) &&
            const DeepCollectionEquality()
                .equals(other.favoritePosts, favoritePosts) &&
            (identical(other.followCount, followCount) ||
                other.followCount == followCount) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
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
      userId,
      screenName,
      displayName,
      avatarUrl,
      selfIntroduction,
      const DeepCollectionEquality().hash(latestPosts),
      const DeepCollectionEquality().hash(favoritePosts),
      followCount,
      followerCount,
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'VUserDetail(userId: $userId, screenName: $screenName, displayName: $displayName, avatarUrl: $avatarUrl, selfIntroduction: $selfIntroduction, latestPosts: $latestPosts, favoritePosts: $favoritePosts, followCount: $followCount, followerCount: $followerCount, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $VUserDetailCopyWith<$Res> {
  factory $VUserDetailCopyWith(
          VUserDetail value, $Res Function(VUserDetail) _then) =
      _$VUserDetailCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      String screenName,
      String displayName,
      String? avatarUrl,
      String selfIntroduction,
      List<VPost> latestPosts,
      List<VPost> favoritePosts,
      int followCount,
      int followerCount,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});
}

/// @nodoc
class _$VUserDetailCopyWithImpl<$Res> implements $VUserDetailCopyWith<$Res> {
  _$VUserDetailCopyWithImpl(this._self, this._then);

  final VUserDetail _self;
  final $Res Function(VUserDetail) _then;

  /// Create a copy of VUserDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? screenName = null,
    Object? displayName = null,
    Object? avatarUrl = freezed,
    Object? selfIntroduction = null,
    Object? latestPosts = null,
    Object? favoritePosts = null,
    Object? followCount = null,
    Object? followerCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(VUserDetail(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      screenName: null == screenName
          ? _self.screenName
          : screenName // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      selfIntroduction: null == selfIntroduction
          ? _self.selfIntroduction
          : selfIntroduction // ignore: cast_nullable_to_non_nullable
              as String,
      latestPosts: null == latestPosts
          ? _self.latestPosts
          : latestPosts // ignore: cast_nullable_to_non_nullable
              as List<VPost>,
      favoritePosts: null == favoritePosts
          ? _self.favoritePosts
          : favoritePosts // ignore: cast_nullable_to_non_nullable
              as List<VPost>,
      followCount: null == followCount
          ? _self.followCount
          : followCount // ignore: cast_nullable_to_non_nullable
              as int,
      followerCount: null == followerCount
          ? _self.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
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

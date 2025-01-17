// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/entities/v_user_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VUserDetail _$VUserDetailFromJson(Map<String, dynamic> json) {
  return _VUserDetail.fromJson(json);
}

/// @nodoc
mixin _$VUserDetail {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'gynx_id')
  String get gynxId => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'self_introduction')
  String get selfIntroduction => throw _privateConstructorUsedError;
  @JsonKey(name: 'latest_posts')
  @protected
  List<VPost> get latestPosts => throw _privateConstructorUsedError;
  @JsonKey(name: 'follow_count')
  int get followCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'follower_count')
  int get followerCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this VUserDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VUserDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VUserDetailCopyWith<VUserDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VUserDetailCopyWith<$Res> {
  factory $VUserDetailCopyWith(
          VUserDetail value, $Res Function(VUserDetail) then) =
      _$VUserDetailCopyWithImpl<$Res, VUserDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'gynx_id') String gynxId,
      @JsonKey(name: 'username') String username,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'self_introduction') String selfIntroduction,
      @JsonKey(name: 'latest_posts') @protected List<VPost> latestPosts,
      @JsonKey(name: 'follow_count') int followCount,
      @JsonKey(name: 'follower_count') int followerCount,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt});
}

/// @nodoc
class _$VUserDetailCopyWithImpl<$Res, $Val extends VUserDetail>
    implements $VUserDetailCopyWith<$Res> {
  _$VUserDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VUserDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? gynxId = null,
    Object? username = null,
    Object? avatarUrl = freezed,
    Object? selfIntroduction = null,
    Object? latestPosts = null,
    Object? followCount = null,
    Object? followerCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      gynxId: null == gynxId
          ? _value.gynxId
          : gynxId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      selfIntroduction: null == selfIntroduction
          ? _value.selfIntroduction
          : selfIntroduction // ignore: cast_nullable_to_non_nullable
              as String,
      latestPosts: null == latestPosts
          ? _value.latestPosts
          : latestPosts // ignore: cast_nullable_to_non_nullable
              as List<VPost>,
      followCount: null == followCount
          ? _value.followCount
          : followCount // ignore: cast_nullable_to_non_nullable
              as int,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VUserDetailImplCopyWith<$Res>
    implements $VUserDetailCopyWith<$Res> {
  factory _$$VUserDetailImplCopyWith(
          _$VUserDetailImpl value, $Res Function(_$VUserDetailImpl) then) =
      __$$VUserDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'gynx_id') String gynxId,
      @JsonKey(name: 'username') String username,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'self_introduction') String selfIntroduction,
      @JsonKey(name: 'latest_posts') @protected List<VPost> latestPosts,
      @JsonKey(name: 'follow_count') int followCount,
      @JsonKey(name: 'follower_count') int followerCount,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt});
}

/// @nodoc
class __$$VUserDetailImplCopyWithImpl<$Res>
    extends _$VUserDetailCopyWithImpl<$Res, _$VUserDetailImpl>
    implements _$$VUserDetailImplCopyWith<$Res> {
  __$$VUserDetailImplCopyWithImpl(
      _$VUserDetailImpl _value, $Res Function(_$VUserDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of VUserDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? gynxId = null,
    Object? username = null,
    Object? avatarUrl = freezed,
    Object? selfIntroduction = null,
    Object? latestPosts = null,
    Object? followCount = null,
    Object? followerCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$VUserDetailImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      gynxId: null == gynxId
          ? _value.gynxId
          : gynxId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      selfIntroduction: null == selfIntroduction
          ? _value.selfIntroduction
          : selfIntroduction // ignore: cast_nullable_to_non_nullable
              as String,
      latestPosts: null == latestPosts
          ? _value._latestPosts
          : latestPosts // ignore: cast_nullable_to_non_nullable
              as List<VPost>,
      followCount: null == followCount
          ? _value.followCount
          : followCount // ignore: cast_nullable_to_non_nullable
              as int,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VUserDetailImpl extends _VUserDetail {
  const _$VUserDetailImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'gynx_id') required this.gynxId,
      @JsonKey(name: 'username') required this.username,
      @JsonKey(name: 'avatar_url') required this.avatarUrl,
      @JsonKey(name: 'self_introduction') required this.selfIntroduction,
      @JsonKey(name: 'latest_posts')
      @protected
      required final List<VPost> latestPosts,
      @JsonKey(name: 'follow_count') required this.followCount,
      @JsonKey(name: 'follower_count') required this.followerCount,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'deleted_at') required this.deletedAt})
      : _latestPosts = latestPosts,
        super._();

  factory _$VUserDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$VUserDetailImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'gynx_id')
  final String gynxId;
  @override
  @JsonKey(name: 'username')
  final String username;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'self_introduction')
  final String selfIntroduction;
  final List<VPost> _latestPosts;
  @override
  @JsonKey(name: 'latest_posts')
  @protected
  List<VPost> get latestPosts {
    if (_latestPosts is EqualUnmodifiableListView) return _latestPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_latestPosts);
  }

  @override
  @JsonKey(name: 'follow_count')
  final int followCount;
  @override
  @JsonKey(name: 'follower_count')
  final int followerCount;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'VUserDetail(userId: $userId, gynxId: $gynxId, username: $username, avatarUrl: $avatarUrl, selfIntroduction: $selfIntroduction, latestPosts: $latestPosts, followCount: $followCount, followerCount: $followerCount, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VUserDetailImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.gynxId, gynxId) || other.gynxId == gynxId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.selfIntroduction, selfIntroduction) ||
                other.selfIntroduction == selfIntroduction) &&
            const DeepCollectionEquality()
                .equals(other._latestPosts, _latestPosts) &&
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
      gynxId,
      username,
      avatarUrl,
      selfIntroduction,
      const DeepCollectionEquality().hash(_latestPosts),
      followCount,
      followerCount,
      createdAt,
      updatedAt,
      deletedAt);

  /// Create a copy of VUserDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VUserDetailImplCopyWith<_$VUserDetailImpl> get copyWith =>
      __$$VUserDetailImplCopyWithImpl<_$VUserDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VUserDetailImplToJson(
      this,
    );
  }
}

abstract class _VUserDetail extends VUserDetail {
  const factory _VUserDetail(
          {@JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'gynx_id') required final String gynxId,
          @JsonKey(name: 'username') required final String username,
          @JsonKey(name: 'avatar_url') required final String? avatarUrl,
          @JsonKey(name: 'self_introduction')
          required final String selfIntroduction,
          @JsonKey(name: 'latest_posts')
          @protected
          required final List<VPost> latestPosts,
          @JsonKey(name: 'follow_count') required final int followCount,
          @JsonKey(name: 'follower_count') required final int followerCount,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt,
          @JsonKey(name: 'deleted_at') required final DateTime? deletedAt}) =
      _$VUserDetailImpl;
  const _VUserDetail._() : super._();

  factory _VUserDetail.fromJson(Map<String, dynamic> json) =
      _$VUserDetailImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'gynx_id')
  String get gynxId;
  @override
  @JsonKey(name: 'username')
  String get username;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'self_introduction')
  String get selfIntroduction;
  @override
  @JsonKey(name: 'latest_posts')
  @protected
  List<VPost> get latestPosts;
  @override
  @JsonKey(name: 'follow_count')
  int get followCount;
  @override
  @JsonKey(name: 'follower_count')
  int get followerCount;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt;

  /// Create a copy of VUserDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VUserDetailImplCopyWith<_$VUserDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

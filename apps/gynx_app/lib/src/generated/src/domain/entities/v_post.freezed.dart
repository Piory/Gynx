// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/entities/v_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VPost _$VPostFromJson(Map<String, dynamic> json) {
  return _VPost.fromJson(json);
}

/// @nodoc
mixin _$VPost {
  @JsonKey(name: 'post_id')
  int get postId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'repost')
  VPost? get repost => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'medias')
  @protected
  List<TPostMedia> get medias => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'self_introduction')
  String get selfIntroduction => throw _privateConstructorUsedError;
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

  /// Serializes this VPost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VPostCopyWith<VPost> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VPostCopyWith<$Res> {
  factory $VPostCopyWith(VPost value, $Res Function(VPost) then) =
      _$VPostCopyWithImpl<$Res, VPost>;
  @useResult
  $Res call(
      {@JsonKey(name: 'post_id') int postId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'repost') VPost? repost,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'medias') @protected List<TPostMedia> medias,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      @JsonKey(name: 'self_introduction') String selfIntroduction,
      @JsonKey(name: 'follow_count') int followCount,
      @JsonKey(name: 'follower_count') int followerCount,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt});

  $VPostCopyWith<$Res>? get repost;
}

/// @nodoc
class _$VPostCopyWithImpl<$Res, $Val extends VPost>
    implements $VPostCopyWith<$Res> {
  _$VPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    Object? avatarUrl = null,
    Object? selfIntroduction = null,
    Object? followCount = null,
    Object? followerCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      repost: freezed == repost
          ? _value.repost
          : repost // ignore: cast_nullable_to_non_nullable
              as VPost?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      medias: null == medias
          ? _value.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<TPostMedia>,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      selfIntroduction: null == selfIntroduction
          ? _value.selfIntroduction
          : selfIntroduction // ignore: cast_nullable_to_non_nullable
              as String,
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

  /// Create a copy of VPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VPostCopyWith<$Res>? get repost {
    if (_value.repost == null) {
      return null;
    }

    return $VPostCopyWith<$Res>(_value.repost!, (value) {
      return _then(_value.copyWith(repost: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VPostImplCopyWith<$Res> implements $VPostCopyWith<$Res> {
  factory _$$VPostImplCopyWith(
          _$VPostImpl value, $Res Function(_$VPostImpl) then) =
      __$$VPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'post_id') int postId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'repost') VPost? repost,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'medias') @protected List<TPostMedia> medias,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      @JsonKey(name: 'self_introduction') String selfIntroduction,
      @JsonKey(name: 'follow_count') int followCount,
      @JsonKey(name: 'follower_count') int followerCount,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt});

  @override
  $VPostCopyWith<$Res>? get repost;
}

/// @nodoc
class __$$VPostImplCopyWithImpl<$Res>
    extends _$VPostCopyWithImpl<$Res, _$VPostImpl>
    implements _$$VPostImplCopyWith<$Res> {
  __$$VPostImplCopyWithImpl(
      _$VPostImpl _value, $Res Function(_$VPostImpl) _then)
      : super(_value, _then);

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
    Object? avatarUrl = null,
    Object? selfIntroduction = null,
    Object? followCount = null,
    Object? followerCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$VPostImpl(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      repost: freezed == repost
          ? _value.repost
          : repost // ignore: cast_nullable_to_non_nullable
              as VPost?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      medias: null == medias
          ? _value._medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<TPostMedia>,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      selfIntroduction: null == selfIntroduction
          ? _value.selfIntroduction
          : selfIntroduction // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$VPostImpl extends _VPost {
  const _$VPostImpl(
      {@JsonKey(name: 'post_id') required this.postId,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'repost') required this.repost,
      @JsonKey(name: 'text') required this.text,
      @JsonKey(name: 'medias')
      @protected
      required final List<TPostMedia> medias,
      @JsonKey(name: 'avatar_url') required this.avatarUrl,
      @JsonKey(name: 'self_introduction') required this.selfIntroduction,
      @JsonKey(name: 'follow_count') required this.followCount,
      @JsonKey(name: 'follower_count') required this.followerCount,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'deleted_at') required this.deletedAt})
      : _medias = medias,
        super._();

  factory _$VPostImpl.fromJson(Map<String, dynamic> json) =>
      _$$VPostImplFromJson(json);

  @override
  @JsonKey(name: 'post_id')
  final int postId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'repost')
  final VPost? repost;
  @override
  @JsonKey(name: 'text')
  final String? text;
  final List<TPostMedia> _medias;
  @override
  @JsonKey(name: 'medias')
  @protected
  List<TPostMedia> get medias {
    if (_medias is EqualUnmodifiableListView) return _medias;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medias);
  }

  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @override
  @JsonKey(name: 'self_introduction')
  final String selfIntroduction;
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
    return 'VPost(postId: $postId, userId: $userId, repost: $repost, text: $text, medias: $medias, avatarUrl: $avatarUrl, selfIntroduction: $selfIntroduction, followCount: $followCount, followerCount: $followerCount, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VPostImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.repost, repost) || other.repost == repost) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._medias, _medias) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.selfIntroduction, selfIntroduction) ||
                other.selfIntroduction == selfIntroduction) &&
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
      postId,
      userId,
      repost,
      text,
      const DeepCollectionEquality().hash(_medias),
      avatarUrl,
      selfIntroduction,
      followCount,
      followerCount,
      createdAt,
      updatedAt,
      deletedAt);

  /// Create a copy of VPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VPostImplCopyWith<_$VPostImpl> get copyWith =>
      __$$VPostImplCopyWithImpl<_$VPostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VPostImplToJson(
      this,
    );
  }
}

abstract class _VPost extends VPost {
  const factory _VPost(
          {@JsonKey(name: 'post_id') required final int postId,
          @JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'repost') required final VPost? repost,
          @JsonKey(name: 'text') required final String? text,
          @JsonKey(name: 'medias')
          @protected
          required final List<TPostMedia> medias,
          @JsonKey(name: 'avatar_url') required final String avatarUrl,
          @JsonKey(name: 'self_introduction')
          required final String selfIntroduction,
          @JsonKey(name: 'follow_count') required final int followCount,
          @JsonKey(name: 'follower_count') required final int followerCount,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt,
          @JsonKey(name: 'deleted_at') required final DateTime? deletedAt}) =
      _$VPostImpl;
  const _VPost._() : super._();

  factory _VPost.fromJson(Map<String, dynamic> json) = _$VPostImpl.fromJson;

  @override
  @JsonKey(name: 'post_id')
  int get postId;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'repost')
  VPost? get repost;
  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(name: 'medias')
  @protected
  List<TPostMedia> get medias;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;
  @override
  @JsonKey(name: 'self_introduction')
  String get selfIntroduction;
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

  /// Create a copy of VPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VPostImplCopyWith<_$VPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/entities/t_user_follow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TUserFollow {
  int get id;
  String get userId;
  String get followUserId;
  DateTime get createdAt;
  DateTime get updatedAt;
  DateTime? get deletedAt;

  /// Create a copy of TUserFollow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TUserFollowCopyWith<TUserFollow> get copyWith =>
      _$TUserFollowCopyWithImpl<TUserFollow>(this as TUserFollow, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TUserFollow &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.followUserId, followUserId) ||
                other.followUserId == followUserId) &&
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
      runtimeType, id, userId, followUserId, createdAt, updatedAt, deletedAt);

  @override
  String toString() {
    return 'TUserFollow(id: $id, userId: $userId, followUserId: $followUserId, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $TUserFollowCopyWith<$Res> {
  factory $TUserFollowCopyWith(
          TUserFollow value, $Res Function(TUserFollow) _then) =
      _$TUserFollowCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String userId,
      String followUserId,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});
}

/// @nodoc
class _$TUserFollowCopyWithImpl<$Res> implements $TUserFollowCopyWith<$Res> {
  _$TUserFollowCopyWithImpl(this._self, this._then);

  final TUserFollow _self;
  final $Res Function(TUserFollow) _then;

  /// Create a copy of TUserFollow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? followUserId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(TUserFollow(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      followUserId: null == followUserId
          ? _self.followUserId
          : followUserId // ignore: cast_nullable_to_non_nullable
              as String,
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

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/entities/v_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VUser {
  String get userId;
  String get gynxId;
  String get username;
  String? get avatarUrl;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of VUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VUserCopyWith<VUser> get copyWith =>
      _$VUserCopyWithImpl<VUser>(this as VUser, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VUser &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.gynxId, gynxId) || other.gynxId == gynxId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, gynxId, username, avatarUrl, createdAt, updatedAt);

  @override
  String toString() {
    return 'VUser(userId: $userId, gynxId: $gynxId, username: $username, avatarUrl: $avatarUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $VUserCopyWith<$Res> {
  factory $VUserCopyWith(VUser value, $Res Function(VUser) _then) =
      _$VUserCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      String gynxId,
      String username,
      String? avatarUrl,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$VUserCopyWithImpl<$Res> implements $VUserCopyWith<$Res> {
  _$VUserCopyWithImpl(this._self, this._then);

  final VUser _self;
  final $Res Function(VUser) _then;

  /// Create a copy of VUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? gynxId = null,
    Object? username = null,
    Object? avatarUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(VUser(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      gynxId: null == gynxId
          ? _self.gynxId
          : gynxId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/suite_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SuiteUser {
  TUser get tUser => throw _privateConstructorUsedError;
  TUserProfile get tUserProfile => throw _privateConstructorUsedError;

  /// Create a copy of SuiteUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuiteUserCopyWith<SuiteUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuiteUserCopyWith<$Res> {
  factory $SuiteUserCopyWith(SuiteUser value, $Res Function(SuiteUser) then) =
      _$SuiteUserCopyWithImpl<$Res, SuiteUser>;
  @useResult
  $Res call({TUser tUser, TUserProfile tUserProfile});

  $TUserCopyWith<$Res> get tUser;
  $TUserProfileCopyWith<$Res> get tUserProfile;
}

/// @nodoc
class _$SuiteUserCopyWithImpl<$Res, $Val extends SuiteUser>
    implements $SuiteUserCopyWith<$Res> {
  _$SuiteUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SuiteUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tUser = null,
    Object? tUserProfile = null,
  }) {
    return _then(_value.copyWith(
      tUser: null == tUser
          ? _value.tUser
          : tUser // ignore: cast_nullable_to_non_nullable
              as TUser,
      tUserProfile: null == tUserProfile
          ? _value.tUserProfile
          : tUserProfile // ignore: cast_nullable_to_non_nullable
              as TUserProfile,
    ) as $Val);
  }

  /// Create a copy of SuiteUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TUserCopyWith<$Res> get tUser {
    return $TUserCopyWith<$Res>(_value.tUser, (value) {
      return _then(_value.copyWith(tUser: value) as $Val);
    });
  }

  /// Create a copy of SuiteUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TUserProfileCopyWith<$Res> get tUserProfile {
    return $TUserProfileCopyWith<$Res>(_value.tUserProfile, (value) {
      return _then(_value.copyWith(tUserProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SuiteUserImplCopyWith<$Res>
    implements $SuiteUserCopyWith<$Res> {
  factory _$$SuiteUserImplCopyWith(
          _$SuiteUserImpl value, $Res Function(_$SuiteUserImpl) then) =
      __$$SuiteUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TUser tUser, TUserProfile tUserProfile});

  @override
  $TUserCopyWith<$Res> get tUser;
  @override
  $TUserProfileCopyWith<$Res> get tUserProfile;
}

/// @nodoc
class __$$SuiteUserImplCopyWithImpl<$Res>
    extends _$SuiteUserCopyWithImpl<$Res, _$SuiteUserImpl>
    implements _$$SuiteUserImplCopyWith<$Res> {
  __$$SuiteUserImplCopyWithImpl(
      _$SuiteUserImpl _value, $Res Function(_$SuiteUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of SuiteUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tUser = null,
    Object? tUserProfile = null,
  }) {
    return _then(_$SuiteUserImpl(
      tUser: null == tUser
          ? _value.tUser
          : tUser // ignore: cast_nullable_to_non_nullable
              as TUser,
      tUserProfile: null == tUserProfile
          ? _value.tUserProfile
          : tUserProfile // ignore: cast_nullable_to_non_nullable
              as TUserProfile,
    ));
  }
}

/// @nodoc

class _$SuiteUserImpl extends _SuiteUser {
  const _$SuiteUserImpl({required this.tUser, required this.tUserProfile})
      : super._();

  @override
  final TUser tUser;
  @override
  final TUserProfile tUserProfile;

  @override
  String toString() {
    return 'SuiteUser(tUser: $tUser, tUserProfile: $tUserProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuiteUserImpl &&
            (identical(other.tUser, tUser) || other.tUser == tUser) &&
            (identical(other.tUserProfile, tUserProfile) ||
                other.tUserProfile == tUserProfile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tUser, tUserProfile);

  /// Create a copy of SuiteUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuiteUserImplCopyWith<_$SuiteUserImpl> get copyWith =>
      __$$SuiteUserImplCopyWithImpl<_$SuiteUserImpl>(this, _$identity);
}

abstract class _SuiteUser extends SuiteUser {
  const factory _SuiteUser(
      {required final TUser tUser,
      required final TUserProfile tUserProfile}) = _$SuiteUserImpl;
  const _SuiteUser._() : super._();

  @override
  TUser get tUser;
  @override
  TUserProfile get tUserProfile;

  /// Create a copy of SuiteUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuiteUserImplCopyWith<_$SuiteUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

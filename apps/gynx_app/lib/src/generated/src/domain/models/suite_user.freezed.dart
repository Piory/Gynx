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
  VUserDetail get vUserDetail => throw _privateConstructorUsedError;

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
  $Res call({VUserDetail vUserDetail});

  $VUserDetailCopyWith<$Res> get vUserDetail;
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
    Object? vUserDetail = null,
  }) {
    return _then(_value.copyWith(
      vUserDetail: null == vUserDetail
          ? _value.vUserDetail
          : vUserDetail // ignore: cast_nullable_to_non_nullable
              as VUserDetail,
    ) as $Val);
  }

  /// Create a copy of SuiteUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VUserDetailCopyWith<$Res> get vUserDetail {
    return $VUserDetailCopyWith<$Res>(_value.vUserDetail, (value) {
      return _then(_value.copyWith(vUserDetail: value) as $Val);
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
  $Res call({VUserDetail vUserDetail});

  @override
  $VUserDetailCopyWith<$Res> get vUserDetail;
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
    Object? vUserDetail = null,
  }) {
    return _then(_$SuiteUserImpl(
      vUserDetail: null == vUserDetail
          ? _value.vUserDetail
          : vUserDetail // ignore: cast_nullable_to_non_nullable
              as VUserDetail,
    ));
  }
}

/// @nodoc

class _$SuiteUserImpl extends _SuiteUser {
  const _$SuiteUserImpl({required this.vUserDetail}) : super._();

  @override
  final VUserDetail vUserDetail;

  @override
  String toString() {
    return 'SuiteUser(vUserDetail: $vUserDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuiteUserImpl &&
            (identical(other.vUserDetail, vUserDetail) ||
                other.vUserDetail == vUserDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vUserDetail);

  /// Create a copy of SuiteUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuiteUserImplCopyWith<_$SuiteUserImpl> get copyWith =>
      __$$SuiteUserImplCopyWithImpl<_$SuiteUserImpl>(this, _$identity);
}

abstract class _SuiteUser extends SuiteUser {
  const factory _SuiteUser({required final VUserDetail vUserDetail}) =
      _$SuiteUserImpl;
  const _SuiteUser._() : super._();

  @override
  VUserDetail get vUserDetail;

  /// Create a copy of SuiteUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuiteUserImplCopyWith<_$SuiteUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

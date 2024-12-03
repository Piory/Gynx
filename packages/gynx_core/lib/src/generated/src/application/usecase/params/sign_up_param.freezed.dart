// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../../application/usecase/params/sign_up_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpParam {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Create a copy of SignUpParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpParamCopyWith<SignUpParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpParamCopyWith<$Res> {
  factory $SignUpParamCopyWith(
          SignUpParam value, $Res Function(SignUpParam) then) =
      _$SignUpParamCopyWithImpl<$Res, SignUpParam>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$SignUpParamCopyWithImpl<$Res, $Val extends SignUpParam>
    implements $SignUpParamCopyWith<$Res> {
  _$SignUpParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpParamImplCopyWith<$Res>
    implements $SignUpParamCopyWith<$Res> {
  factory _$$SignUpParamImplCopyWith(
          _$SignUpParamImpl value, $Res Function(_$SignUpParamImpl) then) =
      __$$SignUpParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignUpParamImplCopyWithImpl<$Res>
    extends _$SignUpParamCopyWithImpl<$Res, _$SignUpParamImpl>
    implements _$$SignUpParamImplCopyWith<$Res> {
  __$$SignUpParamImplCopyWithImpl(
      _$SignUpParamImpl _value, $Res Function(_$SignUpParamImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignUpParamImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpParamImpl implements _SignUpParam {
  const _$SignUpParamImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpParam(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpParamImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of SignUpParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpParamImplCopyWith<_$SignUpParamImpl> get copyWith =>
      __$$SignUpParamImplCopyWithImpl<_$SignUpParamImpl>(this, _$identity);
}

abstract class _SignUpParam implements SignUpParam {
  const factory _SignUpParam(
      {required final String email,
      required final String password}) = _$SignUpParamImpl;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of SignUpParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpParamImplCopyWith<_$SignUpParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

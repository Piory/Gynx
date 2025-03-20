// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../../application/usecase/params/sign_in_with_oauth_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignInWithOAuthParam {
  OAuthProviderType get oauthProviderType => throw _privateConstructorUsedError;

  /// Create a copy of SignInWithOAuthParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInWithOAuthParamCopyWith<SignInWithOAuthParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInWithOAuthParamCopyWith<$Res> {
  factory $SignInWithOAuthParamCopyWith(SignInWithOAuthParam value,
          $Res Function(SignInWithOAuthParam) then) =
      _$SignInWithOAuthParamCopyWithImpl<$Res, SignInWithOAuthParam>;
  @useResult
  $Res call({OAuthProviderType oauthProviderType});
}

/// @nodoc
class _$SignInWithOAuthParamCopyWithImpl<$Res,
        $Val extends SignInWithOAuthParam>
    implements $SignInWithOAuthParamCopyWith<$Res> {
  _$SignInWithOAuthParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInWithOAuthParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oauthProviderType = null,
  }) {
    return _then(_value.copyWith(
      oauthProviderType: null == oauthProviderType
          ? _value.oauthProviderType
          : oauthProviderType // ignore: cast_nullable_to_non_nullable
              as OAuthProviderType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInWithOAuthParamImplCopyWith<$Res>
    implements $SignInWithOAuthParamCopyWith<$Res> {
  factory _$$SignInWithOAuthParamImplCopyWith(_$SignInWithOAuthParamImpl value,
          $Res Function(_$SignInWithOAuthParamImpl) then) =
      __$$SignInWithOAuthParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OAuthProviderType oauthProviderType});
}

/// @nodoc
class __$$SignInWithOAuthParamImplCopyWithImpl<$Res>
    extends _$SignInWithOAuthParamCopyWithImpl<$Res, _$SignInWithOAuthParamImpl>
    implements _$$SignInWithOAuthParamImplCopyWith<$Res> {
  __$$SignInWithOAuthParamImplCopyWithImpl(_$SignInWithOAuthParamImpl _value,
      $Res Function(_$SignInWithOAuthParamImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInWithOAuthParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oauthProviderType = null,
  }) {
    return _then(_$SignInWithOAuthParamImpl(
      oauthProviderType: null == oauthProviderType
          ? _value.oauthProviderType
          : oauthProviderType // ignore: cast_nullable_to_non_nullable
              as OAuthProviderType,
    ));
  }
}

/// @nodoc

class _$SignInWithOAuthParamImpl implements _SignInWithOAuthParam {
  const _$SignInWithOAuthParamImpl({required this.oauthProviderType});

  @override
  final OAuthProviderType oauthProviderType;

  @override
  String toString() {
    return 'SignInWithOAuthParam(oauthProviderType: $oauthProviderType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInWithOAuthParamImpl &&
            (identical(other.oauthProviderType, oauthProviderType) ||
                other.oauthProviderType == oauthProviderType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oauthProviderType);

  /// Create a copy of SignInWithOAuthParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInWithOAuthParamImplCopyWith<_$SignInWithOAuthParamImpl>
      get copyWith =>
          __$$SignInWithOAuthParamImplCopyWithImpl<_$SignInWithOAuthParamImpl>(
              this, _$identity);
}

abstract class _SignInWithOAuthParam implements SignInWithOAuthParam {
  const factory _SignInWithOAuthParam(
          {required final OAuthProviderType oauthProviderType}) =
      _$SignInWithOAuthParamImpl;

  @override
  OAuthProviderType get oauthProviderType;

  /// Create a copy of SignInWithOAuthParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInWithOAuthParamImplCopyWith<_$SignInWithOAuthParamImpl>
      get copyWith => throw _privateConstructorUsedError;
}

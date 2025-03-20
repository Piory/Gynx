// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../../application/usecase/params/link_identity_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LinkIdentityParam {
  OAuthProviderType get oauthProviderType => throw _privateConstructorUsedError;

  /// Create a copy of LinkIdentityParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LinkIdentityParamCopyWith<LinkIdentityParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkIdentityParamCopyWith<$Res> {
  factory $LinkIdentityParamCopyWith(
          LinkIdentityParam value, $Res Function(LinkIdentityParam) then) =
      _$LinkIdentityParamCopyWithImpl<$Res, LinkIdentityParam>;
  @useResult
  $Res call({OAuthProviderType oauthProviderType});
}

/// @nodoc
class _$LinkIdentityParamCopyWithImpl<$Res, $Val extends LinkIdentityParam>
    implements $LinkIdentityParamCopyWith<$Res> {
  _$LinkIdentityParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LinkIdentityParam
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
abstract class _$$LinkIdentityParamImplCopyWith<$Res>
    implements $LinkIdentityParamCopyWith<$Res> {
  factory _$$LinkIdentityParamImplCopyWith(_$LinkIdentityParamImpl value,
          $Res Function(_$LinkIdentityParamImpl) then) =
      __$$LinkIdentityParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OAuthProviderType oauthProviderType});
}

/// @nodoc
class __$$LinkIdentityParamImplCopyWithImpl<$Res>
    extends _$LinkIdentityParamCopyWithImpl<$Res, _$LinkIdentityParamImpl>
    implements _$$LinkIdentityParamImplCopyWith<$Res> {
  __$$LinkIdentityParamImplCopyWithImpl(_$LinkIdentityParamImpl _value,
      $Res Function(_$LinkIdentityParamImpl) _then)
      : super(_value, _then);

  /// Create a copy of LinkIdentityParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oauthProviderType = null,
  }) {
    return _then(_$LinkIdentityParamImpl(
      oauthProviderType: null == oauthProviderType
          ? _value.oauthProviderType
          : oauthProviderType // ignore: cast_nullable_to_non_nullable
              as OAuthProviderType,
    ));
  }
}

/// @nodoc

class _$LinkIdentityParamImpl implements _LinkIdentityParam {
  const _$LinkIdentityParamImpl({required this.oauthProviderType});

  @override
  final OAuthProviderType oauthProviderType;

  @override
  String toString() {
    return 'LinkIdentityParam(oauthProviderType: $oauthProviderType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkIdentityParamImpl &&
            (identical(other.oauthProviderType, oauthProviderType) ||
                other.oauthProviderType == oauthProviderType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oauthProviderType);

  /// Create a copy of LinkIdentityParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkIdentityParamImplCopyWith<_$LinkIdentityParamImpl> get copyWith =>
      __$$LinkIdentityParamImplCopyWithImpl<_$LinkIdentityParamImpl>(
          this, _$identity);
}

abstract class _LinkIdentityParam implements LinkIdentityParam {
  const factory _LinkIdentityParam(
          {required final OAuthProviderType oauthProviderType}) =
      _$LinkIdentityParamImpl;

  @override
  OAuthProviderType get oauthProviderType;

  /// Create a copy of LinkIdentityParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LinkIdentityParamImplCopyWith<_$LinkIdentityParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

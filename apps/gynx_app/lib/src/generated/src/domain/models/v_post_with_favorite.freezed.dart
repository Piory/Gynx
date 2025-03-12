// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/v_post_with_favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VPostWithFavorite {
  VPost get vPost => throw _privateConstructorUsedError;
  TUserPostFavorite get tUserPostFavorite => throw _privateConstructorUsedError;

  /// Create a copy of VPostWithFavorite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VPostWithFavoriteCopyWith<VPostWithFavorite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VPostWithFavoriteCopyWith<$Res> {
  factory $VPostWithFavoriteCopyWith(
          VPostWithFavorite value, $Res Function(VPostWithFavorite) then) =
      _$VPostWithFavoriteCopyWithImpl<$Res, VPostWithFavorite>;
  @useResult
  $Res call({VPost vPost, TUserPostFavorite tUserPostFavorite});

  $VPostCopyWith<$Res> get vPost;
  $TUserPostFavoriteCopyWith<$Res> get tUserPostFavorite;
}

/// @nodoc
class _$VPostWithFavoriteCopyWithImpl<$Res, $Val extends VPostWithFavorite>
    implements $VPostWithFavoriteCopyWith<$Res> {
  _$VPostWithFavoriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VPostWithFavorite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vPost = null,
    Object? tUserPostFavorite = null,
  }) {
    return _then(_value.copyWith(
      vPost: null == vPost
          ? _value.vPost
          : vPost // ignore: cast_nullable_to_non_nullable
              as VPost,
      tUserPostFavorite: null == tUserPostFavorite
          ? _value.tUserPostFavorite
          : tUserPostFavorite // ignore: cast_nullable_to_non_nullable
              as TUserPostFavorite,
    ) as $Val);
  }

  /// Create a copy of VPostWithFavorite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VPostCopyWith<$Res> get vPost {
    return $VPostCopyWith<$Res>(_value.vPost, (value) {
      return _then(_value.copyWith(vPost: value) as $Val);
    });
  }

  /// Create a copy of VPostWithFavorite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TUserPostFavoriteCopyWith<$Res> get tUserPostFavorite {
    return $TUserPostFavoriteCopyWith<$Res>(_value.tUserPostFavorite, (value) {
      return _then(_value.copyWith(tUserPostFavorite: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VPostWithFavoriteImplCopyWith<$Res>
    implements $VPostWithFavoriteCopyWith<$Res> {
  factory _$$VPostWithFavoriteImplCopyWith(_$VPostWithFavoriteImpl value,
          $Res Function(_$VPostWithFavoriteImpl) then) =
      __$$VPostWithFavoriteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VPost vPost, TUserPostFavorite tUserPostFavorite});

  @override
  $VPostCopyWith<$Res> get vPost;
  @override
  $TUserPostFavoriteCopyWith<$Res> get tUserPostFavorite;
}

/// @nodoc
class __$$VPostWithFavoriteImplCopyWithImpl<$Res>
    extends _$VPostWithFavoriteCopyWithImpl<$Res, _$VPostWithFavoriteImpl>
    implements _$$VPostWithFavoriteImplCopyWith<$Res> {
  __$$VPostWithFavoriteImplCopyWithImpl(_$VPostWithFavoriteImpl _value,
      $Res Function(_$VPostWithFavoriteImpl) _then)
      : super(_value, _then);

  /// Create a copy of VPostWithFavorite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vPost = null,
    Object? tUserPostFavorite = null,
  }) {
    return _then(_$VPostWithFavoriteImpl(
      vPost: null == vPost
          ? _value.vPost
          : vPost // ignore: cast_nullable_to_non_nullable
              as VPost,
      tUserPostFavorite: null == tUserPostFavorite
          ? _value.tUserPostFavorite
          : tUserPostFavorite // ignore: cast_nullable_to_non_nullable
              as TUserPostFavorite,
    ));
  }
}

/// @nodoc

class _$VPostWithFavoriteImpl extends _VPostWithFavorite {
  const _$VPostWithFavoriteImpl(
      {required this.vPost, required this.tUserPostFavorite})
      : super._();

  @override
  final VPost vPost;
  @override
  final TUserPostFavorite tUserPostFavorite;

  @override
  String toString() {
    return 'VPostWithFavorite(vPost: $vPost, tUserPostFavorite: $tUserPostFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VPostWithFavoriteImpl &&
            (identical(other.vPost, vPost) || other.vPost == vPost) &&
            (identical(other.tUserPostFavorite, tUserPostFavorite) ||
                other.tUserPostFavorite == tUserPostFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vPost, tUserPostFavorite);

  /// Create a copy of VPostWithFavorite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VPostWithFavoriteImplCopyWith<_$VPostWithFavoriteImpl> get copyWith =>
      __$$VPostWithFavoriteImplCopyWithImpl<_$VPostWithFavoriteImpl>(
          this, _$identity);
}

abstract class _VPostWithFavorite extends VPostWithFavorite {
  const factory _VPostWithFavorite(
          {required final VPost vPost,
          required final TUserPostFavorite tUserPostFavorite}) =
      _$VPostWithFavoriteImpl;
  const _VPostWithFavorite._() : super._();

  @override
  VPost get vPost;
  @override
  TUserPostFavorite get tUserPostFavorite;

  /// Create a copy of VPostWithFavorite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VPostWithFavoriteImplCopyWith<_$VPostWithFavoriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/v_post_with_favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VPostWithFavorite {
  VPost get vPost;
  TUserPostFavorite get tUserPostFavorite;

  /// Create a copy of VPostWithFavorite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VPostWithFavoriteCopyWith<VPostWithFavorite> get copyWith =>
      _$VPostWithFavoriteCopyWithImpl<VPostWithFavorite>(
          this as VPostWithFavorite, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VPostWithFavorite &&
            (identical(other.vPost, vPost) || other.vPost == vPost) &&
            (identical(other.tUserPostFavorite, tUserPostFavorite) ||
                other.tUserPostFavorite == tUserPostFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vPost, tUserPostFavorite);

  @override
  String toString() {
    return 'VPostWithFavorite(vPost: $vPost, tUserPostFavorite: $tUserPostFavorite)';
  }
}

/// @nodoc
abstract mixin class $VPostWithFavoriteCopyWith<$Res> {
  factory $VPostWithFavoriteCopyWith(
          VPostWithFavorite value, $Res Function(VPostWithFavorite) _then) =
      _$VPostWithFavoriteCopyWithImpl;
  @useResult
  $Res call({VPost vPost, TUserPostFavorite tUserPostFavorite});
}

/// @nodoc
class _$VPostWithFavoriteCopyWithImpl<$Res>
    implements $VPostWithFavoriteCopyWith<$Res> {
  _$VPostWithFavoriteCopyWithImpl(this._self, this._then);

  final VPostWithFavorite _self;
  final $Res Function(VPostWithFavorite) _then;

  /// Create a copy of VPostWithFavorite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vPost = null,
    Object? tUserPostFavorite = null,
  }) {
    return _then(VPostWithFavorite(
      vPost: null == vPost
          ? _self.vPost
          : vPost // ignore: cast_nullable_to_non_nullable
              as VPost,
      tUserPostFavorite: null == tUserPostFavorite
          ? _self.tUserPostFavorite
          : tUserPostFavorite // ignore: cast_nullable_to_non_nullable
              as TUserPostFavorite,
    ));
  }
}

// dart format on

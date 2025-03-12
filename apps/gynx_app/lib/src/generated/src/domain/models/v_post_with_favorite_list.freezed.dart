// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/v_post_with_favorite_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VPostWithFavoriteList {
  List<VPostWithFavorite> get vPostWithFavorites;

  /// Create a copy of VPostWithFavoriteList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VPostWithFavoriteListCopyWith<VPostWithFavoriteList> get copyWith =>
      _$VPostWithFavoriteListCopyWithImpl<VPostWithFavoriteList>(
          this as VPostWithFavoriteList, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VPostWithFavoriteList &&
            const DeepCollectionEquality()
                .equals(other.vPostWithFavorites, vPostWithFavorites));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(vPostWithFavorites));

  @override
  String toString() {
    return 'VPostWithFavoriteList(vPostWithFavorites: $vPostWithFavorites)';
  }
}

/// @nodoc
abstract mixin class $VPostWithFavoriteListCopyWith<$Res> {
  factory $VPostWithFavoriteListCopyWith(VPostWithFavoriteList value,
          $Res Function(VPostWithFavoriteList) _then) =
      _$VPostWithFavoriteListCopyWithImpl;
  @useResult
  $Res call({List<VPostWithFavorite> vPostWithFavorites});
}

/// @nodoc
class _$VPostWithFavoriteListCopyWithImpl<$Res>
    implements $VPostWithFavoriteListCopyWith<$Res> {
  _$VPostWithFavoriteListCopyWithImpl(this._self, this._then);

  final VPostWithFavoriteList _self;
  final $Res Function(VPostWithFavoriteList) _then;

  /// Create a copy of VPostWithFavoriteList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vPostWithFavorites = null,
  }) {
    return _then(VPostWithFavoriteList(
      null == vPostWithFavorites
          ? _self.vPostWithFavorites
          : vPostWithFavorites // ignore: cast_nullable_to_non_nullable
              as List<VPostWithFavorite>,
    ));
  }
}

// dart format on

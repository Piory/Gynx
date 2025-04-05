// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/t_user_post_favorite_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TUserPostFavoriteList {
  List<TUserPostFavorite> get tUserPostFavorites;

  /// Create a copy of TUserPostFavoriteList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TUserPostFavoriteListCopyWith<TUserPostFavoriteList> get copyWith =>
      _$TUserPostFavoriteListCopyWithImpl<TUserPostFavoriteList>(
          this as TUserPostFavoriteList, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TUserPostFavoriteList &&
            const DeepCollectionEquality()
                .equals(other.tUserPostFavorites, tUserPostFavorites));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(tUserPostFavorites));

  @override
  String toString() {
    return 'TUserPostFavoriteList(tUserPostFavorites: $tUserPostFavorites)';
  }
}

/// @nodoc
abstract mixin class $TUserPostFavoriteListCopyWith<$Res> {
  factory $TUserPostFavoriteListCopyWith(TUserPostFavoriteList value,
          $Res Function(TUserPostFavoriteList) _then) =
      _$TUserPostFavoriteListCopyWithImpl;
  @useResult
  $Res call({List<TUserPostFavorite> tUserPostFavorites});
}

/// @nodoc
class _$TUserPostFavoriteListCopyWithImpl<$Res>
    implements $TUserPostFavoriteListCopyWith<$Res> {
  _$TUserPostFavoriteListCopyWithImpl(this._self, this._then);

  final TUserPostFavoriteList _self;
  final $Res Function(TUserPostFavoriteList) _then;

  /// Create a copy of TUserPostFavoriteList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tUserPostFavorites = null,
  }) {
    return _then(TUserPostFavoriteList(
      null == tUserPostFavorites
          ? _self.tUserPostFavorites
          : tUserPostFavorites // ignore: cast_nullable_to_non_nullable
              as List<TUserPostFavorite>,
    ));
  }
}

// dart format on

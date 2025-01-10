// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/t_user_post_favorite_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TUserPostFavoriteList {
  List<TUserPostFavorite> get tPostFavorites =>
      throw _privateConstructorUsedError;

  /// Create a copy of TUserPostFavoriteList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TUserPostFavoriteListCopyWith<TUserPostFavoriteList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TUserPostFavoriteListCopyWith<$Res> {
  factory $TUserPostFavoriteListCopyWith(TUserPostFavoriteList value,
          $Res Function(TUserPostFavoriteList) then) =
      _$TUserPostFavoriteListCopyWithImpl<$Res, TUserPostFavoriteList>;
  @useResult
  $Res call({List<TUserPostFavorite> tPostFavorites});
}

/// @nodoc
class _$TUserPostFavoriteListCopyWithImpl<$Res,
        $Val extends TUserPostFavoriteList>
    implements $TUserPostFavoriteListCopyWith<$Res> {
  _$TUserPostFavoriteListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TUserPostFavoriteList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tPostFavorites = null,
  }) {
    return _then(_value.copyWith(
      tPostFavorites: null == tPostFavorites
          ? _value.tPostFavorites
          : tPostFavorites // ignore: cast_nullable_to_non_nullable
              as List<TUserPostFavorite>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TUserPostFavoriteListImplCopyWith<$Res>
    implements $TUserPostFavoriteListCopyWith<$Res> {
  factory _$$TUserPostFavoriteListImplCopyWith(
          _$TUserPostFavoriteListImpl value,
          $Res Function(_$TUserPostFavoriteListImpl) then) =
      __$$TUserPostFavoriteListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TUserPostFavorite> tPostFavorites});
}

/// @nodoc
class __$$TUserPostFavoriteListImplCopyWithImpl<$Res>
    extends _$TUserPostFavoriteListCopyWithImpl<$Res,
        _$TUserPostFavoriteListImpl>
    implements _$$TUserPostFavoriteListImplCopyWith<$Res> {
  __$$TUserPostFavoriteListImplCopyWithImpl(_$TUserPostFavoriteListImpl _value,
      $Res Function(_$TUserPostFavoriteListImpl) _then)
      : super(_value, _then);

  /// Create a copy of TUserPostFavoriteList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tPostFavorites = null,
  }) {
    return _then(_$TUserPostFavoriteListImpl(
      null == tPostFavorites
          ? _value._tPostFavorites
          : tPostFavorites // ignore: cast_nullable_to_non_nullable
              as List<TUserPostFavorite>,
    ));
  }
}

/// @nodoc

class _$TUserPostFavoriteListImpl extends _TUserPostFavoriteList {
  const _$TUserPostFavoriteListImpl(
      final List<TUserPostFavorite> tPostFavorites)
      : _tPostFavorites = tPostFavorites,
        super._();

  final List<TUserPostFavorite> _tPostFavorites;
  @override
  List<TUserPostFavorite> get tPostFavorites {
    if (_tPostFavorites is EqualUnmodifiableListView) return _tPostFavorites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tPostFavorites);
  }

  @override
  String toString() {
    return 'TUserPostFavoriteList(tPostFavorites: $tPostFavorites)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TUserPostFavoriteListImpl &&
            const DeepCollectionEquality()
                .equals(other._tPostFavorites, _tPostFavorites));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tPostFavorites));

  /// Create a copy of TUserPostFavoriteList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TUserPostFavoriteListImplCopyWith<_$TUserPostFavoriteListImpl>
      get copyWith => __$$TUserPostFavoriteListImplCopyWithImpl<
          _$TUserPostFavoriteListImpl>(this, _$identity);
}

abstract class _TUserPostFavoriteList extends TUserPostFavoriteList {
  const factory _TUserPostFavoriteList(
          final List<TUserPostFavorite> tPostFavorites) =
      _$TUserPostFavoriteListImpl;
  const _TUserPostFavoriteList._() : super._();

  @override
  List<TUserPostFavorite> get tPostFavorites;

  /// Create a copy of TUserPostFavoriteList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TUserPostFavoriteListImplCopyWith<_$TUserPostFavoriteListImpl>
      get copyWith => throw _privateConstructorUsedError;
}

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

TUserPostFavoriteList _$TUserPostFavoriteListFromJson(
    Map<String, dynamic> json) {
  return _TUserPostFavoriteList.fromJson(json);
}

/// @nodoc
mixin _$TUserPostFavoriteList {
  List<TUserPostFavorite> get tUserPostFavorites =>
      throw _privateConstructorUsedError;

  /// Serializes this TUserPostFavoriteList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

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
  $Res call({List<TUserPostFavorite> tUserPostFavorites});
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
    Object? tUserPostFavorites = null,
  }) {
    return _then(_value.copyWith(
      tUserPostFavorites: null == tUserPostFavorites
          ? _value.tUserPostFavorites
          : tUserPostFavorites // ignore: cast_nullable_to_non_nullable
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
  $Res call({List<TUserPostFavorite> tUserPostFavorites});
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
    Object? tUserPostFavorites = null,
  }) {
    return _then(_$TUserPostFavoriteListImpl(
      null == tUserPostFavorites
          ? _value._tUserPostFavorites
          : tUserPostFavorites // ignore: cast_nullable_to_non_nullable
              as List<TUserPostFavorite>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TUserPostFavoriteListImpl extends _TUserPostFavoriteList {
  const _$TUserPostFavoriteListImpl(
      final List<TUserPostFavorite> tUserPostFavorites)
      : _tUserPostFavorites = tUserPostFavorites,
        super._();

  factory _$TUserPostFavoriteListImpl.fromJson(Map<String, dynamic> json) =>
      _$$TUserPostFavoriteListImplFromJson(json);

  final List<TUserPostFavorite> _tUserPostFavorites;
  @override
  List<TUserPostFavorite> get tUserPostFavorites {
    if (_tUserPostFavorites is EqualUnmodifiableListView)
      return _tUserPostFavorites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tUserPostFavorites);
  }

  @override
  String toString() {
    return 'TUserPostFavoriteList(tUserPostFavorites: $tUserPostFavorites)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TUserPostFavoriteListImpl &&
            const DeepCollectionEquality()
                .equals(other._tUserPostFavorites, _tUserPostFavorites));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tUserPostFavorites));

  /// Create a copy of TUserPostFavoriteList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TUserPostFavoriteListImplCopyWith<_$TUserPostFavoriteListImpl>
      get copyWith => __$$TUserPostFavoriteListImplCopyWithImpl<
          _$TUserPostFavoriteListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TUserPostFavoriteListImplToJson(
      this,
    );
  }
}

abstract class _TUserPostFavoriteList extends TUserPostFavoriteList {
  const factory _TUserPostFavoriteList(
          final List<TUserPostFavorite> tUserPostFavorites) =
      _$TUserPostFavoriteListImpl;
  const _TUserPostFavoriteList._() : super._();

  factory _TUserPostFavoriteList.fromJson(Map<String, dynamic> json) =
      _$TUserPostFavoriteListImpl.fromJson;

  @override
  List<TUserPostFavorite> get tUserPostFavorites;

  /// Create a copy of TUserPostFavoriteList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TUserPostFavoriteListImplCopyWith<_$TUserPostFavoriteListImpl>
      get copyWith => throw _privateConstructorUsedError;
}

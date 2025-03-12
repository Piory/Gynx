// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/v_post_with_favorite_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VPostWithFavoriteList {
  List<VPostWithFavorite> get vPostWithFavorites =>
      throw _privateConstructorUsedError;

  /// Create a copy of VPostWithFavoriteList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VPostWithFavoriteListCopyWith<VPostWithFavoriteList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VPostWithFavoriteListCopyWith<$Res> {
  factory $VPostWithFavoriteListCopyWith(VPostWithFavoriteList value,
          $Res Function(VPostWithFavoriteList) then) =
      _$VPostWithFavoriteListCopyWithImpl<$Res, VPostWithFavoriteList>;
  @useResult
  $Res call({List<VPostWithFavorite> vPostWithFavorites});
}

/// @nodoc
class _$VPostWithFavoriteListCopyWithImpl<$Res,
        $Val extends VPostWithFavoriteList>
    implements $VPostWithFavoriteListCopyWith<$Res> {
  _$VPostWithFavoriteListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VPostWithFavoriteList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vPostWithFavorites = null,
  }) {
    return _then(_value.copyWith(
      vPostWithFavorites: null == vPostWithFavorites
          ? _value.vPostWithFavorites
          : vPostWithFavorites // ignore: cast_nullable_to_non_nullable
              as List<VPostWithFavorite>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VPostWithFavoriteListImplCopyWith<$Res>
    implements $VPostWithFavoriteListCopyWith<$Res> {
  factory _$$VPostWithFavoriteListImplCopyWith(
          _$VPostWithFavoriteListImpl value,
          $Res Function(_$VPostWithFavoriteListImpl) then) =
      __$$VPostWithFavoriteListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<VPostWithFavorite> vPostWithFavorites});
}

/// @nodoc
class __$$VPostWithFavoriteListImplCopyWithImpl<$Res>
    extends _$VPostWithFavoriteListCopyWithImpl<$Res,
        _$VPostWithFavoriteListImpl>
    implements _$$VPostWithFavoriteListImplCopyWith<$Res> {
  __$$VPostWithFavoriteListImplCopyWithImpl(_$VPostWithFavoriteListImpl _value,
      $Res Function(_$VPostWithFavoriteListImpl) _then)
      : super(_value, _then);

  /// Create a copy of VPostWithFavoriteList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vPostWithFavorites = null,
  }) {
    return _then(_$VPostWithFavoriteListImpl(
      null == vPostWithFavorites
          ? _value._vPostWithFavorites
          : vPostWithFavorites // ignore: cast_nullable_to_non_nullable
              as List<VPostWithFavorite>,
    ));
  }
}

/// @nodoc

class _$VPostWithFavoriteListImpl extends _VPostWithFavoriteList {
  const _$VPostWithFavoriteListImpl(
      final List<VPostWithFavorite> vPostWithFavorites)
      : _vPostWithFavorites = vPostWithFavorites,
        super._();

  final List<VPostWithFavorite> _vPostWithFavorites;
  @override
  List<VPostWithFavorite> get vPostWithFavorites {
    if (_vPostWithFavorites is EqualUnmodifiableListView)
      return _vPostWithFavorites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vPostWithFavorites);
  }

  @override
  String toString() {
    return 'VPostWithFavoriteList(vPostWithFavorites: $vPostWithFavorites)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VPostWithFavoriteListImpl &&
            const DeepCollectionEquality()
                .equals(other._vPostWithFavorites, _vPostWithFavorites));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_vPostWithFavorites));

  /// Create a copy of VPostWithFavoriteList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VPostWithFavoriteListImplCopyWith<_$VPostWithFavoriteListImpl>
      get copyWith => __$$VPostWithFavoriteListImplCopyWithImpl<
          _$VPostWithFavoriteListImpl>(this, _$identity);
}

abstract class _VPostWithFavoriteList extends VPostWithFavoriteList {
  const factory _VPostWithFavoriteList(
          final List<VPostWithFavorite> vPostWithFavorites) =
      _$VPostWithFavoriteListImpl;
  const _VPostWithFavoriteList._() : super._();

  @override
  List<VPostWithFavorite> get vPostWithFavorites;

  /// Create a copy of VPostWithFavoriteList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VPostWithFavoriteListImplCopyWith<_$VPostWithFavoriteListImpl>
      get copyWith => throw _privateConstructorUsedError;
}

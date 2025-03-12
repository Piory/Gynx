// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/v_post_map.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VPostMap {
  @protected
  Map<int, VPost> get map => throw _privateConstructorUsedError;

  /// Create a copy of VPostMap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VPostMapCopyWith<VPostMap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VPostMapCopyWith<$Res> {
  factory $VPostMapCopyWith(VPostMap value, $Res Function(VPostMap) then) =
      _$VPostMapCopyWithImpl<$Res, VPostMap>;
  @useResult
  $Res call({@protected Map<int, VPost> map});
}

/// @nodoc
class _$VPostMapCopyWithImpl<$Res, $Val extends VPostMap>
    implements $VPostMapCopyWith<$Res> {
  _$VPostMapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VPostMap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? map = null,
  }) {
    return _then(_value.copyWith(
      map: null == map
          ? _value.map
          : map // ignore: cast_nullable_to_non_nullable
              as Map<int, VPost>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VPostMapImplCopyWith<$Res>
    implements $VPostMapCopyWith<$Res> {
  factory _$$VPostMapImplCopyWith(
          _$VPostMapImpl value, $Res Function(_$VPostMapImpl) then) =
      __$$VPostMapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@protected Map<int, VPost> map});
}

/// @nodoc
class __$$VPostMapImplCopyWithImpl<$Res>
    extends _$VPostMapCopyWithImpl<$Res, _$VPostMapImpl>
    implements _$$VPostMapImplCopyWith<$Res> {
  __$$VPostMapImplCopyWithImpl(
      _$VPostMapImpl _value, $Res Function(_$VPostMapImpl) _then)
      : super(_value, _then);

  /// Create a copy of VPostMap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? map = null,
  }) {
    return _then(_$VPostMapImpl(
      null == map
          ? _value._map
          : map // ignore: cast_nullable_to_non_nullable
              as Map<int, VPost>,
    ));
  }
}

/// @nodoc

class _$VPostMapImpl extends _VPostMap {
  const _$VPostMapImpl(@protected final Map<int, VPost> map)
      : _map = map,
        super._();

  final Map<int, VPost> _map;
  @override
  @protected
  Map<int, VPost> get map {
    if (_map is EqualUnmodifiableMapView) return _map;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_map);
  }

  @override
  String toString() {
    return 'VPostMap(map: $map)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VPostMapImpl &&
            const DeepCollectionEquality().equals(other._map, _map));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_map));

  /// Create a copy of VPostMap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VPostMapImplCopyWith<_$VPostMapImpl> get copyWith =>
      __$$VPostMapImplCopyWithImpl<_$VPostMapImpl>(this, _$identity);
}

abstract class _VPostMap extends VPostMap {
  const factory _VPostMap(@protected final Map<int, VPost> map) =
      _$VPostMapImpl;
  const _VPostMap._() : super._();

  @override
  @protected
  Map<int, VPost> get map;

  /// Create a copy of VPostMap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VPostMapImplCopyWith<_$VPostMapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

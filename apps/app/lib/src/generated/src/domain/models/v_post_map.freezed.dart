// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/v_post_map.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VPostMap {
  Map<int, VPost> get map;

  /// Create a copy of VPostMap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VPostMapCopyWith<VPostMap> get copyWith =>
      _$VPostMapCopyWithImpl<VPostMap>(this as VPostMap, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VPostMap &&
            const DeepCollectionEquality().equals(other.map, map));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(map));

  @override
  String toString() {
    return 'VPostMap(map: $map)';
  }
}

/// @nodoc
abstract mixin class $VPostMapCopyWith<$Res> {
  factory $VPostMapCopyWith(VPostMap value, $Res Function(VPostMap) _then) =
      _$VPostMapCopyWithImpl;
  @useResult
  $Res call({@protected Map<int, VPost> map});
}

/// @nodoc
class _$VPostMapCopyWithImpl<$Res> implements $VPostMapCopyWith<$Res> {
  _$VPostMapCopyWithImpl(this._self, this._then);

  final VPostMap _self;
  final $Res Function(VPostMap) _then;

  /// Create a copy of VPostMap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? map = null,
  }) {
    return _then(VPostMap(
      null == map
          ? _self.map
          : map // ignore: cast_nullable_to_non_nullable
              as Map<int, VPost>,
    ));
  }
}

// dart format on

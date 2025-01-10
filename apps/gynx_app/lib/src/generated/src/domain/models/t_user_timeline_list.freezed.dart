// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/t_user_timeline_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TUserTimelineList {
  List<TUserTimeline> get tUserTimelines => throw _privateConstructorUsedError;

  /// Create a copy of TUserTimelineList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TUserTimelineListCopyWith<TUserTimelineList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TUserTimelineListCopyWith<$Res> {
  factory $TUserTimelineListCopyWith(
          TUserTimelineList value, $Res Function(TUserTimelineList) then) =
      _$TUserTimelineListCopyWithImpl<$Res, TUserTimelineList>;
  @useResult
  $Res call({List<TUserTimeline> tUserTimelines});
}

/// @nodoc
class _$TUserTimelineListCopyWithImpl<$Res, $Val extends TUserTimelineList>
    implements $TUserTimelineListCopyWith<$Res> {
  _$TUserTimelineListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TUserTimelineList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tUserTimelines = null,
  }) {
    return _then(_value.copyWith(
      tUserTimelines: null == tUserTimelines
          ? _value.tUserTimelines
          : tUserTimelines // ignore: cast_nullable_to_non_nullable
              as List<TUserTimeline>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TUserTimelineListImplCopyWith<$Res>
    implements $TUserTimelineListCopyWith<$Res> {
  factory _$$TUserTimelineListImplCopyWith(_$TUserTimelineListImpl value,
          $Res Function(_$TUserTimelineListImpl) then) =
      __$$TUserTimelineListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TUserTimeline> tUserTimelines});
}

/// @nodoc
class __$$TUserTimelineListImplCopyWithImpl<$Res>
    extends _$TUserTimelineListCopyWithImpl<$Res, _$TUserTimelineListImpl>
    implements _$$TUserTimelineListImplCopyWith<$Res> {
  __$$TUserTimelineListImplCopyWithImpl(_$TUserTimelineListImpl _value,
      $Res Function(_$TUserTimelineListImpl) _then)
      : super(_value, _then);

  /// Create a copy of TUserTimelineList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tUserTimelines = null,
  }) {
    return _then(_$TUserTimelineListImpl(
      null == tUserTimelines
          ? _value._tUserTimelines
          : tUserTimelines // ignore: cast_nullable_to_non_nullable
              as List<TUserTimeline>,
    ));
  }
}

/// @nodoc

class _$TUserTimelineListImpl extends _TUserTimelineList {
  const _$TUserTimelineListImpl(final List<TUserTimeline> tUserTimelines)
      : _tUserTimelines = tUserTimelines,
        super._();

  final List<TUserTimeline> _tUserTimelines;
  @override
  List<TUserTimeline> get tUserTimelines {
    if (_tUserTimelines is EqualUnmodifiableListView) return _tUserTimelines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tUserTimelines);
  }

  @override
  String toString() {
    return 'TUserTimelineList(tUserTimelines: $tUserTimelines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TUserTimelineListImpl &&
            const DeepCollectionEquality()
                .equals(other._tUserTimelines, _tUserTimelines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tUserTimelines));

  /// Create a copy of TUserTimelineList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TUserTimelineListImplCopyWith<_$TUserTimelineListImpl> get copyWith =>
      __$$TUserTimelineListImplCopyWithImpl<_$TUserTimelineListImpl>(
          this, _$identity);
}

abstract class _TUserTimelineList extends TUserTimelineList {
  const factory _TUserTimelineList(final List<TUserTimeline> tUserTimelines) =
      _$TUserTimelineListImpl;
  const _TUserTimelineList._() : super._();

  @override
  List<TUserTimeline> get tUserTimelines;

  /// Create a copy of TUserTimelineList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TUserTimelineListImplCopyWith<_$TUserTimelineListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

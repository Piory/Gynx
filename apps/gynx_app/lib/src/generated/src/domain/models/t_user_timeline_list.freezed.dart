// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/t_user_timeline_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TUserTimelineList {
  List<TUserTimeline> get tUserTimelines;

  /// Create a copy of TUserTimelineList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TUserTimelineListCopyWith<TUserTimelineList> get copyWith =>
      _$TUserTimelineListCopyWithImpl<TUserTimelineList>(
          this as TUserTimelineList, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TUserTimelineList &&
            const DeepCollectionEquality()
                .equals(other.tUserTimelines, tUserTimelines));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(tUserTimelines));

  @override
  String toString() {
    return 'TUserTimelineList(tUserTimelines: $tUserTimelines)';
  }
}

/// @nodoc
abstract mixin class $TUserTimelineListCopyWith<$Res> {
  factory $TUserTimelineListCopyWith(
          TUserTimelineList value, $Res Function(TUserTimelineList) _then) =
      _$TUserTimelineListCopyWithImpl;
  @useResult
  $Res call({List<TUserTimeline> tUserTimelines});
}

/// @nodoc
class _$TUserTimelineListCopyWithImpl<$Res>
    implements $TUserTimelineListCopyWith<$Res> {
  _$TUserTimelineListCopyWithImpl(this._self, this._then);

  final TUserTimelineList _self;
  final $Res Function(TUserTimelineList) _then;

  /// Create a copy of TUserTimelineList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tUserTimelines = null,
  }) {
    return _then(TUserTimelineList(
      null == tUserTimelines
          ? _self.tUserTimelines
          : tUserTimelines // ignore: cast_nullable_to_non_nullable
              as List<TUserTimeline>,
    ));
  }
}

// dart format on

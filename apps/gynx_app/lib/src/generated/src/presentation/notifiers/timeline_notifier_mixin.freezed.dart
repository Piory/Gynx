// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../presentation/notifiers/timeline_notifier_mixin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimelineState {
  bool get isNoMorePost;
  PostIdList get postIdList;

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimelineStateCopyWith<TimelineState> get copyWith =>
      _$TimelineStateCopyWithImpl<TimelineState>(
          this as TimelineState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimelineState &&
            (identical(other.isNoMorePost, isNoMorePost) ||
                other.isNoMorePost == isNoMorePost) &&
            (identical(other.postIdList, postIdList) ||
                other.postIdList == postIdList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isNoMorePost, postIdList);

  @override
  String toString() {
    return 'TimelineState(isNoMorePost: $isNoMorePost, postIdList: $postIdList)';
  }
}

/// @nodoc
abstract mixin class $TimelineStateCopyWith<$Res> {
  factory $TimelineStateCopyWith(
          TimelineState value, $Res Function(TimelineState) _then) =
      _$TimelineStateCopyWithImpl;
  @useResult
  $Res call({bool isNoMorePost, PostIdList postIdList});
}

/// @nodoc
class _$TimelineStateCopyWithImpl<$Res>
    implements $TimelineStateCopyWith<$Res> {
  _$TimelineStateCopyWithImpl(this._self, this._then);

  final TimelineState _self;
  final $Res Function(TimelineState) _then;

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNoMorePost = null,
    Object? postIdList = null,
  }) {
    return _then(TimelineState(
      isNoMorePost: null == isNoMorePost
          ? _self.isNoMorePost
          : isNoMorePost // ignore: cast_nullable_to_non_nullable
              as bool,
      postIdList: null == postIdList
          ? _self.postIdList
          : postIdList // ignore: cast_nullable_to_non_nullable
              as PostIdList,
    ));
  }
}

// dart format on

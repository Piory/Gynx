// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../presentation/notifiers/timeline_notifier_mixin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimelineState {
  bool get isNoMorePost => throw _privateConstructorUsedError;
  PostIdList get postIdList => throw _privateConstructorUsedError;

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimelineStateCopyWith<TimelineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineStateCopyWith<$Res> {
  factory $TimelineStateCopyWith(
          TimelineState value, $Res Function(TimelineState) then) =
      _$TimelineStateCopyWithImpl<$Res, TimelineState>;
  @useResult
  $Res call({bool isNoMorePost, PostIdList postIdList});

  $PostIdListCopyWith<$Res> get postIdList;
}

/// @nodoc
class _$TimelineStateCopyWithImpl<$Res, $Val extends TimelineState>
    implements $TimelineStateCopyWith<$Res> {
  _$TimelineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNoMorePost = null,
    Object? postIdList = null,
  }) {
    return _then(_value.copyWith(
      isNoMorePost: null == isNoMorePost
          ? _value.isNoMorePost
          : isNoMorePost // ignore: cast_nullable_to_non_nullable
              as bool,
      postIdList: null == postIdList
          ? _value.postIdList
          : postIdList // ignore: cast_nullable_to_non_nullable
              as PostIdList,
    ) as $Val);
  }

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostIdListCopyWith<$Res> get postIdList {
    return $PostIdListCopyWith<$Res>(_value.postIdList, (value) {
      return _then(_value.copyWith(postIdList: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TimelineStateImplCopyWith<$Res>
    implements $TimelineStateCopyWith<$Res> {
  factory _$$TimelineStateImplCopyWith(
          _$TimelineStateImpl value, $Res Function(_$TimelineStateImpl) then) =
      __$$TimelineStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isNoMorePost, PostIdList postIdList});

  @override
  $PostIdListCopyWith<$Res> get postIdList;
}

/// @nodoc
class __$$TimelineStateImplCopyWithImpl<$Res>
    extends _$TimelineStateCopyWithImpl<$Res, _$TimelineStateImpl>
    implements _$$TimelineStateImplCopyWith<$Res> {
  __$$TimelineStateImplCopyWithImpl(
      _$TimelineStateImpl _value, $Res Function(_$TimelineStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNoMorePost = null,
    Object? postIdList = null,
  }) {
    return _then(_$TimelineStateImpl(
      isNoMorePost: null == isNoMorePost
          ? _value.isNoMorePost
          : isNoMorePost // ignore: cast_nullable_to_non_nullable
              as bool,
      postIdList: null == postIdList
          ? _value.postIdList
          : postIdList // ignore: cast_nullable_to_non_nullable
              as PostIdList,
    ));
  }
}

/// @nodoc

class _$TimelineStateImpl implements _TimelineState {
  const _$TimelineStateImpl(
      {this.isNoMorePost = false, this.postIdList = PostIdList.empty});

  @override
  @JsonKey()
  final bool isNoMorePost;
  @override
  @JsonKey()
  final PostIdList postIdList;

  @override
  String toString() {
    return 'TimelineState(isNoMorePost: $isNoMorePost, postIdList: $postIdList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimelineStateImpl &&
            (identical(other.isNoMorePost, isNoMorePost) ||
                other.isNoMorePost == isNoMorePost) &&
            (identical(other.postIdList, postIdList) ||
                other.postIdList == postIdList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isNoMorePost, postIdList);

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimelineStateImplCopyWith<_$TimelineStateImpl> get copyWith =>
      __$$TimelineStateImplCopyWithImpl<_$TimelineStateImpl>(this, _$identity);
}

abstract class _TimelineState implements TimelineState {
  const factory _TimelineState(
      {final bool isNoMorePost,
      final PostIdList postIdList}) = _$TimelineStateImpl;

  @override
  bool get isNoMorePost;
  @override
  PostIdList get postIdList;

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimelineStateImplCopyWith<_$TimelineStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

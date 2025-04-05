// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/t_post_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TPostList {
  List<TPost> get tPosts;

  /// Create a copy of TPostList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TPostListCopyWith<TPostList> get copyWith =>
      _$TPostListCopyWithImpl<TPostList>(this as TPostList, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TPostList &&
            const DeepCollectionEquality().equals(other.tPosts, tPosts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(tPosts));

  @override
  String toString() {
    return 'TPostList(tPosts: $tPosts)';
  }
}

/// @nodoc
abstract mixin class $TPostListCopyWith<$Res> {
  factory $TPostListCopyWith(TPostList value, $Res Function(TPostList) _then) =
      _$TPostListCopyWithImpl;
  @useResult
  $Res call({List<TPost> tPosts});
}

/// @nodoc
class _$TPostListCopyWithImpl<$Res> implements $TPostListCopyWith<$Res> {
  _$TPostListCopyWithImpl(this._self, this._then);

  final TPostList _self;
  final $Res Function(TPostList) _then;

  /// Create a copy of TPostList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tPosts = null,
  }) {
    return _then(TPostList(
      null == tPosts
          ? _self.tPosts
          : tPosts // ignore: cast_nullable_to_non_nullable
              as List<TPost>,
    ));
  }
}

// dart format on

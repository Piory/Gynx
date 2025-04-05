// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/v_post_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VPostList {
  List<VPost> get vPosts;

  /// Create a copy of VPostList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VPostListCopyWith<VPostList> get copyWith =>
      _$VPostListCopyWithImpl<VPostList>(this as VPostList, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VPostList &&
            const DeepCollectionEquality().equals(other.vPosts, vPosts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(vPosts));

  @override
  String toString() {
    return 'VPostList(vPosts: $vPosts)';
  }
}

/// @nodoc
abstract mixin class $VPostListCopyWith<$Res> {
  factory $VPostListCopyWith(VPostList value, $Res Function(VPostList) _then) =
      _$VPostListCopyWithImpl;
  @useResult
  $Res call({List<VPost> vPosts});
}

/// @nodoc
class _$VPostListCopyWithImpl<$Res> implements $VPostListCopyWith<$Res> {
  _$VPostListCopyWithImpl(this._self, this._then);

  final VPostList _self;
  final $Res Function(VPostList) _then;

  /// Create a copy of VPostList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vPosts = null,
  }) {
    return _then(VPostList(
      null == vPosts
          ? _self.vPosts
          : vPosts // ignore: cast_nullable_to_non_nullable
              as List<VPost>,
    ));
  }
}

// dart format on

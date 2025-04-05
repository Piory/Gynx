// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/post_id_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostIdList {
  List<int> get postIds;

  /// Create a copy of PostIdList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostIdListCopyWith<PostIdList> get copyWith =>
      _$PostIdListCopyWithImpl<PostIdList>(this as PostIdList, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostIdList &&
            const DeepCollectionEquality().equals(other.postIds, postIds));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(postIds));

  @override
  String toString() {
    return 'PostIdList(postIds: $postIds)';
  }
}

/// @nodoc
abstract mixin class $PostIdListCopyWith<$Res> {
  factory $PostIdListCopyWith(
          PostIdList value, $Res Function(PostIdList) _then) =
      _$PostIdListCopyWithImpl;
  @useResult
  $Res call({List<int> postIds});
}

/// @nodoc
class _$PostIdListCopyWithImpl<$Res> implements $PostIdListCopyWith<$Res> {
  _$PostIdListCopyWithImpl(this._self, this._then);

  final PostIdList _self;
  final $Res Function(PostIdList) _then;

  /// Create a copy of PostIdList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postIds = null,
  }) {
    return _then(PostIdList(
      null == postIds
          ? _self.postIds
          : postIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

// dart format on

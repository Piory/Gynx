// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/post_id_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostIdList {
  List<int> get postIds => throw _privateConstructorUsedError;

  /// Create a copy of PostIdList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostIdListCopyWith<PostIdList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostIdListCopyWith<$Res> {
  factory $PostIdListCopyWith(
          PostIdList value, $Res Function(PostIdList) then) =
      _$PostIdListCopyWithImpl<$Res, PostIdList>;
  @useResult
  $Res call({List<int> postIds});
}

/// @nodoc
class _$PostIdListCopyWithImpl<$Res, $Val extends PostIdList>
    implements $PostIdListCopyWith<$Res> {
  _$PostIdListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostIdList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postIds = null,
  }) {
    return _then(_value.copyWith(
      postIds: null == postIds
          ? _value.postIds
          : postIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostIdListImplCopyWith<$Res>
    implements $PostIdListCopyWith<$Res> {
  factory _$$PostIdListImplCopyWith(
          _$PostIdListImpl value, $Res Function(_$PostIdListImpl) then) =
      __$$PostIdListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> postIds});
}

/// @nodoc
class __$$PostIdListImplCopyWithImpl<$Res>
    extends _$PostIdListCopyWithImpl<$Res, _$PostIdListImpl>
    implements _$$PostIdListImplCopyWith<$Res> {
  __$$PostIdListImplCopyWithImpl(
      _$PostIdListImpl _value, $Res Function(_$PostIdListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostIdList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postIds = null,
  }) {
    return _then(_$PostIdListImpl(
      null == postIds
          ? _value._postIds
          : postIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$PostIdListImpl extends _PostIdList {
  const _$PostIdListImpl(final List<int> postIds)
      : _postIds = postIds,
        super._();

  final List<int> _postIds;
  @override
  List<int> get postIds {
    if (_postIds is EqualUnmodifiableListView) return _postIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_postIds);
  }

  @override
  String toString() {
    return 'PostIdList(postIds: $postIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostIdListImpl &&
            const DeepCollectionEquality().equals(other._postIds, _postIds));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_postIds));

  /// Create a copy of PostIdList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostIdListImplCopyWith<_$PostIdListImpl> get copyWith =>
      __$$PostIdListImplCopyWithImpl<_$PostIdListImpl>(this, _$identity);
}

abstract class _PostIdList extends PostIdList {
  const factory _PostIdList(final List<int> postIds) = _$PostIdListImpl;
  const _PostIdList._() : super._();

  @override
  List<int> get postIds;

  /// Create a copy of PostIdList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostIdListImplCopyWith<_$PostIdListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

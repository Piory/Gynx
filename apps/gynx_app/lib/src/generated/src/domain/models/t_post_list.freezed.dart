// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/t_post_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TPostList _$TPostListFromJson(Map<String, dynamic> json) {
  return _TPostList.fromJson(json);
}

/// @nodoc
mixin _$TPostList {
  List<TPost> get tPosts => throw _privateConstructorUsedError;

  /// Serializes this TPostList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TPostList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TPostListCopyWith<TPostList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TPostListCopyWith<$Res> {
  factory $TPostListCopyWith(TPostList value, $Res Function(TPostList) then) =
      _$TPostListCopyWithImpl<$Res, TPostList>;
  @useResult
  $Res call({List<TPost> tPosts});
}

/// @nodoc
class _$TPostListCopyWithImpl<$Res, $Val extends TPostList>
    implements $TPostListCopyWith<$Res> {
  _$TPostListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TPostList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tPosts = null,
  }) {
    return _then(_value.copyWith(
      tPosts: null == tPosts
          ? _value.tPosts
          : tPosts // ignore: cast_nullable_to_non_nullable
              as List<TPost>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TPostListImplCopyWith<$Res>
    implements $TPostListCopyWith<$Res> {
  factory _$$TPostListImplCopyWith(
          _$TPostListImpl value, $Res Function(_$TPostListImpl) then) =
      __$$TPostListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TPost> tPosts});
}

/// @nodoc
class __$$TPostListImplCopyWithImpl<$Res>
    extends _$TPostListCopyWithImpl<$Res, _$TPostListImpl>
    implements _$$TPostListImplCopyWith<$Res> {
  __$$TPostListImplCopyWithImpl(
      _$TPostListImpl _value, $Res Function(_$TPostListImpl) _then)
      : super(_value, _then);

  /// Create a copy of TPostList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tPosts = null,
  }) {
    return _then(_$TPostListImpl(
      null == tPosts
          ? _value._tPosts
          : tPosts // ignore: cast_nullable_to_non_nullable
              as List<TPost>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TPostListImpl extends _TPostList {
  const _$TPostListImpl(final List<TPost> tPosts)
      : _tPosts = tPosts,
        super._();

  factory _$TPostListImpl.fromJson(Map<String, dynamic> json) =>
      _$$TPostListImplFromJson(json);

  final List<TPost> _tPosts;
  @override
  List<TPost> get tPosts {
    if (_tPosts is EqualUnmodifiableListView) return _tPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tPosts);
  }

  @override
  String toString() {
    return 'TPostList(tPosts: $tPosts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TPostListImpl &&
            const DeepCollectionEquality().equals(other._tPosts, _tPosts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tPosts));

  /// Create a copy of TPostList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TPostListImplCopyWith<_$TPostListImpl> get copyWith =>
      __$$TPostListImplCopyWithImpl<_$TPostListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TPostListImplToJson(
      this,
    );
  }
}

abstract class _TPostList extends TPostList {
  const factory _TPostList(final List<TPost> tPosts) = _$TPostListImpl;
  const _TPostList._() : super._();

  factory _TPostList.fromJson(Map<String, dynamic> json) =
      _$TPostListImpl.fromJson;

  @override
  List<TPost> get tPosts;

  /// Create a copy of TPostList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TPostListImplCopyWith<_$TPostListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

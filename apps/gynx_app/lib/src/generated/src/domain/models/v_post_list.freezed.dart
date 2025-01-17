// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/v_post_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VPostList _$VPostListFromJson(Map<String, dynamic> json) {
  return _VPostList.fromJson(json);
}

/// @nodoc
mixin _$VPostList {
  List<VPost> get vPosts => throw _privateConstructorUsedError;

  /// Serializes this VPostList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VPostList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VPostListCopyWith<VPostList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VPostListCopyWith<$Res> {
  factory $VPostListCopyWith(VPostList value, $Res Function(VPostList) then) =
      _$VPostListCopyWithImpl<$Res, VPostList>;
  @useResult
  $Res call({List<VPost> vPosts});
}

/// @nodoc
class _$VPostListCopyWithImpl<$Res, $Val extends VPostList>
    implements $VPostListCopyWith<$Res> {
  _$VPostListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VPostList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vPosts = null,
  }) {
    return _then(_value.copyWith(
      vPosts: null == vPosts
          ? _value.vPosts
          : vPosts // ignore: cast_nullable_to_non_nullable
              as List<VPost>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VPostListImplCopyWith<$Res>
    implements $VPostListCopyWith<$Res> {
  factory _$$VPostListImplCopyWith(
          _$VPostListImpl value, $Res Function(_$VPostListImpl) then) =
      __$$VPostListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<VPost> vPosts});
}

/// @nodoc
class __$$VPostListImplCopyWithImpl<$Res>
    extends _$VPostListCopyWithImpl<$Res, _$VPostListImpl>
    implements _$$VPostListImplCopyWith<$Res> {
  __$$VPostListImplCopyWithImpl(
      _$VPostListImpl _value, $Res Function(_$VPostListImpl) _then)
      : super(_value, _then);

  /// Create a copy of VPostList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vPosts = null,
  }) {
    return _then(_$VPostListImpl(
      null == vPosts
          ? _value._vPosts
          : vPosts // ignore: cast_nullable_to_non_nullable
              as List<VPost>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VPostListImpl extends _VPostList {
  const _$VPostListImpl(final List<VPost> vPosts)
      : _vPosts = vPosts,
        super._();

  factory _$VPostListImpl.fromJson(Map<String, dynamic> json) =>
      _$$VPostListImplFromJson(json);

  final List<VPost> _vPosts;
  @override
  List<VPost> get vPosts {
    if (_vPosts is EqualUnmodifiableListView) return _vPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vPosts);
  }

  @override
  String toString() {
    return 'VPostList(vPosts: $vPosts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VPostListImpl &&
            const DeepCollectionEquality().equals(other._vPosts, _vPosts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_vPosts));

  /// Create a copy of VPostList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VPostListImplCopyWith<_$VPostListImpl> get copyWith =>
      __$$VPostListImplCopyWithImpl<_$VPostListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VPostListImplToJson(
      this,
    );
  }
}

abstract class _VPostList extends VPostList {
  const factory _VPostList(final List<VPost> vPosts) = _$VPostListImpl;
  const _VPostList._() : super._();

  factory _VPostList.fromJson(Map<String, dynamic> json) =
      _$VPostListImpl.fromJson;

  @override
  List<VPost> get vPosts;

  /// Create a copy of VPostList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VPostListImplCopyWith<_$VPostListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

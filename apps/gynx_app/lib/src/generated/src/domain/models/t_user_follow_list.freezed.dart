// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/t_user_follow_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TUserFollowList {
  List<TUserFollow> get tUserFollows => throw _privateConstructorUsedError;

  /// Create a copy of TUserFollowList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TUserFollowListCopyWith<TUserFollowList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TUserFollowListCopyWith<$Res> {
  factory $TUserFollowListCopyWith(
          TUserFollowList value, $Res Function(TUserFollowList) then) =
      _$TUserFollowListCopyWithImpl<$Res, TUserFollowList>;
  @useResult
  $Res call({List<TUserFollow> tUserFollows});
}

/// @nodoc
class _$TUserFollowListCopyWithImpl<$Res, $Val extends TUserFollowList>
    implements $TUserFollowListCopyWith<$Res> {
  _$TUserFollowListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TUserFollowList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tUserFollows = null,
  }) {
    return _then(_value.copyWith(
      tUserFollows: null == tUserFollows
          ? _value.tUserFollows
          : tUserFollows // ignore: cast_nullable_to_non_nullable
              as List<TUserFollow>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TUserFollowListImplCopyWith<$Res>
    implements $TUserFollowListCopyWith<$Res> {
  factory _$$TUserFollowListImplCopyWith(_$TUserFollowListImpl value,
          $Res Function(_$TUserFollowListImpl) then) =
      __$$TUserFollowListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TUserFollow> tUserFollows});
}

/// @nodoc
class __$$TUserFollowListImplCopyWithImpl<$Res>
    extends _$TUserFollowListCopyWithImpl<$Res, _$TUserFollowListImpl>
    implements _$$TUserFollowListImplCopyWith<$Res> {
  __$$TUserFollowListImplCopyWithImpl(
      _$TUserFollowListImpl _value, $Res Function(_$TUserFollowListImpl) _then)
      : super(_value, _then);

  /// Create a copy of TUserFollowList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tUserFollows = null,
  }) {
    return _then(_$TUserFollowListImpl(
      null == tUserFollows
          ? _value._tUserFollows
          : tUserFollows // ignore: cast_nullable_to_non_nullable
              as List<TUserFollow>,
    ));
  }
}

/// @nodoc

class _$TUserFollowListImpl extends _TUserFollowList {
  const _$TUserFollowListImpl(final List<TUserFollow> tUserFollows)
      : _tUserFollows = tUserFollows,
        super._();

  final List<TUserFollow> _tUserFollows;
  @override
  List<TUserFollow> get tUserFollows {
    if (_tUserFollows is EqualUnmodifiableListView) return _tUserFollows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tUserFollows);
  }

  @override
  String toString() {
    return 'TUserFollowList(tUserFollows: $tUserFollows)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TUserFollowListImpl &&
            const DeepCollectionEquality()
                .equals(other._tUserFollows, _tUserFollows));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tUserFollows));

  /// Create a copy of TUserFollowList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TUserFollowListImplCopyWith<_$TUserFollowListImpl> get copyWith =>
      __$$TUserFollowListImplCopyWithImpl<_$TUserFollowListImpl>(
          this, _$identity);
}

abstract class _TUserFollowList extends TUserFollowList {
  const factory _TUserFollowList(final List<TUserFollow> tUserFollows) =
      _$TUserFollowListImpl;
  const _TUserFollowList._() : super._();

  @override
  List<TUserFollow> get tUserFollows;

  /// Create a copy of TUserFollowList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TUserFollowListImplCopyWith<_$TUserFollowListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

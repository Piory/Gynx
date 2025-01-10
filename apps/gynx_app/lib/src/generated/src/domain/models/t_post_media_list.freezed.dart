// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/t_post_media_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TPostMediaList {
  List<TPostMedia> get tPostMedias => throw _privateConstructorUsedError;

  /// Create a copy of TPostMediaList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TPostMediaListCopyWith<TPostMediaList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TPostMediaListCopyWith<$Res> {
  factory $TPostMediaListCopyWith(
          TPostMediaList value, $Res Function(TPostMediaList) then) =
      _$TPostMediaListCopyWithImpl<$Res, TPostMediaList>;
  @useResult
  $Res call({List<TPostMedia> tPostMedias});
}

/// @nodoc
class _$TPostMediaListCopyWithImpl<$Res, $Val extends TPostMediaList>
    implements $TPostMediaListCopyWith<$Res> {
  _$TPostMediaListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TPostMediaList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tPostMedias = null,
  }) {
    return _then(_value.copyWith(
      tPostMedias: null == tPostMedias
          ? _value.tPostMedias
          : tPostMedias // ignore: cast_nullable_to_non_nullable
              as List<TPostMedia>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TPostMediaListImplCopyWith<$Res>
    implements $TPostMediaListCopyWith<$Res> {
  factory _$$TPostMediaListImplCopyWith(_$TPostMediaListImpl value,
          $Res Function(_$TPostMediaListImpl) then) =
      __$$TPostMediaListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TPostMedia> tPostMedias});
}

/// @nodoc
class __$$TPostMediaListImplCopyWithImpl<$Res>
    extends _$TPostMediaListCopyWithImpl<$Res, _$TPostMediaListImpl>
    implements _$$TPostMediaListImplCopyWith<$Res> {
  __$$TPostMediaListImplCopyWithImpl(
      _$TPostMediaListImpl _value, $Res Function(_$TPostMediaListImpl) _then)
      : super(_value, _then);

  /// Create a copy of TPostMediaList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tPostMedias = null,
  }) {
    return _then(_$TPostMediaListImpl(
      null == tPostMedias
          ? _value._tPostMedias
          : tPostMedias // ignore: cast_nullable_to_non_nullable
              as List<TPostMedia>,
    ));
  }
}

/// @nodoc

class _$TPostMediaListImpl extends _TPostMediaList {
  const _$TPostMediaListImpl(final List<TPostMedia> tPostMedias)
      : _tPostMedias = tPostMedias,
        super._();

  final List<TPostMedia> _tPostMedias;
  @override
  List<TPostMedia> get tPostMedias {
    if (_tPostMedias is EqualUnmodifiableListView) return _tPostMedias;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tPostMedias);
  }

  @override
  String toString() {
    return 'TPostMediaList(tPostMedias: $tPostMedias)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TPostMediaListImpl &&
            const DeepCollectionEquality()
                .equals(other._tPostMedias, _tPostMedias));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tPostMedias));

  /// Create a copy of TPostMediaList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TPostMediaListImplCopyWith<_$TPostMediaListImpl> get copyWith =>
      __$$TPostMediaListImplCopyWithImpl<_$TPostMediaListImpl>(
          this, _$identity);
}

abstract class _TPostMediaList extends TPostMediaList {
  const factory _TPostMediaList(final List<TPostMedia> tPostMedias) =
      _$TPostMediaListImpl;
  const _TPostMediaList._() : super._();

  @override
  List<TPostMedia> get tPostMedias;

  /// Create a copy of TPostMediaList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TPostMediaListImplCopyWith<_$TPostMediaListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

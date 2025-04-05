// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/t_post_media_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TPostMediaList {
  List<TPostMedia> get tPostMedias;

  /// Create a copy of TPostMediaList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TPostMediaListCopyWith<TPostMediaList> get copyWith =>
      _$TPostMediaListCopyWithImpl<TPostMediaList>(
          this as TPostMediaList, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TPostMediaList &&
            const DeepCollectionEquality()
                .equals(other.tPostMedias, tPostMedias));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(tPostMedias));

  @override
  String toString() {
    return 'TPostMediaList(tPostMedias: $tPostMedias)';
  }
}

/// @nodoc
abstract mixin class $TPostMediaListCopyWith<$Res> {
  factory $TPostMediaListCopyWith(
          TPostMediaList value, $Res Function(TPostMediaList) _then) =
      _$TPostMediaListCopyWithImpl;
  @useResult
  $Res call({List<TPostMedia> tPostMedias});
}

/// @nodoc
class _$TPostMediaListCopyWithImpl<$Res>
    implements $TPostMediaListCopyWith<$Res> {
  _$TPostMediaListCopyWithImpl(this._self, this._then);

  final TPostMediaList _self;
  final $Res Function(TPostMediaList) _then;

  /// Create a copy of TPostMediaList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tPostMedias = null,
  }) {
    return _then(TPostMediaList(
      null == tPostMedias
          ? _self.tPostMedias
          : tPostMedias // ignore: cast_nullable_to_non_nullable
              as List<TPostMedia>,
    ));
  }
}

// dart format on

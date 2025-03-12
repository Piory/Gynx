// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/media_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MediaList {
  List<Media> get medias;

  /// Create a copy of MediaList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MediaListCopyWith<MediaList> get copyWith =>
      _$MediaListCopyWithImpl<MediaList>(this as MediaList, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MediaList &&
            const DeepCollectionEquality().equals(other.medias, medias));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(medias));

  @override
  String toString() {
    return 'MediaList(medias: $medias)';
  }
}

/// @nodoc
abstract mixin class $MediaListCopyWith<$Res> {
  factory $MediaListCopyWith(MediaList value, $Res Function(MediaList) _then) =
      _$MediaListCopyWithImpl;
  @useResult
  $Res call({List<Media> medias});
}

/// @nodoc
class _$MediaListCopyWithImpl<$Res> implements $MediaListCopyWith<$Res> {
  _$MediaListCopyWithImpl(this._self, this._then);

  final MediaList _self;
  final $Res Function(MediaList) _then;

  /// Create a copy of MediaList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medias = null,
  }) {
    return _then(MediaList(
      null == medias
          ? _self.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<Media>,
    ));
  }
}

// dart format on

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/entities/t_post_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TPostMedia _$TPostMediaFromJson(Map<String, dynamic> json) {
  return _TPostMedia.fromJson(json);
}

/// @nodoc
mixin _$TPostMedia {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_id')
  int get postId => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_order')
  int get displayOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  MediaType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this TPostMedia to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TPostMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TPostMediaCopyWith<TPostMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TPostMediaCopyWith<$Res> {
  factory $TPostMediaCopyWith(
          TPostMedia value, $Res Function(TPostMedia) then) =
      _$TPostMediaCopyWithImpl<$Res, TPostMedia>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'post_id') int postId,
      @JsonKey(name: 'display_order') int displayOrder,
      @JsonKey(name: 'type') MediaType type,
      @JsonKey(name: 'url') String url,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt});
}

/// @nodoc
class _$TPostMediaCopyWithImpl<$Res, $Val extends TPostMedia>
    implements $TPostMediaCopyWith<$Res> {
  _$TPostMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TPostMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? displayOrder = null,
    Object? type = null,
    Object? url = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      displayOrder: null == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaType,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TPostMediaImplCopyWith<$Res>
    implements $TPostMediaCopyWith<$Res> {
  factory _$$TPostMediaImplCopyWith(
          _$TPostMediaImpl value, $Res Function(_$TPostMediaImpl) then) =
      __$$TPostMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'post_id') int postId,
      @JsonKey(name: 'display_order') int displayOrder,
      @JsonKey(name: 'type') MediaType type,
      @JsonKey(name: 'url') String url,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt});
}

/// @nodoc
class __$$TPostMediaImplCopyWithImpl<$Res>
    extends _$TPostMediaCopyWithImpl<$Res, _$TPostMediaImpl>
    implements _$$TPostMediaImplCopyWith<$Res> {
  __$$TPostMediaImplCopyWithImpl(
      _$TPostMediaImpl _value, $Res Function(_$TPostMediaImpl) _then)
      : super(_value, _then);

  /// Create a copy of TPostMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? displayOrder = null,
    Object? type = null,
    Object? url = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$TPostMediaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      displayOrder: null == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaType,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TPostMediaImpl extends _TPostMedia {
  const _$TPostMediaImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'post_id') required this.postId,
      @JsonKey(name: 'display_order') required this.displayOrder,
      @JsonKey(name: 'type') required this.type,
      @JsonKey(name: 'url') required this.url,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'deleted_at') required this.deletedAt})
      : super._();

  factory _$TPostMediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$TPostMediaImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'post_id')
  final int postId;
  @override
  @JsonKey(name: 'display_order')
  final int displayOrder;
  @override
  @JsonKey(name: 'type')
  final MediaType type;
  @override
  @JsonKey(name: 'url')
  final String url;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'TPostMedia(id: $id, postId: $postId, displayOrder: $displayOrder, type: $type, url: $url, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TPostMediaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.displayOrder, displayOrder) ||
                other.displayOrder == displayOrder) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, postId, displayOrder, type,
      url, createdAt, updatedAt, deletedAt);

  /// Create a copy of TPostMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TPostMediaImplCopyWith<_$TPostMediaImpl> get copyWith =>
      __$$TPostMediaImplCopyWithImpl<_$TPostMediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TPostMediaImplToJson(
      this,
    );
  }
}

abstract class _TPostMedia extends TPostMedia {
  const factory _TPostMedia(
          {@JsonKey(name: 'id') required final String id,
          @JsonKey(name: 'post_id') required final int postId,
          @JsonKey(name: 'display_order') required final int displayOrder,
          @JsonKey(name: 'type') required final MediaType type,
          @JsonKey(name: 'url') required final String url,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt,
          @JsonKey(name: 'deleted_at') required final DateTime? deletedAt}) =
      _$TPostMediaImpl;
  const _TPostMedia._() : super._();

  factory _TPostMedia.fromJson(Map<String, dynamic> json) =
      _$TPostMediaImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'post_id')
  int get postId;
  @override
  @JsonKey(name: 'display_order')
  int get displayOrder;
  @override
  @JsonKey(name: 'type')
  MediaType get type;
  @override
  @JsonKey(name: 'url')
  String get url;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt;

  /// Create a copy of TPostMedia
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TPostMediaImplCopyWith<_$TPostMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

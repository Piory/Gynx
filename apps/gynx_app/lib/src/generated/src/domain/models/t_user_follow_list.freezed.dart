// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/t_user_follow_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TUserFollowList {
  List<TUserFollow> get tUserFollows;

  /// Create a copy of TUserFollowList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TUserFollowListCopyWith<TUserFollowList> get copyWith =>
      _$TUserFollowListCopyWithImpl<TUserFollowList>(
          this as TUserFollowList, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TUserFollowList &&
            const DeepCollectionEquality()
                .equals(other.tUserFollows, tUserFollows));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(tUserFollows));

  @override
  String toString() {
    return 'TUserFollowList(tUserFollows: $tUserFollows)';
  }
}

/// @nodoc
abstract mixin class $TUserFollowListCopyWith<$Res> {
  factory $TUserFollowListCopyWith(
          TUserFollowList value, $Res Function(TUserFollowList) _then) =
      _$TUserFollowListCopyWithImpl;
  @useResult
  $Res call({List<TUserFollow> tUserFollows});
}

/// @nodoc
class _$TUserFollowListCopyWithImpl<$Res>
    implements $TUserFollowListCopyWith<$Res> {
  _$TUserFollowListCopyWithImpl(this._self, this._then);

  final TUserFollowList _self;
  final $Res Function(TUserFollowList) _then;

  /// Create a copy of TUserFollowList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tUserFollows = null,
  }) {
    return _then(TUserFollowList(
      null == tUserFollows
          ? _self.tUserFollows
          : tUserFollows // ignore: cast_nullable_to_non_nullable
              as List<TUserFollow>,
    ));
  }
}

// dart format on

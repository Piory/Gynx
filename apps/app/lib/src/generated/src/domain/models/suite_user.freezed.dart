// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../domain/models/suite_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SuiteUser {
  VUserDetail get vUserDetail;

  /// Create a copy of SuiteUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuiteUserCopyWith<SuiteUser> get copyWith =>
      _$SuiteUserCopyWithImpl<SuiteUser>(this as SuiteUser, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuiteUser &&
            (identical(other.vUserDetail, vUserDetail) ||
                other.vUserDetail == vUserDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vUserDetail);

  @override
  String toString() {
    return 'SuiteUser(vUserDetail: $vUserDetail)';
  }
}

/// @nodoc
abstract mixin class $SuiteUserCopyWith<$Res> {
  factory $SuiteUserCopyWith(SuiteUser value, $Res Function(SuiteUser) _then) =
      _$SuiteUserCopyWithImpl;
  @useResult
  $Res call({VUserDetail vUserDetail});
}

/// @nodoc
class _$SuiteUserCopyWithImpl<$Res> implements $SuiteUserCopyWith<$Res> {
  _$SuiteUserCopyWithImpl(this._self, this._then);

  final SuiteUser _self;
  final $Res Function(SuiteUser) _then;

  /// Create a copy of SuiteUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vUserDetail = null,
  }) {
    return _then(SuiteUser(
      vUserDetail: null == vUserDetail
          ? _self.vUserDetail
          : vUserDetail // ignore: cast_nullable_to_non_nullable
              as VUserDetail,
    ));
  }
}

// dart format on

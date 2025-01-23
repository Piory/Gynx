// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../presentation/layouts/glass_navigation_bar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NavigationBarItem {
  IconData get selectedIcon => throw _privateConstructorUsedError;
  IconData get unselectedIcon => throw _privateConstructorUsedError;

  /// Create a copy of NavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NavigationBarItemCopyWith<NavigationBarItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationBarItemCopyWith<$Res> {
  factory $NavigationBarItemCopyWith(
          NavigationBarItem value, $Res Function(NavigationBarItem) then) =
      _$NavigationBarItemCopyWithImpl<$Res, NavigationBarItem>;
  @useResult
  $Res call({IconData selectedIcon, IconData unselectedIcon});
}

/// @nodoc
class _$NavigationBarItemCopyWithImpl<$Res, $Val extends NavigationBarItem>
    implements $NavigationBarItemCopyWith<$Res> {
  _$NavigationBarItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIcon = null,
    Object? unselectedIcon = null,
  }) {
    return _then(_value.copyWith(
      selectedIcon: null == selectedIcon
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as IconData,
      unselectedIcon: null == unselectedIcon
          ? _value.unselectedIcon
          : unselectedIcon // ignore: cast_nullable_to_non_nullable
              as IconData,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NavigationBarItemImplCopyWith<$Res>
    implements $NavigationBarItemCopyWith<$Res> {
  factory _$$NavigationBarItemImplCopyWith(_$NavigationBarItemImpl value,
          $Res Function(_$NavigationBarItemImpl) then) =
      __$$NavigationBarItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IconData selectedIcon, IconData unselectedIcon});
}

/// @nodoc
class __$$NavigationBarItemImplCopyWithImpl<$Res>
    extends _$NavigationBarItemCopyWithImpl<$Res, _$NavigationBarItemImpl>
    implements _$$NavigationBarItemImplCopyWith<$Res> {
  __$$NavigationBarItemImplCopyWithImpl(_$NavigationBarItemImpl _value,
      $Res Function(_$NavigationBarItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of NavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIcon = null,
    Object? unselectedIcon = null,
  }) {
    return _then(_$NavigationBarItemImpl(
      selectedIcon: null == selectedIcon
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as IconData,
      unselectedIcon: null == unselectedIcon
          ? _value.unselectedIcon
          : unselectedIcon // ignore: cast_nullable_to_non_nullable
              as IconData,
    ));
  }
}

/// @nodoc

class _$NavigationBarItemImpl implements _NavigationBarItem {
  const _$NavigationBarItemImpl(
      {required this.selectedIcon, required this.unselectedIcon});

  @override
  final IconData selectedIcon;
  @override
  final IconData unselectedIcon;

  @override
  String toString() {
    return 'NavigationBarItem(selectedIcon: $selectedIcon, unselectedIcon: $unselectedIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationBarItemImpl &&
            (identical(other.selectedIcon, selectedIcon) ||
                other.selectedIcon == selectedIcon) &&
            (identical(other.unselectedIcon, unselectedIcon) ||
                other.unselectedIcon == unselectedIcon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedIcon, unselectedIcon);

  /// Create a copy of NavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationBarItemImplCopyWith<_$NavigationBarItemImpl> get copyWith =>
      __$$NavigationBarItemImplCopyWithImpl<_$NavigationBarItemImpl>(
          this, _$identity);
}

abstract class _NavigationBarItem implements NavigationBarItem {
  const factory _NavigationBarItem(
      {required final IconData selectedIcon,
      required final IconData unselectedIcon}) = _$NavigationBarItemImpl;

  @override
  IconData get selectedIcon;
  @override
  IconData get unselectedIcon;

  /// Create a copy of NavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NavigationBarItemImplCopyWith<_$NavigationBarItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../presentation/layouts/glass_navigation_bar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NavigationBarItem {
  IconData get selectedIcon;
  IconData get unselectedIcon;

  /// Create a copy of NavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NavigationBarItemCopyWith<NavigationBarItem> get copyWith =>
      _$NavigationBarItemCopyWithImpl<NavigationBarItem>(
          this as NavigationBarItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NavigationBarItem &&
            (identical(other.selectedIcon, selectedIcon) ||
                other.selectedIcon == selectedIcon) &&
            (identical(other.unselectedIcon, unselectedIcon) ||
                other.unselectedIcon == unselectedIcon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedIcon, unselectedIcon);

  @override
  String toString() {
    return 'NavigationBarItem(selectedIcon: $selectedIcon, unselectedIcon: $unselectedIcon)';
  }
}

/// @nodoc
abstract mixin class $NavigationBarItemCopyWith<$Res> {
  factory $NavigationBarItemCopyWith(
          NavigationBarItem value, $Res Function(NavigationBarItem) _then) =
      _$NavigationBarItemCopyWithImpl;
  @useResult
  $Res call({IconData selectedIcon, IconData unselectedIcon});
}

/// @nodoc
class _$NavigationBarItemCopyWithImpl<$Res>
    implements $NavigationBarItemCopyWith<$Res> {
  _$NavigationBarItemCopyWithImpl(this._self, this._then);

  final NavigationBarItem _self;
  final $Res Function(NavigationBarItem) _then;

  /// Create a copy of NavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIcon = null,
    Object? unselectedIcon = null,
  }) {
    return _then(NavigationBarItem(
      selectedIcon: null == selectedIcon
          ? _self.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as IconData,
      unselectedIcon: null == unselectedIcon
          ? _self.unselectedIcon
          : unselectedIcon // ignore: cast_nullable_to_non_nullable
              as IconData,
    ));
  }
}

// dart format on

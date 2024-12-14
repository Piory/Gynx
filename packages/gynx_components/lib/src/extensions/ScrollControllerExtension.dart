import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

ScrollDirection _lastScrollDirection = ScrollDirection.idle;

extension ScrollControllerExtension on ScrollController {
  void scrollToTop() {
    // 一番上までスクロール済みの場合は何もしない
    if (position.minScrollExtent == position.pixels) {
      return;
    }
    animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

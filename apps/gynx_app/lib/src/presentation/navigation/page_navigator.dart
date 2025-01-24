import 'package:flutter/material.dart';
import 'package:gynx_app/src/presentation/navigation/page_type.dart';

abstract interface class PageNavigator {
  void pop<T extends Object?>(BuildContext context, [T? result]);

  void push(
    BuildContext context,
    PageType pageType, {
    Map<String, dynamic>? pathParams,
    Map<String, dynamic>? queryParams,
  });

  void go(
    BuildContext context,
    PageType pageType, {
    Map<String, dynamic>? pathParams,
    Map<String, dynamic>? queryParams,
  });

  void pushReplacement(
    BuildContext context,
    PageType pageType, {
    Map<String, dynamic>? pathParams,
    Map<String, dynamic>? queryParams,
  });
}

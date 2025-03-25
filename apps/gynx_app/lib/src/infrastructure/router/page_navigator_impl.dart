import 'package:flutter/material.dart' hide Router;
import 'package:go_router/go_router.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/navigation/page_type.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PageNavigator)
class PageNavigatorImpl implements PageNavigator {
  @override
  void pop<T extends Object?>(BuildContext context, [T? result]) {
    context.pop<T>(result);
  }

  @override
  void push(
    BuildContext context,
    PageType pageType, {
    Map<String, dynamic>? pathParams,
    Map<String, dynamic>? queryParams,
  }) {
    context.push(pageType.buildPath(pathParams, queryParams));
  }

  @override
  void go(
    BuildContext context,
    PageType pageType, {
    Map<String, dynamic>? pathParams,
    Map<String, dynamic>? queryParams,
  }) {
    context.go(pageType.buildPath(pathParams, queryParams));
  }

  @override
  void pushReplacement(
    BuildContext context,
    PageType pageType, {
    Map<String, dynamic>? pathParams,
    Map<String, dynamic>? queryParams,
  }) {
    context.pushReplacement(pageType.buildPath(pathParams, queryParams));
  }
}

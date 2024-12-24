import 'package:flutter/material.dart' hide Router;
import 'package:go_router/go_router.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/navigation/page_type.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: PageNavigator)
class PageNavigatorImpl implements PageNavigator {
  @override
  void pop<T extends Object?>(BuildContext context, [T? result]) {
    context.pop<T>(result);
  }

  @override
  void push(BuildContext context, PageType pageType) {
    context.push(pageType.path);
  }

  @override
  void go(BuildContext context, PageType pageType) {
    context.go(pageType.path);
  }

  @override
  void pushReplacement(BuildContext context, PageType pageType) {
    context.pushReplacement(pageType.path);
  }
}

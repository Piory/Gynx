import 'package:flutter/material.dart' hide Router;
import 'package:go_router/go_router.dart';
import 'package:gynx_app/src/interface/router/page_router.dart';
import 'package:gynx_app/src/interface/router/page_type.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: PageRouter)
class PageRouterImpl implements PageRouter {
  @override
  void pop(BuildContext context) {
    context.pop();
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

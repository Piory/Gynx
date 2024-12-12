import 'package:flutter/material.dart';
import 'package:gynx_app/src/interface/router/page_type.dart';

abstract interface class PageRouter {
  void pop(BuildContext context);

  void push(BuildContext context, PageType pageType);

  void go(BuildContext context, PageType pageType);

  void pushReplacement(BuildContext context, PageType pageType);
}

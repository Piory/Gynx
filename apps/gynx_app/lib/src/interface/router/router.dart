import 'package:flutter/material.dart';

abstract interface class Router {
  void pop(BuildContext context);

  void push(BuildContext context, String route);

  void pushReplacement(BuildContext context, String route);
}

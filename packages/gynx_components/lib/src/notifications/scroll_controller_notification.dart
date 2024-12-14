import 'package:flutter/material.dart';

class ScrollControllerNotification extends Notification {
  const ScrollControllerNotification({
    required this.controller,
  });

  final ScrollController controller;
}

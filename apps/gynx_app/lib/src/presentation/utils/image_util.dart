// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageUtil {
  static ImageProvider imageProvider(String avatarUrl) {
    if (_isHttp(avatarUrl)) {
      return CachedNetworkImageProvider(avatarUrl);
    } else {
      return FileImage(File(avatarUrl));
    }
  }

  static bool _isHttp(String url) {
    return url.startsWith('http');
  }
}

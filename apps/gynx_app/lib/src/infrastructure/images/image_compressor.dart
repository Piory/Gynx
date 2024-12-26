import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:injectable/injectable.dart';

@singleton
class ImageCompressor {
  const ImageCompressor();

  Future<Uint8List> compress(File file) async {
    final bytes = await FlutterImageCompress.compressWithFile(
      file.path,
      quality: 90,
      minWidth: 480,
      minHeight: 480,
    );
    if (bytes == null) {
      throw Exception('Compressed bytes is null.');
    }
    return bytes;
  }
}

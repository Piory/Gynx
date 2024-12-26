import 'dart:io';

import 'package:gynx_app/src/domain/enums/storage_type.dart';

abstract interface class StorageRepository {
  Future<String> uploadFile({
    required StorageType storageType,
    required String path,
    required String filename,
    required File file,
  });

  Future<void> deleteFile({
    required StorageType storageType,
    required String path,
  });
}

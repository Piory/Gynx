import 'dart:io';

import 'package:gynx_app/src/domain/enums/storage_type.dart';
import 'package:gynx_app/src/domain/repositories/storage_repository.dart';
import 'package:gynx_app/src/infrastructure/images/image_compressor.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Singleton(as: StorageRepository)
class StorageRepositoryImpl implements StorageRepository {
  const StorageRepositoryImpl(
    this._client,
    this._imageCompressor,
  );

  final SupabaseClient _client;
  final ImageCompressor _imageCompressor;

  @override
  Future<String> uploadFile({
    required StorageType storageType,
    required String path,
    required String filename,
    required File file,
  }) async {
    final bucket = _client.storage.from(storageType.id);
    final uploadPath = '$path/$filename';
    await bucket.uploadBinary(
      uploadPath,
      await _imageCompressor.compress(file),
      fileOptions: const FileOptions(
        contentType: 'image/jpeg',
      ),
    );
    return bucket.getPublicUrl(uploadPath);
  }

  @override
  Future<void> deleteFile({
    required StorageType storageType,
    required String path,
  }) async {
    await _client.storage.from(storageType.id).remove([path]);
  }
}

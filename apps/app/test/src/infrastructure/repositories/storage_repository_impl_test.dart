// ignore_for_file: lines_longer_than_80_chars
import 'dart:io';
import 'dart:typed_data';

import 'package:app/src/domain/enums/storage_type.dart';
import 'package:app/src/infrastructure/images/image_compressor.dart';
import 'package:app/src/infrastructure/repositories/storage_repository_impl.dart';
import 'package:faker/faker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/test.dart';

import 'storage_repository_impl_test.mocks.dart';

class MockSupabaseClientWithStorageMock extends MockSupabaseClient {
  MockSupabaseClientWithStorageMock(this._mockStorageClient);

  final SupabaseStorageClient _mockStorageClient;

  @override
  SupabaseStorageClient get storage => _mockStorageClient;
}

@GenerateNiceMocks([
  MockSpec<SupabaseClient>(),
  MockSpec<SupabaseStorageClient>(),
  MockSpec<StorageFileApi>(),
  MockSpec<ImageCompressor>(),
  MockSpec<File>(),
])
void main() {
  final mockSupabaseStorageClient = MockSupabaseStorageClient();
  final mockSupabaseClient = MockSupabaseClientWithStorageMock(mockSupabaseStorageClient);
  final mockStorageFileApi = MockStorageFileApi();
  final mockImageCompressor = MockImageCompressor();
  final repository = StorageRepositoryImpl(
    mockSupabaseClient,
    mockImageCompressor,
  );

  tearDown(() {
    verifyNoMoreInteractions(mockSupabaseClient);
    verifyNoMoreInteractions(mockSupabaseStorageClient);
    verifyNoMoreInteractions(mockStorageFileApi);
    verifyNoMoreInteractions(mockImageCompressor);
    reset(mockSupabaseClient);
    reset(mockSupabaseStorageClient);
    reset(mockStorageFileApi);
    reset(mockImageCompressor);
  });

  for (final storageType in [
    StorageType.users,
  ]) {
    group('#uploadFile', () {
      group('正常系', () {
        test(
          '対象バケットのファイルのアップロード処理が呼ばれること (StorageType: $storageType)',
          () async {
            final fileBinary = Uint8List.fromList([1, 2, 3]);
            final mockFile = MockFile();
            final path = faker.guid.guid();
            final filename = faker.guid.guid();
            final uploadPath = '$path/$filename';
            final publicUrl = '${faker.internet.httpsUrl()}/$uploadPath';
            when(mockSupabaseStorageClient.from(storageType.id)).thenAnswer((_) => mockStorageFileApi);
            when(mockImageCompressor.compress(mockFile)).thenAnswer((_) async => fileBinary);
            when(
              mockStorageFileApi.uploadBinary(
                uploadPath,
                fileBinary,
                fileOptions: const FileOptions(
                  contentType: 'image/jpeg',
                ),
              ),
            ).thenAnswer((_) async => '');
            when(mockStorageFileApi.getPublicUrl(uploadPath)).thenReturn(publicUrl);
            await repository.uploadFile(
              storageType: storageType,
              path: path,
              filename: filename,
              file: mockFile,
            );
            verifyInOrder([
              mockSupabaseStorageClient.from(storageType.id),
              mockImageCompressor.compress(mockFile),
              mockStorageFileApi.uploadBinary(
                uploadPath,
                fileBinary,
                fileOptions: const FileOptions(
                  contentType: 'image/jpeg',
                ),
              ),
              mockStorageFileApi.getPublicUrl(uploadPath),
            ]);
          },
        );
      });
    });

    group('#deleteFile', () {
      group('正常系', () {
        test('対象バケットのファイルの削除処理が呼ばれること (StorageType: $storageType)', () async {
          final path = faker.guid.guid();
          when(mockSupabaseStorageClient.from(storageType.id)).thenAnswer((_) => mockStorageFileApi);
          when(mockStorageFileApi.remove([path]));
          await repository.deleteFile(
            storageType: storageType,
            path: path,
          );
          verifyInOrder([
            mockSupabaseStorageClient.from(storageType.id),
            mockStorageFileApi.remove([path]),
          ]);
        });
      });
    });
  }
}

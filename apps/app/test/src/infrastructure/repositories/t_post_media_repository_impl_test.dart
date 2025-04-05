import 'package:app/src/domain/models/t_post_media_list.dart';
import 'package:app/src/infrastructure/repositories/t_post_media_repository_impl.dart';
import 'package:faker/faker.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';

void main() {
  const tableName = TPostMediaRepositoryImpl.tableName;
  final mockHttpClient = MockSupabaseHttpClient();
  final mockSupabaseClient = SupabaseClient(
    faker.internet.httpsUrl(),
    faker.guid.guid(),
    httpClient: mockHttpClient,
  );
  final tPostMedia1 = generateDummyTPostMedia();
  final tPostMedia2 = generateDummyTPostMedia().copyWith(
    postId: tPostMedia1.postId,
    displayOrder: tPostMedia1.displayOrder + 1,
  );
  final tPostMediaRepository = TPostMediaRepositoryImpl(mockSupabaseClient);

  tearDown(mockHttpClient.reset);

  tearDownAll(mockHttpClient.close);

  group('#create', () {
    group('正常系', () {
      test('正常にデータが1件作成されること', () async {
        await tPostMediaRepository.create(tPostMedia1);
        final res = await mockSupabaseClient.from(tableName).select().single();
        expect(res, tPostMedia1.toJson());
      });
    });
  });

  group('#findByPrimaryKey', () {
    group('正常系', () {
      test('正常にデータが1件取得されること', () async {
        await mockSupabaseClient.from(tableName).insert(tPostMedia1.toJson());
        await mockSupabaseClient.from(tableName).insert(tPostMedia2.toJson());
        final foundTPostMedia = await tPostMediaRepository.findByPrimaryKey(
          tPostMedia1.id,
        );
        expect(foundTPostMedia, tPostMedia1);
      });
    });
  });

  group('#findByPostId', () {
    group('正常系', () {
      test('正常にデータが2件取得されること', () async {
        await mockSupabaseClient.from(tableName).insert(tPostMedia1.toJson());
        await mockSupabaseClient.from(tableName).insert(tPostMedia2.toJson());
        final foundTPostMediaList = await tPostMediaRepository.findByPostId(
          tPostMedia1.postId,
        );
        expect(foundTPostMediaList, TPostMediaList([tPostMedia1, tPostMedia2]));
      });
    });
  });
}

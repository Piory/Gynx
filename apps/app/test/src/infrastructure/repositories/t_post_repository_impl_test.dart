import 'package:app/src/domain/models/t_post_list.dart';
import 'package:app/src/infrastructure/repositories/t_post_repository_impl.dart';
import 'package:faker/faker.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';

void main() {
  const tableName = TPostRepositoryImpl.tableName;
  final mockHttpClient = MockSupabaseHttpClient();
  final mockSupabaseClient = SupabaseClient(
    faker.internet.httpsUrl(),
    faker.guid.guid(),
    httpClient: mockHttpClient,
  );
  final tPost1 = generateDummyTPost();
  final tPost2 = generateDummyTPost().copyWith(
    id: tPost1.id + 1,
    userId: tPost1.userId,
  );
  final tPostRepository = TPostRepositoryImpl(mockSupabaseClient);

  tearDown(mockHttpClient.reset);

  tearDownAll(mockHttpClient.close);

  group('#create', () {
    group('正常系', () {
      test('正常にデータが1件作成されること', () async {
        await tPostRepository.create(tPost1);
        final res = await mockSupabaseClient.from(tableName).select().single();
        expect(res, tPost1.toJson());
      });
    });
  });

  group('#findByPrimaryKey', () {
    group('正常系', () {
      test('正常にデータが1件取得されること', () async {
        await mockSupabaseClient.from(tableName).insert(tPost1.toJson());
        await mockSupabaseClient.from(tableName).insert(tPost2.toJson());
        final foundTPost = await tPostRepository.findByPrimaryKey(
          tPost1.id,
        );
        expect(foundTPost, tPost1);
      });
    });
  });

  group('#findByUserId', () {
    group('正常系', () {
      test('正常にデータが2件取得されること', () async {
        await mockSupabaseClient.from(tableName).insert(tPost1.toJson());
        await mockSupabaseClient.from(tableName).insert(tPost2.toJson());
        final foundTPostList = await tPostRepository.findByUserId(
          tPost1.userId,
        );
        expect(foundTPostList, TPostList([tPost1, tPost2]));
      });
    });
  });
}

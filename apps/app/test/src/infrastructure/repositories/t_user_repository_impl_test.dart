import 'package:app/src/infrastructure/repositories/t_user_repository_impl.dart';
import 'package:faker/faker.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';

void main() {
  const tableName = TUserRepositoryImpl.tableName;
  final mockHttpClient = MockSupabaseHttpClient();
  final mockSupabaseClient = SupabaseClient(
    faker.internet.httpsUrl(),
    faker.guid.guid(),
    httpClient: mockHttpClient,
  );
  final tUserRepository = TUserRepositoryImpl(mockSupabaseClient);
  final tUser = generateDummyTUser();

  tearDown(mockHttpClient.reset);

  tearDownAll(mockHttpClient.close);

  group('#findByPrimaryKey', () {
    group('正常系', () {
      test('正常にデータが1件取得されること', () async {
        await mockSupabaseClient.from(tableName).insert(tUser.toJson());
        final foundTUser = await tUserRepository.findByPrimaryKey(tUser.id);
        expect(foundTUser, tUser);
      });
    });
  });

  group('#findByScreenName', () {
    group('正常系', () {
      test('正常にデータが1件取得されること', () async {
        await mockSupabaseClient.from(tableName).insert(tUser.toJson());
        final foundTUser = await tUserRepository.findByScreenName(tUser.screenName);
        expect(foundTUser, tUser);
      });
    });
  });

  group('#existsByScreenName', () {
    group('正常系', () {
      test('データが存在しない場合、false が取得できること', () async {
        final count = await tUserRepository.existsByScreenName(tUser.screenName);
        expect(count, isFalse);
      });

      test('データが存在する場合は、true が取得できること', () async {
        await mockSupabaseClient.from(tableName).insert(tUser.toJson());
        final count = await tUserRepository.existsByScreenName(tUser.screenName);
        expect(count, isTrue);
      });
    });
  });

  group('#updateByPrimaryKey', () {
    group('正常系', () {
      test('正常にデータが1件更新されること', () async {
        await mockSupabaseClient.from(tableName).insert(tUser.toJson());
        final newScreenName = faker.guid.guid();
        await tUserRepository.updateByPrimaryKey(
          id: tUser.id,
          screenName: newScreenName,
        );
        expect(await mockSupabaseClient.from(tableName).select(), [
          {
            'id': tUser.id,
            'screen_name': newScreenName,
            'created_at': tUser.createdAt.toIso8601String(),
            'updated_at': tUser.updatedAt.toIso8601String(),
            'deleted_at': tUser.deletedAt?.toIso8601String(),
          },
        ]);
      });
    });
  });
}

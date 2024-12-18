import 'package:faker/faker.dart';
import 'package:gynx_app/src/infrastructure/repositories/t_user_repository_impl.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';

void main() {
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

  group('#update', () {
    group('正常系', () {
      test('正常にデータが1件更新されること', () async {
        await mockSupabaseClient
            .from(TUserRepositoryImpl.tableName)
            .insert(tUser.toJson());
        final updatedTUser = tUser.copyWith(gynxId: 'updated_gynx_id');
        await tUserRepository.update(updatedTUser);
        expect(await mockSupabaseClient.from('t_users').select(), [
          {
            'id': updatedTUser.id,
            'gynx_id': updatedTUser.gynxId,
            'created_at': updatedTUser.createdAt.toIso8601String(),
            'updated_at': updatedTUser.updatedAt.toIso8601String(),
            'deleted_at': tUser.deletedAt?.toIso8601String(),
          }
        ]);
      });
    });
  });

  group('#findById', () {
    group('正常系', () {
      test('正常にデータが1件取得されること', () async {
        await mockSupabaseClient
            .from(TUserRepositoryImpl.tableName)
            .insert(tUser.toJson());
        final foundTUser = await tUserRepository.findById(tUser.id);
        expect(foundTUser, tUser);
      });
    });
  });

  group('#findByGynxId', () {
    group('正常系', () {
      test('正常にデータが1件取得されること', () async {
        await mockSupabaseClient
            .from(TUserRepositoryImpl.tableName)
            .insert(tUser.toJson());
        final foundTUser = await tUserRepository.findByGynxId(tUser.gynxId);
        expect(foundTUser, tUser);
      });
    });
  });
}

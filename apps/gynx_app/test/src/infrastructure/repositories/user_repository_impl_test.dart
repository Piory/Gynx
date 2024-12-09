import 'package:faker/faker.dart';
import 'package:gynx_app/src/infrastructure/repositories/user_repository_impl.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';

void main() {
  final faker = Faker();
  final mockHttpClient = MockSupabaseHttpClient();
  final mockSupabaseClient = SupabaseClient(
    faker.internet.httpsUrl(),
    faker.guid.guid(),
    httpClient: mockHttpClient,
  );
  final userRepository = UserRepositoryImpl(mockSupabaseClient);
  final user = generateDummyUser();

  tearDown(mockHttpClient.reset);

  tearDownAll(mockHttpClient.close);

  group('#create', () {
    group('正常系', () {
      test('正常にデータが1件作成されること', () async {
        expect(await mockSupabaseClient.from('t_users').count(), 0);
        await userRepository.create(user);
        expect(await mockSupabaseClient.from('t_users').select(), [
          {
            'id': user.id,
            'auth_user_id': user.authUserId,
            'created_at': user.createdAt.toIso8601String(),
            'updated_at': user.updatedAt.toIso8601String(),
            'deleted_at': user.deletedAt?.toIso8601String(),
          }
        ]);
      });
    });
  });

  group('#update', () {
    group('正常系', () {
      test('正常にデータが1件更新されること', () async {
        await mockSupabaseClient.from('t_users').insert(user.toJson());
        final updatedUser = user.copyWith(authUserId: 'updated_auth_user_id');
        await userRepository.update(updatedUser);
        expect(await mockSupabaseClient.from('t_users').select(), [
          {
            'id': updatedUser.id,
            'auth_user_id': updatedUser.authUserId,
            'created_at': updatedUser.createdAt.toIso8601String(),
            'updated_at': updatedUser.updatedAt.toIso8601String(),
            'deleted_at': user.deletedAt?.toIso8601String(),
          }
        ]);
      });
    });
  });

  group('#findById', () {
    group('正常系', () {
      test('正常にデータが1件取得されること', () async {
        await mockSupabaseClient.from('t_users').insert(user.toJson());
        final foundUser = await userRepository.findById(user.id);
        expect(foundUser, user);
      });
    });
  });

  group('#findByAuthUserId', () {
    group('正常系', () {
      test('正常にデータが1件取得されること', () async {
        await mockSupabaseClient.from('t_users').insert(user.toJson());
        final foundUser =
            await userRepository.findByAuthUserId(user.authUserId);
        expect(foundUser, user);
      });
    });
  });
}

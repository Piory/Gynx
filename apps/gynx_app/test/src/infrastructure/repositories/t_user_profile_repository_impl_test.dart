import 'package:faker/faker.dart';
import 'package:gynx_app/src/infrastructure/repositories/t_user_profile_repository_impl.dart';
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
  final tUserProfileRepository = TUserProfileRepositoryImpl(mockSupabaseClient);
  final tUserProfile = generateDummyTUserProfile();

  tearDown(mockHttpClient.reset);

  tearDownAll(mockHttpClient.close);

  group('#update', () {
    group('正常系', () {
      test('正常にデータが1件更新されること', () async {
        await mockSupabaseClient
            .from(TUserProfileRepositoryImpl.tableName)
            .insert(tUserProfile.toJson());
        final updatedTUserProfile = tUserProfile.copyWith(
          username: 'updated_username',
          avatarUrl: 'updated_avatar_url',
          selfIntroduction: 'updated_self_introduction',
        );
        await tUserProfileRepository.update(updatedTUserProfile);
        expect(
            await mockSupabaseClient
                .from(TUserProfileRepositoryImpl.tableName)
                .select(),
            [
              {
                'user_id': updatedTUserProfile.userId,
                'username': updatedTUserProfile.username,
                'avatar_url': updatedTUserProfile.avatarUrl,
                'self_introduction': updatedTUserProfile.selfIntroduction,
                'created_at': updatedTUserProfile.createdAt.toIso8601String(),
                'updated_at': updatedTUserProfile.updatedAt.toIso8601String(),
                'deleted_at': tUserProfile.deletedAt?.toIso8601String(),
              }
            ]);
      });
    });
  });

  group('#findByUserId', () {
    group('正常系', () {
      test('正常にデータが1件取得されること', () async {
        await mockSupabaseClient
            .from(TUserProfileRepositoryImpl.tableName)
            .insert(tUserProfile.toJson());
        final foundTUserProfile =
            await tUserProfileRepository.findByUserId(tUserProfile.userId);
        expect(foundTUserProfile, tUserProfile);
      });
    });
  });
}

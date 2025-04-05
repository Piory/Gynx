import 'package:app/src/infrastructure/repositories/t_user_profile_repository_impl.dart';
import 'package:faker/faker.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';

void main() {
  const tableName = TUserProfileRepositoryImpl.tableName;
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

  group('#findByPrimaryKey', () {
    group('正常系', () {
      test('正常にデータが1件取得されること', () async {
        await mockSupabaseClient.from(tableName).insert(tUserProfile.toJson());
        expect(
          await tUserProfileRepository.findByPrimaryKey(tUserProfile.userId),
          tUserProfile,
        );
      });
    });
  });

  group('#updateByPrimaryKeySelective', () {
    group('正常系', () {
      test('username, avatar_url, self_introduction が更新されること', () async {
        await mockSupabaseClient.from(tableName).insert(tUserProfile.toJson());
        await tUserProfileRepository.updateByPrimaryKeySelective(
          userId: tUserProfile.userId,
          username: 'updated_username',
          avatarUrl: 'updated_avatar_url',
          selfIntroduction: 'updated_self_introduction',
        );
        expect(
          await mockSupabaseClient.from(tableName).select(),
          [
            {
              'user_id': tUserProfile.userId,
              'username': 'updated_username',
              'avatar_url': 'updated_avatar_url',
              'self_introduction': 'updated_self_introduction',
              'created_at': tUserProfile.createdAt.toIso8601String(),
              'updated_at': tUserProfile.updatedAt.toIso8601String(),
              'deleted_at': tUserProfile.deletedAt?.toIso8601String(),
            },
          ],
        );
      });

      test('username のみの更新も行えること', () async {
        await mockSupabaseClient.from(tableName).insert(tUserProfile.toJson());
        await tUserProfileRepository.updateByPrimaryKeySelective(
          userId: tUserProfile.userId,
          username: 'updated_username',
          avatarUrl: null,
          selfIntroduction: null,
        );
        expect(
          await mockSupabaseClient.from(tableName).select(),
          [
            {
              'user_id': tUserProfile.userId,
              'username': 'updated_username',
              'avatar_url': tUserProfile.avatarUrl,
              'self_introduction': tUserProfile.selfIntroduction,
              'created_at': tUserProfile.createdAt.toIso8601String(),
              'updated_at': tUserProfile.updatedAt.toIso8601String(),
              'deleted_at': tUserProfile.deletedAt?.toIso8601String(),
            },
          ],
        );
      });

      test('avatar_url のみの更新も行えること', () async {
        await mockSupabaseClient.from(tableName).insert(tUserProfile.toJson());
        await tUserProfileRepository.updateByPrimaryKeySelective(
          userId: tUserProfile.userId,
          username: null,
          avatarUrl: 'updated_avatar_url',
          selfIntroduction: null,
        );
        expect(
          await mockSupabaseClient.from(tableName).select(),
          [
            {
              'user_id': tUserProfile.userId,
              'username': tUserProfile.username,
              'avatar_url': 'updated_avatar_url',
              'self_introduction': tUserProfile.selfIntroduction,
              'created_at': tUserProfile.createdAt.toIso8601String(),
              'updated_at': tUserProfile.updatedAt.toIso8601String(),
              'deleted_at': tUserProfile.deletedAt?.toIso8601String(),
            },
          ],
        );
      });

      test(
        'isDeleteAvatarUrl を true にすると avatar_url に null が設定されること',
        () async {
          await mockSupabaseClient.from(tableName).insert(tUserProfile.toJson());
          await tUserProfileRepository.updateByPrimaryKeySelective(
            userId: tUserProfile.userId,
            username: null,
            avatarUrl: 'updated_avatar_url',
            isDeleteAvatarUrl: true,
            selfIntroduction: null,
          );
          expect(
            await mockSupabaseClient.from(tableName).select(),
            [
              {
                'user_id': tUserProfile.userId,
                'username': tUserProfile.username,
                'avatar_url': null,
                'self_introduction': tUserProfile.selfIntroduction,
                'created_at': tUserProfile.createdAt.toIso8601String(),
                'updated_at': tUserProfile.updatedAt.toIso8601String(),
                'deleted_at': tUserProfile.deletedAt?.toIso8601String(),
              },
            ],
          );
        },
      );

      test('self_introduction のみの更新も行えること', () async {
        await mockSupabaseClient.from(tableName).insert(tUserProfile.toJson());
        await tUserProfileRepository.updateByPrimaryKeySelective(
          userId: tUserProfile.userId,
          username: null,
          avatarUrl: null,
          selfIntroduction: 'updated_self_introduction',
        );
        expect(
          await mockSupabaseClient.from(tableName).select(),
          [
            {
              'user_id': tUserProfile.userId,
              'username': tUserProfile.username,
              'avatar_url': tUserProfile.avatarUrl,
              'self_introduction': 'updated_self_introduction',
              'created_at': tUserProfile.createdAt.toIso8601String(),
              'updated_at': tUserProfile.updatedAt.toIso8601String(),
              'deleted_at': tUserProfile.deletedAt?.toIso8601String(),
            },
          ],
        );
      });
    });
  });
}

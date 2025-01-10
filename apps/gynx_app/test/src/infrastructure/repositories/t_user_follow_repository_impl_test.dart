import 'package:faker/faker.dart';
import 'package:gynx_app/src/domain/models/t_user_follow_list.dart';
import 'package:gynx_app/src/infrastructure/repositories/t_user_follow_repository_impl.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';

void main() {
  const tableName = TUserFollowRepositoryImpl.tableName;
  final mockHttpClient = MockSupabaseHttpClient();
  final mockSupabaseClient = SupabaseClient(
    faker.internet.httpsUrl(),
    faker.guid.guid(),
    httpClient: mockHttpClient,
  );
  final tUserFollow1 = generateDummyTUserFollow();
  final tUserFollow2 = generateDummyTUserFollow();
  final tUserFollowRepository = TUserFollowRepositoryImpl(
    mockSupabaseClient,
  );

  tearDown(mockHttpClient.reset);

  tearDownAll(mockHttpClient.close);

  group('#create', () {
    group('正常系', () {
      test('正常にデータが1件作成されること', () async {
        await tUserFollowRepository.create(tUserFollow1);
        final res = await mockSupabaseClient.from(tableName).select().single();
        expect(res, tUserFollow1.toJson());
      });
    });
  });

  group('#findByPrimaryKey', () {
    group('正常系', () {
      test('正常にデータが1件取得されること', () async {
        await mockSupabaseClient.from(tableName).insert(tUserFollow1.toJson());
        await mockSupabaseClient.from(tableName).insert(tUserFollow2.toJson());
        final foundTUserFollow = await tUserFollowRepository.findByPrimaryKey(
          tUserFollow1.id,
        );
        expect(foundTUserFollow, tUserFollow1);
      });
    });
  });

  group('#findByUserId', () {
    group('正常系', () {
      test('正常にデータが2件取得されること', () async {
        final tUserFollow2 = generateDummyTUserFollow().copyWith(
          userId: tUserFollow1.userId,
        );
        await mockSupabaseClient.from(tableName).insert(tUserFollow1.toJson());
        await mockSupabaseClient.from(tableName).insert(tUserFollow2.toJson());
        final foundTUserFollowList = await tUserFollowRepository.findByUserId(
          tUserFollow1.userId,
        );
        expect(
          foundTUserFollowList,
          TUserFollowList(
            [
              tUserFollow1,
              tUserFollow2,
            ],
          ),
        );
      });
    });
  });

  group('#findByFollowUserId', () {
    group('正常系', () {
      test('正常にデータが2件取得されること', () async {
        final tUserFollow2 = generateDummyTUserFollow().copyWith(
          followUserId: tUserFollow1.followUserId,
        );
        await mockSupabaseClient.from(tableName).insert(tUserFollow1.toJson());
        await mockSupabaseClient.from(tableName).insert(tUserFollow2.toJson());
        final foundTUserFollowList =
            await tUserFollowRepository.findByFollowUserId(
          tUserFollow1.followUserId,
        );
        expect(
          foundTUserFollowList,
          TUserFollowList(
            [
              tUserFollow1,
              tUserFollow2,
            ],
          ),
        );
      });
    });
  });
}

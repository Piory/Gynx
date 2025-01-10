import 'package:faker/faker.dart';
import 'package:gynx_app/src/domain/models/t_user_post_favorite_list.dart';
import 'package:gynx_app/src/infrastructure/repositories/t_user_post_favorite_repository_impl.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';

void main() {
  const tableName = TUserPostFavoriteRepositoryImpl.tableName;
  final mockHttpClient = MockSupabaseHttpClient();
  final mockSupabaseClient = SupabaseClient(
    faker.internet.httpsUrl(),
    faker.guid.guid(),
    httpClient: mockHttpClient,
  );
  final tUserPostFavorite1 = generateDummyTUserPostFavorite();
  final tUserPostFavorite2 = generateDummyTUserPostFavorite();
  final tUserPostFavoriteRepository = TUserPostFavoriteRepositoryImpl(
    mockSupabaseClient,
  );

  tearDown(mockHttpClient.reset);

  tearDownAll(mockHttpClient.close);

  group('#create', () {
    group('正常系', () {
      test('正常にデータが1件作成されること', () async {
        await tUserPostFavoriteRepository.create(tUserPostFavorite1);
        final res = await mockSupabaseClient.from(tableName).select().single();
        expect(res, tUserPostFavorite1.toJson());
      });
    });
  });

  group('#findByPrimaryKey', () {
    group('正常系', () {
      test('正常にデータが1件取得されること', () async {
        await mockSupabaseClient
            .from(tableName)
            .insert(tUserPostFavorite1.toJson());
        await mockSupabaseClient
            .from(tableName)
            .insert(tUserPostFavorite2.toJson());
        final foundTUserPostFavorite =
            await tUserPostFavoriteRepository.findByPrimaryKey(
          tUserPostFavorite1.id,
        );
        expect(foundTUserPostFavorite, tUserPostFavorite1);
      });
    });
  });

  group('#findByUserId', () {
    group('正常系', () {
      test('正常にデータが2件取得されること', () async {
        final tUserPostFavorite2 = generateDummyTUserPostFavorite().copyWith(
          userId: tUserPostFavorite1.userId,
        );
        await mockSupabaseClient
            .from(tableName)
            .insert(tUserPostFavorite1.toJson());
        await mockSupabaseClient
            .from(tableName)
            .insert(tUserPostFavorite2.toJson());
        final foundTUserPostFavoriteList =
            await tUserPostFavoriteRepository.findByUserId(
          tUserPostFavorite1.userId,
        );
        expect(
          foundTUserPostFavoriteList,
          TUserPostFavoriteList(
            [
              tUserPostFavorite1,
              tUserPostFavorite2,
            ],
          ),
        );
      });
    });
  });

  group('#findByPostId', () {
    group('正常系', () {
      test('正常にデータが2件取得されること', () async {
        final tUserPostFavorite2 = generateDummyTUserPostFavorite().copyWith(
          postId: tUserPostFavorite1.postId,
        );
        await mockSupabaseClient
            .from(tableName)
            .insert(tUserPostFavorite1.toJson());
        await mockSupabaseClient
            .from(tableName)
            .insert(tUserPostFavorite2.toJson());
        final foundTUserPostFavoriteList =
            await tUserPostFavoriteRepository.findByPostId(
          tUserPostFavorite1.postId,
        );
        expect(
          foundTUserPostFavoriteList,
          TUserPostFavoriteList(
            [
              tUserPostFavorite1,
              tUserPostFavorite2,
            ],
          ),
        );
      });
    });
  });
}

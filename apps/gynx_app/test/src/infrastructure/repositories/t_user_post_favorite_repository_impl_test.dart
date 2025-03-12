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
  final tUserPostFavorite1 = generateDummyTUserPostFavorite().copyWith(
    createdAt: DateTime.now(),
  );
  final tUserPostFavorite2 = generateDummyTUserPostFavorite().copyWith(
    createdAt: tUserPostFavorite1.createdAt.add(const Duration(seconds: 1)),
  );
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
        await mockSupabaseClient.from(tableName).insert([
          tUserPostFavorite1.toJson(),
          tUserPostFavorite2.toJson(),
        ]);
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
        await mockSupabaseClient.from(tableName).insert([
          tUserPostFavorite1.toJson(),
          tUserPostFavorite2.toJson(),
        ]);
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
        await mockSupabaseClient.from(tableName).insert([
          tUserPostFavorite1.toJson(),
          tUserPostFavorite2.toJson(),
        ]);
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

  group(
    '#findByUserIdAndLatest',
    () {
      final tUserPostFavorite2 = generateDummyTUserPostFavorite().copyWith(
        userId: tUserPostFavorite1.userId,
      );
      final tUserPostFavorite3 = generateDummyTUserPostFavorite().copyWith(
        userId: tUserPostFavorite1.userId,
        createdAt: tUserPostFavorite1.createdAt.add(const Duration(seconds: 2)),
      );

      setUp(() {
        mockSupabaseClient.from(tableName).insert([
          tUserPostFavorite1.toJson(),
          tUserPostFavorite2.toJson(),
          tUserPostFavorite3.toJson(),
        ]);
      });

      group('正常系', () {
        test('指定した userId に紐づくデータが指定した件数取得できること', () async {
          final foundTUserPostFavoriteList =
              await tUserPostFavoriteRepository.findByUserIdAndLatest(
            tUserPostFavorite1.userId,
            2,
          );
          expect(
            foundTUserPostFavoriteList,
            TUserPostFavoriteList(
              [
                tUserPostFavorite2,
                tUserPostFavorite1,
              ],
            ),
          );
        });

        test('指定した userId に紐づくデータが指定した件数に満たない場合は、全てのデータが取得できること', () async {
          final foundTUserPostFavoriteList =
              await tUserPostFavoriteRepository.findByUserIdAndLatest(
            tUserPostFavorite1.userId,
            5,
          );
          expect(
            foundTUserPostFavoriteList,
            TUserPostFavoriteList(
              [
                tUserPostFavorite3,
                tUserPostFavorite2,
                tUserPostFavorite1,
              ],
            ),
          );
        });

        test('指定した userId に紐づくデータが存在しない場合は、空のリストが返却されること', () async {
          final foundTUserPostFavoriteList =
              await tUserPostFavoriteRepository.findByUserIdAndLatest(
            tUserPostFavorite1.userId,
            2,
          );
          expect(foundTUserPostFavoriteList, TUserPostFavoriteList.empty);
        });
      });
    },
    skip: 'mock_supabase_http_client の DateTime の指定に対応していなさそうなのでスキップ',
  );

  group(
    '#findByUserIdAndSinceAt',
    () {
      final tUserPostFavorite2 = generateDummyTUserPostFavorite().copyWith(
        userId: tUserPostFavorite1.userId,
      );
      final tUserPostFavorite3 = generateDummyTUserPostFavorite().copyWith(
        userId: tUserPostFavorite1.userId,
        createdAt: tUserPostFavorite1.createdAt.add(const Duration(seconds: 2)),
      );

      setUp(() {
        mockSupabaseClient.from(tableName).insert([
          tUserPostFavorite1.toJson(),
          tUserPostFavorite2.toJson(),
          tUserPostFavorite3.toJson(),
        ]);
      });

      group('正常系', () {
        test('指定した userId に紐づくデータが指定した件数取得できること', () async {
          final foundTUserPostFavoriteList =
              await tUserPostFavoriteRepository.findByUserIdAndLatestAt(
            tUserPostFavorite1.userId,
            tUserPostFavorite1.createdAt,
            2,
          );
          expect(
            foundTUserPostFavoriteList,
            TUserPostFavoriteList(
              [
                tUserPostFavorite2,
                tUserPostFavorite3,
              ],
            ),
          );
        });

        test('指定した userId に紐づくデータが指定した件数に満たない場合は、全てのデータが取得できること', () async {
          final foundTUserPostFavoriteList =
              await tUserPostFavoriteRepository.findByUserIdAndLatestAt(
            tUserPostFavorite1.userId,
            tUserPostFavorite1.createdAt,
            3,
          );
          expect(
            foundTUserPostFavoriteList,
            TUserPostFavoriteList(
              [
                tUserPostFavorite2,
                tUserPostFavorite3,
              ],
            ),
          );
        });

        test('指定した userId に紐づくデータが存在しない場合は、空のリストが返却されること', () async {
          final foundTUserPostFavoriteList =
              await tUserPostFavoriteRepository.findByUserIdAndLatestAt(
            faker.guid.guid(),
            tUserPostFavorite1.createdAt,
            2,
          );

          expect(foundTUserPostFavoriteList, TUserPostFavoriteList.empty);
        });
      });
    },
    skip: 'mock_supabase_http_client の DateTime の指定に対応していなさそうなのでスキップ',
  );

  group(
    '#findByUserIdAndMaxAt',
    () {
      final tUserPostFavorite2 = generateDummyTUserPostFavorite().copyWith(
        userId: tUserPostFavorite1.userId,
      );
      final tUserPostFavorite3 = generateDummyTUserPostFavorite().copyWith(
        userId: tUserPostFavorite1.userId,
        createdAt: tUserPostFavorite1.createdAt.add(const Duration(seconds: 2)),
      );

      setUp(() {
        mockSupabaseClient.from(tableName).insert([
          tUserPostFavorite1.toJson(),
          tUserPostFavorite2.toJson(),
          tUserPostFavorite3.toJson(),
        ]);
      });

      group('正常系', () {
        test('指定した userId に紐づくデータが指定した件数取得できること', () async {
          final foundTUserPostFavoriteList =
              await tUserPostFavoriteRepository.findByUserIdAndOldestAt(
            tUserPostFavorite1.userId,
            tUserPostFavorite3.createdAt,
            2,
          );
          expect(
            foundTUserPostFavoriteList,
            TUserPostFavoriteList(
              [
                tUserPostFavorite3,
                tUserPostFavorite2,
              ],
            ),
          );
        });

        test('指定した userId に紐づくデータが指定した件数に満たない場合は、全てのデータが取得できること', () async {
          final foundTUserPostFavoriteList =
              await tUserPostFavoriteRepository.findByUserIdAndOldestAt(
            tUserPostFavorite1.userId,
            tUserPostFavorite3.createdAt,
            3,
          );
          expect(
            foundTUserPostFavoriteList,
            TUserPostFavoriteList(
              [
                tUserPostFavorite3,
                tUserPostFavorite2,
                tUserPostFavorite1,
              ],
            ),
          );
        });

        test('指定した userId に紐づくデータが存在しない場合は、空のリストが返却されること', () async {
          final foundTUserPostFavoriteList =
              await tUserPostFavoriteRepository.findByUserIdAndOldestAt(
            faker.guid.guid(),
            tUserPostFavorite3.createdAt,
            2,
          );
          expect(foundTUserPostFavoriteList, TUserPostFavoriteList.empty);
        });
      });
    },
    skip: 'mock_supabase_http_client の DateTime の指定に対応していなさそうなのでスキップ',
  );
}

import 'package:app/src/domain/models/t_user_post_favorite_list.dart';
import 'package:app/src/infrastructure/repositories/t_user_post_favorite_repository_impl.dart';
import 'package:faker/faker.dart';
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
        await tUserPostFavoriteRepository.create(
          userId: tUserPostFavorite1.userId,
          postId: tUserPostFavorite1.postId,
        );
        final res = await mockSupabaseClient.from(tableName).select().single();
        expect(
          res,
          {
            'user_id': tUserPostFavorite1.userId,
            'post_id': tUserPostFavorite1.postId,
          },
        );
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
        final foundTUserPostFavorite = await tUserPostFavoriteRepository.findByPrimaryKey(
          tUserPostFavorite1.id,
        );
        expect(foundTUserPostFavorite, tUserPostFavorite1);
      });
    });
  });

  group('#findByUniqueKey', () {
    group('正常系', () {
      test('正常にデータが1件取得されること', () async {
        await mockSupabaseClient.from(tableName).insert([
          tUserPostFavorite1.toJson(),
          tUserPostFavorite2.toJson(),
        ]);
        expect(
          await tUserPostFavoriteRepository.findByUniqueKey(
            tUserPostFavorite1.userId,
            tUserPostFavorite1.postId,
          ),
          tUserPostFavorite1,
        );
      });

      test(
        'データが存在しない場合は null が返却されること',
        () async {
          await mockSupabaseClient.from(tableName).insert([
            tUserPostFavorite1.toJson(),
            tUserPostFavorite2.toJson(),
          ]);
          expect(
            await tUserPostFavoriteRepository.findByUniqueKey(
              faker.guid.guid(),
              tUserPostFavorite1.postId,
            ),
            isNull,
          );
        },
        skip: 'mock_supabase_http_client の maybeSingle の指定に対応していなさそうなのでスキップ',
      );
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
        expect(
          await tUserPostFavoriteRepository.findByUserId(
            tUserPostFavorite1.userId,
          ),
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
        expect(
          await tUserPostFavoriteRepository.findByPostId(
            tUserPostFavorite1.postId,
          ),
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
          expect(
            await tUserPostFavoriteRepository.findByUserIdAndLatest(
              tUserPostFavorite1.userId,
              2,
            ),
            TUserPostFavoriteList(
              [
                tUserPostFavorite2,
                tUserPostFavorite1,
              ],
            ),
          );
        });

        test('指定した userId に紐づくデータが指定した件数に満たない場合は、全てのデータが取得できること', () async {
          expect(
            await tUserPostFavoriteRepository.findByUserIdAndLatest(
              tUserPostFavorite1.userId,
              5,
            ),
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
          expect(
            await tUserPostFavoriteRepository.findByUserIdAndLatest(
              tUserPostFavorite1.userId,
              2,
            ),
            TUserPostFavoriteList.empty,
          );
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
          expect(
            await tUserPostFavoriteRepository.findByUserIdAndLatestAt(
              tUserPostFavorite1.userId,
              tUserPostFavorite1.createdAt,
              2,
            ),
            TUserPostFavoriteList(
              [
                tUserPostFavorite2,
                tUserPostFavorite3,
              ],
            ),
          );
        });

        test('指定した userId に紐づくデータが指定した件数に満たない場合は、全てのデータが取得できること', () async {
          expect(
            await tUserPostFavoriteRepository.findByUserIdAndLatestAt(
              tUserPostFavorite1.userId,
              tUserPostFavorite1.createdAt,
              3,
            ),
            TUserPostFavoriteList(
              [
                tUserPostFavorite2,
                tUserPostFavorite3,
              ],
            ),
          );
        });

        test('指定した userId に紐づくデータが存在しない場合は、空のリストが返却されること', () async {
          expect(
            await tUserPostFavoriteRepository.findByUserIdAndLatestAt(
              faker.guid.guid(),
              tUserPostFavorite1.createdAt,
              2,
            ),
            TUserPostFavoriteList.empty,
          );
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
          final foundTUserPostFavoriteList = await tUserPostFavoriteRepository.findByUserIdAndOldestAt(
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
          expect(
            await tUserPostFavoriteRepository.findByUserIdAndOldestAt(
              tUserPostFavorite1.userId,
              tUserPostFavorite3.createdAt,
              3,
            ),
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
          expect(
            await tUserPostFavoriteRepository.findByUserIdAndOldestAt(
              faker.guid.guid(),
              tUserPostFavorite3.createdAt,
              2,
            ),
            TUserPostFavoriteList.empty,
          );
        });
      });
    },
    skip: 'mock_supabase_http_client の DateTime の指定に対応していなさそうなのでスキップ',
  );

  group('#deleteByUniqueKey', () {
    group('正常系', () {
      test('正常にデータが1件削除されること', () async {
        await mockSupabaseClient.from(tableName).insert([
          tUserPostFavorite1.toJson(),
          tUserPostFavorite2.toJson(),
        ]);
        await tUserPostFavoriteRepository.deleteByUniqueKey(
          tUserPostFavorite1.userId,
          tUserPostFavorite1.postId,
        );
        expect(
          await mockSupabaseClient.from(tableName).select(),
          [
            tUserPostFavorite2.toJson(),
          ],
        );
      });
    });
  });
}

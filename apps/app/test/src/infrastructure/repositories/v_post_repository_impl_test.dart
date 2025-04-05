// ignore_for_file: lines_longer_than_80_chars
import 'package:app/src/domain/models/post_id_list.dart';
import 'package:app/src/domain/models/v_post_list.dart';
import 'package:app/src/infrastructure/repositories/v_post_repository_impl.dart';
import 'package:faker/faker.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';

void main() {
  const viewName = VPostRepositoryImpl.viewName;
  final mockHttpClient = MockSupabaseHttpClient();
  final mockSupabaseClient = SupabaseClient(
    faker.internet.httpsUrl(),
    faker.guid.guid(),
    httpClient: mockHttpClient,
  );
  final userId = faker.guid.guid();
  final vPost1 = generateDummyVPost(postId: 1).copyWith(userId: userId);
  final vPost2 = generateDummyVPost(postId: 2).copyWith(userId: userId);
  final vPost3 = generateDummyVPost(postId: 3).copyWith(userId: userId);
  final vPost4 = generateDummyVPost(postId: 4).copyWith(userId: userId);
  final vPost5 = generateDummyVPost(postId: 5).copyWith(userId: userId);
  final vPostRepository = VPostRepositoryImpl(mockSupabaseClient);

  setUpAll(() async {
    await mockSupabaseClient.from(viewName).insert([
      vPost1.toJson(),
      vPost2.toJson(),
      vPost3.toJson(),
      vPost4.toJson(),
      vPost5.toJson(),
    ]);
  });

  tearDownAll(mockHttpClient.close);

  group('#findByPostId', () {
    group('正常系', () {
      test('正常にデータが1件作成されること', () async {
        final actual = await vPostRepository.findByPostId(vPost3.postId);
        expect(actual, vPost3);
      });
    });
  });

  group('#findByPostIdList', () {
    group('正常系', () {
      test('正常にデータが1件作成されること', () async {
        final actual = await vPostRepository.findByPostIdList(
          PostIdList(
            [
              vPost1.postId,
              vPost2.postId,
              vPost3.postId,
            ],
          ),
        );
        expect(actual, VPostList([vPost1, vPost2, vPost3]));
      });
    });
  });

  group('#findByLatest', () {
    group('正常系', () {
      test('正常にデータが1件作成されること', () async {
        final actual = await vPostRepository.findByLatest(3);
        expect(actual, VPostList([vPost5, vPost4, vPost3]));
      });
    });
  });

  group('#findBySincePostId', () {
    group('正常系', () {
      test('指定した postId より大きい値かつ指定した件数のデータが取得できること', () async {
        final actual = await vPostRepository.findBySincePostId(2, 2);
        expect(actual, VPostList([vPost3, vPost4]));
      });

      test('指定した postId より大きい値かつ指定した件数に満たない場合は、それ以降のデータが全て取得できること', () async {
        final actual = await vPostRepository.findBySincePostId(2, 6);
        expect(actual, VPostList([vPost3, vPost4, vPost5]));
      });
    });
  });

  group('#findByMaxPostId', () {
    group('正常系', () {
      test('指定した postId より小さい値かつ指定した件数のデータが取得できること', () async {
        final actual = await vPostRepository.findByMaxPostId(4, 2);
        expect(actual, VPostList([vPost3, vPost2]));
      });

      test('指定した postId より小さい値かつ指定した件数に満たない場合は、それ以前のデータが全て取得できること', () async {
        final actual = await vPostRepository.findByMaxPostId(4, 6);
        expect(actual, VPostList([vPost3, vPost2, vPost1]));
      });
    });
  });

  group('#findByUserIdAndLatest', () {
    group('正常系', () {
      test('指定した userId に紐づくデータが指定した件数取得できること', () async {
        final actual = await vPostRepository.findByUserIdAndLatest(
          vPost1.userId,
          2,
        );
        expect(actual, VPostList([vPost5, vPost4]));
      });

      test('指定した userId に紐づくデータが指定した件数に満たない場合は、全てのデータが取得できること', () async {
        final actual = await vPostRepository.findByUserIdAndLatest(
          vPost1.userId,
          6,
        );
        expect(actual, VPostList([vPost5, vPost4, vPost3, vPost2, vPost1]));
      });

      test('指定した userId に紐づくデータが存在しない場合は、空のリストが返却されること', () async {
        final actual = await vPostRepository.findByUserIdAndLatest(
          faker.guid.guid(),
          2,
        );
        expect(actual, VPostList.empty);
      });
    });
  });

  group('#findByUserIdAndSincePostId', () {
    group('正常系', () {
      test('指定した userId に紐づくデータかつ指定した postId より大きい値かつ指定した件数のデータが取得できること', () async {
        final actual = await vPostRepository.findByUserIdAndSincePostId(
          vPost1.userId,
          2,
          2,
        );
        expect(actual, VPostList([vPost3, vPost4]));
      });

      test('指定した userId に紐づくデータかつ指定した postId より大きい値かつ指定した件数に満たない場合は、それ以降のデータが全て取得できること', () async {
        final actual = await vPostRepository.findByUserIdAndSincePostId(
          vPost1.userId,
          2,
          6,
        );
        expect(actual, VPostList([vPost3, vPost4, vPost5]));
      });

      test('指定した userId に紐づくデータが存在しない場合は、空のリストが返却されること', () async {
        final actual = await vPostRepository.findByUserIdAndSincePostId(
          faker.guid.guid(),
          2,
          2,
        );
        expect(actual, VPostList.empty);
      });
    });
  });

  group('#findByUserIdMaxPostId', () {
    group('正常系', () {
      test('指定した userId に紐づくデータかつ指定した postId より小さい値かつ指定した件数のデータが取得できること', () async {
        final actual = await vPostRepository.findByUserIdAndMaxPostId(
          vPost1.userId,
          4,
          2,
        );
        expect(actual, VPostList([vPost3, vPost2]));
      });

      test('指定した userId に紐づくデータかつ指定した postId より小さい値かつ指定した件数に満たない場合は、それ以前のデータが全て取得できること', () async {
        final actual = await vPostRepository.findByUserIdAndMaxPostId(
          vPost1.userId,
          4,
          6,
        );
        expect(actual, VPostList([vPost3, vPost2, vPost1]));
      });

      test('指定した userId に紐づくデータが存在しない場合は、空のリストが返却されること', () async {
        final actual = await vPostRepository.findByUserIdAndMaxPostId(
          faker.guid.guid(),
          4,
          2,
        );
        expect(actual, VPostList.empty);
      });
    });
  });
}

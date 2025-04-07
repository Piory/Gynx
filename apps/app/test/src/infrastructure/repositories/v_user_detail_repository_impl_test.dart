import 'package:app/src/domain/enums/repost_type.dart';
import 'package:app/src/infrastructure/repositories/v_user_detail_repository_impl.dart';
import 'package:faker/faker.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';

void main() {
  const viewName = VUserDetailRepositoryImpl.viewName;
  final mockHttpClient = MockSupabaseHttpClient();
  final mockSupabaseClient = SupabaseClient(
    faker.internet.httpsUrl(),
    faker.guid.guid(),
    httpClient: mockHttpClient,
  );
  final vUserDetailRepository = VUserDetailRepositoryImpl(mockSupabaseClient);

  final vPost1 = generateDummyVPost(
    postId: 1,
  );
  final vPost2 = generateDummyVPost(
    postId: 2,
    medias: [
      generateDummyTPostMedia(),
      generateDummyTPostMedia(),
    ],
  );
  final vPost3 = generateDummyVPost(
    postId: 3,
    repostType: RepostType.repost,
  );
  final vUserDetail = generateDummyVUserDetail();
  final vUserDetailWithLatestPosts = vUserDetail.copyWith(
    latestPosts: [
      vPost1,
      vPost2,
      vPost3,
    ],
    favoritePosts: [
      vPost1,
      vPost2,
      vPost3,
    ],
  );

  tearDown(mockHttpClient.reset);

  tearDownAll(mockHttpClient.close);

  group('#findByUserId', () {
    group('正常系', () {
      test('正常にデータが1件取得されること', () async {
        await mockSupabaseClient.from(viewName).insert(vUserDetail);
        final foundVUserDetail = await vUserDetailRepository.findByUserId(vUserDetail.userId);
        expect(foundVUserDetail, vUserDetail);
      });

      test('正常にデータが1件取得されること（latestPosts あり）', () async {
        await mockSupabaseClient.from(viewName).insert(vUserDetailWithLatestPosts);
        final foundVUserDetail = await vUserDetailRepository.findByUserId(vUserDetailWithLatestPosts.userId);
        expect(foundVUserDetail, vUserDetailWithLatestPosts);
      });
    });
  });

  group('#findByScreenName', () {
    group('正常系', () {
      test('正常にデータが1件取得されること', () async {
        await mockSupabaseClient.from(viewName).insert(vUserDetail);
        final foundVUserDetail = await vUserDetailRepository.findByScreenName(vUserDetail.screenName);
        expect(foundVUserDetail, vUserDetail);
      });

      test('正常にデータが1件取得されること（latestPosts あり）', () async {
        await mockSupabaseClient.from(viewName).insert(vUserDetailWithLatestPosts);
        final foundVUserDetail = await vUserDetailRepository.findByScreenName(vUserDetailWithLatestPosts.screenName);
        expect(foundVUserDetail, vUserDetailWithLatestPosts);
      });
    });
  });
}

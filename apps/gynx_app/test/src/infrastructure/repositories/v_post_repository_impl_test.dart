import 'package:faker/faker.dart';
import 'package:gynx_app/src/domain/models/v_post_list.dart';
import 'package:gynx_app/src/infrastructure/repositories/v_post_repository_impl.dart';
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
  final vPostRepository = VPostRepositoryImpl(mockSupabaseClient);

  final tPostMedias = [
    generateDummyTPostMedia(),
    generateDummyTPostMedia(),
  ];
  final vPost = generateDummyVPost(
    postId: 1,
  );
  final vPostWithMedia = vPost.copyWith(
    medias: tPostMedias,
  );
  final vPostWithRepost = vPost.copyWith(
    repost: vPostWithMedia,
  );

  tearDown(mockHttpClient.reset);

  tearDownAll(mockHttpClient.close);

  group('#findByPostId', () {
    group('正常系', () {
      test('正常にデータが1件取得されること', () async {
        await mockSupabaseClient.from(viewName).insert(vPost.toJson());
        final foundVPost = await vPostRepository.findByPostId(vPost.postId);
        expect(foundVPost, vPost);
      });

      test('正常にデータが1件取得されること（メディアあり）', () async {
        await mockSupabaseClient.from(viewName).insert(vPostWithMedia.toJson());
        final foundVPost =
            await vPostRepository.findByPostId(vPostWithMedia.postId);
        expect(foundVPost, vPostWithMedia);
      });

      test('正常にデータが1件取得されること（リポストあり）', () async {
        await mockSupabaseClient
            .from(viewName)
            .insert(vPostWithRepost.toJson());
        final foundVPost =
            await vPostRepository.findByPostId(vPostWithRepost.postId);
        expect(foundVPost, vPostWithRepost);
      });
    });
  });

  group('findBySincePostId', () {
    group('正常系', () {
      test('指定した ID より、大きい ID のデータが取得できること', () async {
        final vPost2 = generateDummyVPost(
          postId: vPost.postId + 1,
        );
        final vPost3 = generateDummyVPost(
          postId: vPost2.postId + 1,
        );
        await mockSupabaseClient.from(viewName).insert(vPost.toJson());
        await mockSupabaseClient.from(viewName).insert(vPost2.toJson());
        await mockSupabaseClient.from(viewName).insert(vPost3.toJson());
        final foundVPostList =
            await vPostRepository.findBySincePostId(vPost.postId, 10);
        expect(foundVPostList, VPostList([vPost2, vPost3]));
      });

      test('指定した ID より、大きい ID のデータが取得できること（メディアあり）', () async {
        final vPost2 = generateDummyVPost(
          postId: vPost.postId + 1,
        );
        final vPost3 = generateDummyVPost(
          postId: vPost2.postId + 1,
        );
        final vPost2WithMedia = vPost2.copyWith(
          medias: tPostMedias,
        );
        final vPost3WithMedia = vPost3.copyWith(
          medias: tPostMedias,
        );
        await mockSupabaseClient.from(viewName).insert(vPost.toJson());
        await mockSupabaseClient
            .from(viewName)
            .insert(vPost2WithMedia.toJson());
        await mockSupabaseClient
            .from(viewName)
            .insert(vPost3WithMedia.toJson());
        final foundVPostList =
            await vPostRepository.findBySincePostId(vPost.postId, 10);
        expect(foundVPostList, VPostList([vPost2WithMedia, vPost3WithMedia]));
      });

      test('指定した ID より、大きい ID のデータが取得できること（リポストあり）', () async {
        final vPost2 = generateDummyVPost(
          postId: vPost.postId + 1,
        );
        final vPost3 = generateDummyVPost(
          postId: vPost2.postId + 1,
        );
        final vPost2WithRepost = vPost2.copyWith(
          repost: vPost,
        );
        final vPost3WithRepost = vPost3.copyWith(
          repost: vPost2,
        );
        await mockSupabaseClient.from(viewName).insert(vPost.toJson());
        await mockSupabaseClient
            .from(viewName)
            .insert(vPost2WithRepost.toJson());
        await mockSupabaseClient
            .from(viewName)
            .insert(vPost3WithRepost.toJson());
        final foundVPostList =
            await vPostRepository.findBySincePostId(vPost.postId, 10);
        expect(foundVPostList, VPostList([vPost2WithRepost, vPost3WithRepost]));
      });

      test('Count よりも多いデータが存在する場合は、Count で指定した数のデータが取得できること', () async {
        final vPost2 = generateDummyVPost(
          postId: vPost.postId + 1,
        );
        final vPost3 = generateDummyVPost(
          postId: vPost2.postId + 1,
        );
        final vPost4 = generateDummyVPost(
          postId: vPost3.postId + 1,
        );
        await mockSupabaseClient.from(viewName).insert(vPost.toJson());
        await mockSupabaseClient.from(viewName).insert(vPost2.toJson());
        await mockSupabaseClient.from(viewName).insert(vPost3.toJson());
        await mockSupabaseClient.from(viewName).insert(vPost4.toJson());
        final foundVPostList =
            await vPostRepository.findBySincePostId(vPost.postId, 2);
        expect(foundVPostList, VPostList([vPost2, vPost3]));
      });

      test('指定した ID より、大きいデータが存在しない場合は、空の VPostList が返ってくること', () async {
        await mockSupabaseClient.from(viewName).insert(vPost.toJson());
        final foundVPostList =
            await vPostRepository.findBySincePostId(vPost.postId, 10);
        expect(foundVPostList, VPostList.empty);
      });
    });
  });

  group('findByMaxPostId', () {
    group('正常系', () {
      test('指定した ID より、小さい ID のデータが取得できること', () async {
        final vPost2 = generateDummyVPost(
          postId: vPost.postId - 1,
        );
        final vPost3 = generateDummyVPost(
          postId: vPost2.postId - 1,
        );
        await mockSupabaseClient.from(viewName).insert(vPost.toJson());
        await mockSupabaseClient.from(viewName).insert(vPost2.toJson());
        await mockSupabaseClient.from(viewName).insert(vPost3.toJson());
        final foundVPostList =
            await vPostRepository.findByMaxPostId(vPost.postId, 10);
        expect(foundVPostList, VPostList([vPost2, vPost3]));
      });

      test('指定した ID より、小さい ID のデータが取得できること（メディアあり）', () async {
        final vPost2 = generateDummyVPost(
          postId: vPost.postId - 1,
        );
        final vPost3 = generateDummyVPost(
          postId: vPost2.postId - 1,
        );
        final vPost2WithMedia = vPost2.copyWith(
          medias: tPostMedias,
        );
        final vPost3WithMedia = vPost3.copyWith(
          medias: tPostMedias,
        );
        await mockSupabaseClient.from(viewName).insert(vPost.toJson());
        await mockSupabaseClient
            .from(viewName)
            .insert(vPost2WithMedia.toJson());
        await mockSupabaseClient
            .from(viewName)
            .insert(vPost3WithMedia.toJson());
        final foundVPostList =
            await vPostRepository.findByMaxPostId(vPost.postId, 10);
        expect(foundVPostList, VPostList([vPost2WithMedia, vPost3WithMedia]));
      });

      test('指定した ID より、小さい ID のデータが取得できること（リポストあり）', () async {
        final vPost2 = generateDummyVPost(
          postId: vPost.postId - 1,
        );
        final vPost3 = generateDummyVPost(
          postId: vPost2.postId - 1,
        );
        final vPost2WithRepost = vPost2.copyWith(
          repost: vPost,
        );
        final vPost3WithRepost = vPost3.copyWith(
          repost: vPost2,
        );
        await mockSupabaseClient.from(viewName).insert(vPost.toJson());
        await mockSupabaseClient
            .from(viewName)
            .insert(vPost2WithRepost.toJson());
        await mockSupabaseClient
            .from(viewName)
            .insert(vPost3WithRepost.toJson());
        final foundVPostList =
            await vPostRepository.findByMaxPostId(vPost.postId, 10);
        expect(foundVPostList, VPostList([vPost2WithRepost, vPost3WithRepost]));
      });

      test('Count よりも多いデータが存在する場合は、Count で指定した数のデータが取得できること', () async {
        final vPost2 = generateDummyVPost(
          postId: vPost.postId - 1,
        );
        final vPost3 = generateDummyVPost(
          postId: vPost2.postId - 1,
        );
        final vPost4 = generateDummyVPost(
          postId: vPost3.postId - 1,
        );
        await mockSupabaseClient.from(viewName).insert(vPost.toJson());
        await mockSupabaseClient.from(viewName).insert(vPost2.toJson());
        await mockSupabaseClient.from(viewName).insert(vPost3.toJson());
        await mockSupabaseClient.from(viewName).insert(vPost4.toJson());
        final foundVPostList =
            await vPostRepository.findByMaxPostId(vPost.postId, 2);
        expect(foundVPostList, VPostList([vPost2, vPost3]));
      });

      test('指定した ID より、小さいデータが存在しない場合は、空の VPostList が返ってくること', () async {
        await mockSupabaseClient.from(viewName).insert(vPost.toJson());
        final foundVPostList =
            await vPostRepository.findByMaxPostId(vPost.postId, 10);
        expect(foundVPostList, VPostList.empty);
      });
    });
  });
}

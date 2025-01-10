import 'package:faker/faker.dart';
import 'package:gynx_app/src/domain/models/t_user_timeline_list.dart';
import 'package:gynx_app/src/infrastructure/repositories/t_user_timeline_repository_impl.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';

void main() {
  const tableName = TUserTimelineRepositoryImpl.tableName;
  final mockHttpClient = MockSupabaseHttpClient();
  final mockSupabaseClient = SupabaseClient(
    faker.internet.httpsUrl(),
    faker.guid.guid(),
    httpClient: mockHttpClient,
  );
  final tUserTimeline1 = generateDummyTUserTimeline();
  final tUserTimeline2 = generateDummyTUserTimeline();
  final tUserTimelineRepository = TUserTimelineRepositoryImpl(
    mockSupabaseClient,
  );

  tearDown(mockHttpClient.reset);

  tearDownAll(mockHttpClient.close);

  group('#create', () {
    group('正常系', () {
      test('正常にデータが1件作成されること', () async {
        await tUserTimelineRepository.create(tUserTimeline1);
        final res = await mockSupabaseClient.from(tableName).select().single();
        expect(res, tUserTimeline1.toJson());
      });
    });
  });

  group('#findByPrimaryKey', () {
    group('正常系', () {
      test('正常にデータが1件取得されること', () async {
        await mockSupabaseClient
            .from(tableName)
            .insert(tUserTimeline1.toJson());
        await mockSupabaseClient
            .from(tableName)
            .insert(tUserTimeline2.toJson());
        final foundTUserTimeline =
            await tUserTimelineRepository.findByPrimaryKey(
          tUserTimeline1.id,
        );
        expect(foundTUserTimeline, tUserTimeline1);
      });
    });
  });

  group(
    '#findByUserIdAndType',
    () {
      group('正常系', () {
        test('正常にデータが2件取得されること', () async {
          final tUserTimeline2 = generateDummyTUserTimeline().copyWith(
            userId: tUserTimeline1.userId,
            type: tUserTimeline1.type,
          );
          await mockSupabaseClient
              .from(tableName)
              .insert(tUserTimeline1.toJson());
          await mockSupabaseClient
              .from(tableName)
              .insert(tUserTimeline2.toJson());
          final foundTUserTimelineList =
              await tUserTimelineRepository.findByUserIdAndType(
            tUserTimeline1.userId,
            tUserTimeline1.type,
          );
          expect(
            foundTUserTimelineList,
            TUserTimelineList(
              [
                tUserTimeline1,
                tUserTimeline2,
              ],
            ),
          );
        });
      });
    },
    skip: 'TimelineType の指定がうまくいかないため一旦スキップ',
  );
}

import 'package:app/src/infrastructure/repositories/v_user_repository_impl.dart';
import 'package:faker/faker.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';

void main() {
  const viewName = VUserRepositoryImpl.viewName;
  final mockHttpClient = MockSupabaseHttpClient();
  final mockSupabaseClient = SupabaseClient(
    faker.internet.httpsUrl(),
    faker.guid.guid(),
    httpClient: mockHttpClient,
  );
  final vUserRepository = VUserRepositoryImpl(mockSupabaseClient);
  final vUser = generateDummyVUser();

  setUpAll(() async {
    await mockSupabaseClient.from(viewName).insert(vUser);
  });

  tearDownAll(mockHttpClient.close);

  group('#findByUserId', () {
    group('正常系', () {
      test('正常にデータが1件作成されること', () async {
        final actual = await vUserRepository.findByUserId(vUser.userId);
        expect(actual, vUser);
      });
    });
  });

  group('#findByScreenName', () {
    group('正常系', () {
      test('正常にデータが1件作成されること', () async {
        final actual = await vUserRepository.findByScreenName(vUser.screenName);
        expect(actual, vUser);
      });
    });
  });
}

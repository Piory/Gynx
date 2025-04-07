import 'package:config/config.dart';
import 'package:faker/faker.dart';
import 'package:supabase/supabase.dart';
import 'package:test/test.dart';

import 'matchers/matcher.dart';

void main() {
  const tableName = 't_user_profiles';
  final supabaseClient = SupabaseClient(
    Env.supabaseUrl,
    Env.supabaseAnonKey,
  );
  final supabaseClientAdmin = SupabaseClient(
    Env.supabaseUrl,
    Env.supabaseServiceRoleKey!,
  );
  late final String otherUserId;

  setUpAll(() async {
    await supabaseClient.auth.signInAnonymously();
    otherUserId = supabaseClient.auth.currentUser!.id;
    await supabaseClient.auth.signOut();
  });

  group('Anon User', () {
    test('Insert X (403 Unauthorized)', () async {
      await expectLater(
        () => supabaseClient.from(tableName).insert({
          'user_id': otherUserId,
          'display_name': 'displayName',
        }),
        throwsRlsError(
          tableName,
          RlsErrorDetailsType.unauthorized,
        ),
      );
    });

    test('Select X', () async {
      final result = await supabaseClient.from(tableName).select().eq('user_id', otherUserId);
      expect(result, isEmpty);
    });

    test('Update X', () async {
      final result = await supabaseClient
          .from(tableName)
          .update({
            'display_name': 'updateDisplayName',
          })
          .eq('user_id', otherUserId)
          .select();
      expect(result, isEmpty);
    });

    test('Delete X', () async {
      final result = await supabaseClient.from(tableName).delete().eq('user_id', otherUserId).select();
      expect(result, isEmpty);
    });
  });

  group('Anonymous User', () {
    late final String anonymousUserId;

    setUpAll(() async {
      final user = await supabaseClient.auth.signInAnonymously();
      anonymousUserId = user.user!.id;
      await supabaseClientAdmin.from(tableName).insert({
        'user_id': anonymousUserId,
        'display_name': 'displayName',
      });
      await supabaseClientAdmin.from(tableName).insert({
        'user_id': otherUserId,
        'display_name': 'displayName',
      });
    });

    tearDownAll(() async {
      await supabaseClient.auth.signOut();
    });

    group('Own data', () {
      test('Insert X (403 Forbidden)', () async {
        await expectLater(
          () => supabaseClient.from(tableName).insert({
            'user_id': anonymousUserId,
            'display_name': 'displayName',
          }),
          throwsRlsError(
            tableName,
            RlsErrorDetailsType.forbidden,
          ),
        );
      });

      test('Select O', () async {
        final result = await supabaseClient.from(tableName).select().eq('user_id', anonymousUserId);
        expect(result, hasLength(1));
      });

      test('Update X', () async {
        final result = await supabaseClient
            .from(tableName)
            .update({
              'display_name': 'updatedDisplayName',
            })
            .eq('user_id', anonymousUserId)
            .select();
        expect(result, isEmpty);
      });

      test('Delete X', () async {
        final result = await supabaseClient.from(tableName).delete().eq('user_id', anonymousUserId).select();
        expect(result, isEmpty);
      });
    });

    group('Others data', () {
      test('Insert X (403 Forbidden)', () async {
        await expectLater(
          () => supabaseClient.from(tableName).insert({
            'user_id': faker.guid.guid(),
            'display_name': 'displayName',
          }),
          throwsRlsError(
            tableName,
            RlsErrorDetailsType.forbidden,
          ),
        );
      });

      test('Select O', () async {
        final result = await supabaseClient.from(tableName).select().eq('user_id', otherUserId);
        expect(result, hasLength(1));
      });

      test('Update X', () async {
        final result = await supabaseClient
            .from(tableName)
            .update({
              'display_name': 'UpdatedDisplayName',
            })
            .eq('user_id', otherUserId)
            .select();
        expect(result, isEmpty);
      });

      test('Delete X', () async {
        final result = await supabaseClient.from(tableName).delete().eq('user_id', otherUserId).select();
        expect(result, isEmpty);
      });
    });
  });

  group('Authenticated User', () {
    final email = faker.internet.email();
    final password = faker.internet.password();
    late final String userId;

    setUpAll(() async {
      await supabaseClientAdmin.auth.admin.createUser(
        AdminUserAttributes(
          email: email,
          password: password,
          emailConfirm: true,
        ),
      );
      final res = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      userId = res.user!.id;
      // 初期状態で作成されるデータを削除
      await supabaseClient.from(tableName).delete().eq('user_id', userId).select();
    });

    tearDownAll(() async {
      await supabaseClient.auth.signOut();
    });

    group('Own data', () {
      test('Insert O', () async {
        final result = await supabaseClient.from(tableName).insert({
          'user_id': userId,
          'display_name': 'displayName',
        }).select();
        expect(result, hasLength(1));
      });

      test('Select O', () async {
        final result = await supabaseClient.from(tableName).select().eq('user_id', userId);
        expect(result, hasLength(1));
      });

      test('Update O', () async {
        final result = await supabaseClient
            .from(tableName)
            .update({
              'display_name': 'UpdateDisplayName',
            })
            .eq('user_id', userId)
            .select();
        expect(result, hasLength(1));
        expect(result.first['display_name'], 'UpdateDisplayName');
      });

      test('Delete O', () async {
        final result = await supabaseClient.from(tableName).delete().eq('user_id', userId).select();
        expect(result, hasLength(1));
      });
    });

    group('Others data', () {
      test('Insert X (403 Forbidden)', () {
        expect(
          () => supabaseClient.from(tableName).insert({
            'user_id': faker.guid.guid(),
            'display_name': 'UpdateDisplayName',
          }),
          throwsRlsError(
            tableName,
            RlsErrorDetailsType.forbidden,
          ),
        );
      });

      test('Select O', () async {
        final result = await supabaseClient.from(tableName).select().eq('user_id', otherUserId);
        expect(result, hasLength(1));
      });

      test('Update X', () async {
        final result = await supabaseClient
            .from(tableName)
            .update({
              'display_name': 'UpdateDisplayName',
            })
            .eq('user_id', otherUserId)
            .select();
        expect(result, isEmpty);
      });

      test('Delete X', () async {
        final result = await supabaseClient.from(tableName).delete().eq('user_id', otherUserId).select();
        expect(result, isEmpty);
      });
    });
  });
}

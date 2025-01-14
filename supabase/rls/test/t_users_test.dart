import 'package:faker/faker.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:supabase/supabase.dart';
import 'package:test/test.dart';

import 'matchers/matcher.dart';

void main() {
  const tableName = 't_users';
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
          'id': otherUserId,
          'gynx_id': 'GynxID',
        }),
        throwsRlsError(
          tableName,
          RlsErrorDetailsType.unauthorized,
        ),
      );
    });

    test('Select X', () async {
      final result =
          await supabaseClient.from(tableName).select().eq('id', otherUserId);
      expect(result, isEmpty);
    });

    test('Update X', () async {
      final result = await supabaseClient
          .from(tableName)
          .update({'gynx_id': 'GynxID2'})
          .eq('id', otherUserId)
          .select();
      expect(result, isEmpty);
    });

    test('Delete X', () async {
      final result = await supabaseClient
          .from(tableName)
          .delete()
          .eq('id', otherUserId)
          .select();
      expect(result, isEmpty);
    });
  });

  group('Anonymous User', () {
    late final String anonymousUserId;

    setUpAll(() async {
      final user = await supabaseClient.auth.signInAnonymously();
      anonymousUserId = user.user!.id;
    });

    tearDownAll(() async {
      await supabaseClient.auth.signOut();
    });

    group('Own data', () {
      test('Insert X (403 Forbidden)', () async {
        await expectLater(
          () => supabaseClient.from(tableName).insert({
            'id': anonymousUserId,
            'gynx_id': 'GynxID',
          }),
          throwsRlsError(
            tableName,
            RlsErrorDetailsType.forbidden,
          ),
        );
      });

      test('Select O', () async {
        final result = await supabaseClient
            .from(tableName)
            .select()
            .eq('id', anonymousUserId);
        expect(result, hasLength(1));
      });

      test('Update X', () async {
        final result = await supabaseClient
            .from(tableName)
            .update({'gynx_id': 'GynxID'})
            .eq('id', anonymousUserId)
            .select();
        expect(result, isEmpty);
      });

      test('Delete X', () async {
        final result = await supabaseClient
            .from(tableName)
            .delete()
            .eq('id', anonymousUserId)
            .select();
        expect(result, isEmpty);
      });
    });

    group('Others data', () {
      test('Insert X (403 forbidden)', () async {
        await expectLater(
          () => supabaseClient.from(tableName).insert({
            'id': faker.guid.guid(),
            'gynx_id': 'GynxID',
          }),
          throwsRlsError(
            tableName,
            RlsErrorDetailsType.forbidden,
          ),
        );
      });

      test('Select O', () async {
        final result =
            await supabaseClient.from(tableName).select().eq('id', otherUserId);
        expect(result, hasLength(1));
      });

      test('Update X', () async {
        final result = await supabaseClient
            .from(tableName)
            .update({'gynx_id': 'GynxID'})
            .eq('id', otherUserId)
            .select();
        expect(result, isEmpty);
      });

      test('Delete X', () async {
        final result = await supabaseClient
            .from(tableName)
            .delete()
            .eq('id', otherUserId)
            .select();
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
      await supabaseClient
          .from('t_user_profiles')
          .delete()
          .eq('user_id', userId)
          .select();
      await supabaseClient.from(tableName).delete().eq('id', userId).select();
    });

    tearDownAll(() async {
      await supabaseClient.auth.signOut();
    });

    group('Own data', () {
      test('Insert O', () async {
        final result = await supabaseClient.from(tableName).insert({
          'id': userId,
          'gynx_id': 'GynxID',
        }).select();
        expect(result, hasLength(1));
      });

      test('Select O', () async {
        final result =
            await supabaseClient.from(tableName).select().eq('id', userId);
        expect(result, hasLength(1));
      });

      test('Update O', () async {
        final result = await supabaseClient
            .from(tableName)
            .update({'gynx_id': 'UpdatedGynxID'})
            .eq('id', userId)
            .select();
        expect(result, hasLength(1));
        expect(result.first['gynx_id'], 'UpdatedGynxID');
      });

      test('Delete O', () async {
        final result = await supabaseClient
            .from(tableName)
            .delete()
            .eq('id', userId)
            .select();
        expect(result, hasLength(1));
      });
    });

    group('Others data', () {
      test('Insert X (403 Forbidden)', () async {
        expect(
          () => supabaseClient.from(tableName).insert({
            'id': faker.guid.guid(),
            'gynx_id': 'GynxID2',
          }),
          throwsRlsError(
            tableName,
            RlsErrorDetailsType.forbidden,
          ),
        );
      });

      test('Select O', () async {
        final result =
            await supabaseClient.from(tableName).select().eq('id', otherUserId);
        expect(result, hasLength(1));
      });

      test('Update X', () async {
        final result = await supabaseClient
            .from(tableName)
            .update({'gynx_id': 'GynxID2'})
            .eq('id', otherUserId)
            .select();
        expect(result, isEmpty);
      });

      test('Delete X', () async {
        final result = await supabaseClient
            .from(tableName)
            .delete()
            .eq('id', otherUserId)
            .select();
        expect(result, isEmpty);
      });
    });
  });
}

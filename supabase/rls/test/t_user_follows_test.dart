import 'package:faker/faker.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:supabase/supabase.dart';
import 'package:test/test.dart';

import 'matchers/matcher.dart';

void main() {
  const tableName = 't_user_follows';
  final supabaseClient = SupabaseClient(
    Env.supabaseUrl,
    Env.supabaseAnonKey,
  );
  final supabaseClientAdmin = SupabaseClient(
    Env.supabaseUrl,
    Env.supabaseServiceRoleKey!,
  );
  late final String otherUserId1;
  late final String otherUserId2;

  setUpAll(() async {
    await supabaseClient.auth.signInAnonymously();
    otherUserId1 = supabaseClient.auth.currentUser!.id;
    await supabaseClient.auth.signOut();
    await supabaseClient.auth.signInAnonymously();
    otherUserId2 = supabaseClient.auth.currentUser!.id;
    await supabaseClient.auth.signOut();
  });

  group('Anon User', () {
    test('Insert X (403 Unauthorized)', () async {
      await expectLater(
        () => supabaseClient.from(tableName).insert({
          'user_id': otherUserId1,
          'follow_user_id': faker.guid.guid(),
        }),
        throwsRlsError(tableName, RlsErrorDetailsType.unauthorized),
      );
    });

    test('Select X', () async {
      final result = await supabaseClient
          .from(tableName)
          .select()
          .eq('user_id', otherUserId1);
      expect(result, isEmpty);
    });

    test('Update X', () async {
      final result = await supabaseClient
          .from(tableName)
          .update({
            'follow_user_id': otherUserId2,
          })
          .eq('user_id', otherUserId1)
          .select();
      expect(result, isEmpty);
    });

    test('Delete X', () async {
      final result = await supabaseClient
          .from(tableName)
          .delete()
          .eq('user_id', otherUserId1)
          .select();
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
        'follow_user_id': otherUserId1,
      });
      await supabaseClientAdmin.from(tableName).insert({
        'user_id': otherUserId1,
        'follow_user_id': anonymousUserId,
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
            'follow_user_id': otherUserId2,
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
            .eq('user_id', anonymousUserId);
        expect(result, isNotEmpty);
      });

      test('Update X', () async {
        final result = await supabaseClient
            .from(tableName)
            .update({
              'follow_user_id': otherUserId2,
            })
            .eq('user_id', anonymousUserId)
            .select();
        expect(result, isEmpty);
      });

      test('Delete X', () async {
        final result = await supabaseClient
            .from(tableName)
            .delete()
            .eq('user_id', anonymousUserId)
            .select();
        expect(result, isEmpty);
      });
    });

    group('Others data', () {
      test('Insert X (403 Forbidden)', () async {
        await expectLater(
          () => supabaseClient.from(tableName).insert({
            'user_id': anonymousUserId,
            'follow_user_id': otherUserId2,
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
            .eq('user_id', otherUserId1);
        expect(result, isNotEmpty);
      });

      test('Update X', () async {
        final result = await supabaseClient
            .from(tableName)
            .update({
              'follow_user_id': otherUserId2,
            })
            .eq('user_id', otherUserId1)
            .select();
        expect(result, isEmpty);
      });

      test('Delete X', () async {
        final result = await supabaseClient
            .from(tableName)
            .delete()
            .eq('user_id', otherUserId1)
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
    });

    tearDownAll(() async {
      await supabaseClient.auth.signOut();
    });

    group('Own data', () {
      test('Insert O', () async {
        final result = await supabaseClient.from(tableName).insert({
          'user_id': userId,
          'follow_user_id': otherUserId1,
        }).select();
        expect(result, isNotEmpty);
      });

      test('Select O', () async {
        final result =
            await supabaseClient.from(tableName).select().eq('user_id', userId);
        expect(result, isNotEmpty);
      });

      test('Update O', () async {
        final result = await supabaseClient
            .from(tableName)
            .update({
              'follow_user_id': otherUserId2,
            })
            .eq('user_id', userId)
            .select();
        expect(result, isNotEmpty);
      });

      test('Delete O', () async {
        final result = await supabaseClient
            .from(tableName)
            .delete()
            .eq('user_id', userId)
            .select();
        expect(result, isNotEmpty);
      });
    });

    group('Others data', () {
      test('Insert X (403 Forbidden)', () {
        expect(
          () => supabaseClient.from(tableName).insert({
            'user_id': otherUserId1,
            'follow_user_id': otherUserId2,
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
            .eq('user_id', otherUserId1);
        expect(result, isNotEmpty);
      });

      test('Update X', () async {
        final result = await supabaseClient
            .from(tableName)
            .update({
              'follow_user_id': otherUserId2,
            })
            .eq('user_id', otherUserId1)
            .select();
        expect(result, isEmpty);
      });

      test('Delete X', () async {
        final result = await supabaseClient
            .from(tableName)
            .delete()
            .eq('user_id', otherUserId1)
            .select();
        expect(result, isEmpty);
      });
    });
  });
}

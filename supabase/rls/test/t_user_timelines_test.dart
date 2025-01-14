import 'package:faker/faker.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:supabase/supabase.dart';
import 'package:test/test.dart';

import 'matchers/matcher.dart';

void main() {
  const tableName = 't_user_timelines';
  final supabaseClient = SupabaseClient(
    Env.supabaseUrl,
    Env.supabaseAnonKey,
  );
  final supabaseClientAdmin = SupabaseClient(
    Env.supabaseUrl,
    Env.supabaseServiceRoleKey!,
  );
  late final String otherUserId;
  late final int otherUserPostId;

  setUpAll(() async {
    await supabaseClient.auth.signInAnonymously();
    otherUserId = supabaseClient.auth.currentUser!.id;
    await supabaseClient.auth.signOut();
    final tPost = await supabaseClientAdmin
        .from('t_posts')
        .insert({
          'user_id': otherUserId,
          'text': 'Post text',
        })
        .select()
        .single();
    otherUserPostId = tPost['id'] as int;
  });

  group('Anon User', () {
    test('Insert X (403 Unauthorized)', () async {
      await expectLater(
        () => supabaseClient.from(tableName).insert({
          'user_id': otherUserId,
          'type': 'follow',
          'post_id': otherUserPostId,
        }),
        throwsRlsError(tableName, RlsErrorDetailsType.unauthorized),
      );
    });

    test('Select X', () async {
      final result = await supabaseClient
          .from(tableName)
          .select()
          .eq('user_id', otherUserId);
      expect(result, isEmpty);
    });

    test('Update X', () async {
      final result = await supabaseClient
          .from(tableName)
          .update({
            'post_id': otherUserPostId,
          })
          .eq('user_id', otherUserId)
          .select();
      expect(result, isEmpty);
    });

    test('Delete X', () async {
      final result = await supabaseClient
          .from(tableName)
          .delete()
          .eq('user_id', otherUserId)
          .select();
      expect(result, isEmpty);
    });
  });

  group('Anonymous User', () {
    late final String anonymousUserId;
    late final int anonymousUserPostId;

    setUpAll(() async {
      final user = await supabaseClient.auth.signInAnonymously();
      anonymousUserId = user.user!.id;
      final tPost = await supabaseClientAdmin
          .from('t_posts')
          .insert({
            'user_id': anonymousUserId,
            'text': 'Post text',
          })
          .select()
          .single();
      anonymousUserPostId = tPost['id'] as int;
      await supabaseClientAdmin.from(tableName).insert({
        'user_id': anonymousUserId,
        'type': 'follow',
        'post_id': anonymousUserPostId,
      });
      await supabaseClientAdmin.from(tableName).insert({
        'user_id': otherUserId,
        'type': 'follow',
        'post_id': otherUserPostId,
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
            'type': 'follow',
            'post_id': anonymousUserPostId,
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
              'post_id': anonymousUserPostId,
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
            'user_id': otherUserId,
            'type': 'follow',
            'post_id': otherUserPostId,
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
            .eq('user_id', otherUserId);
        expect(result, isNotEmpty);
      });

      test('Update X', () async {
        final result = await supabaseClient
            .from(tableName)
            .update({
              'post_id': otherUserPostId,
            })
            .eq('user_id', otherUserId)
            .select();
        expect(result, isEmpty);
      });

      test('Delete X', () async {
        final result = await supabaseClient
            .from(tableName)
            .delete()
            .eq('user_id', otherUserId)
            .select();
        expect(result, isEmpty);
      });
    });
  });

  group('Authenticated User', () {
    final email = faker.internet.email();
    final password = faker.internet.password();
    late final String userId;
    late final int postId;

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
      final tPost = await supabaseClientAdmin
          .from('t_posts')
          .insert({
            'user_id': userId,
            'text': 'Post text',
          })
          .select()
          .single();
      postId = tPost['id'] as int;
    });

    tearDownAll(() async {
      await supabaseClient.auth.signOut();
    });

    group('Own data', () {
      test('Insert O', () async {
        final result = await supabaseClient.from(tableName).insert({
          'user_id': userId,
          'type': 'follow',
          'post_id': postId,
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
              'post_id': otherUserPostId,
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
      late final String otherUserId2;
      late final int otherUserPostId2;

      setUpAll(() async {
        final user = await supabaseClient.auth.signInAnonymously();
        otherUserId2 = user.user!.id;
        final tPost = await supabaseClientAdmin
            .from('t_posts')
            .insert({
              'user_id': otherUserId2,
              'text': 'Post text',
            })
            .select()
            .single();
        otherUserPostId2 = tPost['id'] as int;
        await supabaseClient.auth.signOut();
        await supabaseClient.auth.signInWithPassword(
          email: email,
          password: password,
        );
      });

      test('Insert O', () async {
        final result = await supabaseClient.from(tableName).insert({
          'user_id': otherUserId2,
          'type': 'follow',
          'post_id': otherUserPostId2,
        }).select();
        expect(result, isNotEmpty);
      });

      test('Select O', () async {
        final result = await supabaseClient
            .from(tableName)
            .select()
            .eq('user_id', otherUserId);
        expect(result, isNotEmpty);
      });

      test('Update X', () async {
        final result = await supabaseClient
            .from(tableName)
            .update({
              'post_id': otherUserPostId,
            })
            .eq('user_id', otherUserId)
            .select();
        expect(result, isEmpty);
      });

      test('Delete O', () async {
        final result = await supabaseClient
            .from(tableName)
            .delete()
            .eq('user_id', otherUserId)
            .select();
        expect(result, isNotEmpty);
      });
    });
  });
}

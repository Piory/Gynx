import 'package:faker/faker.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:supabase/supabase.dart';
import 'package:test/test.dart';

import 'matchers/matcher.dart';

void main() {
  const tableName = 't_post_medias';
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
          'post_id': otherUserPostId,
          'display_order': 1,
          'type': 'image',
          'url': 'https://example.com/image.jpg',
        }),
        throwsRlsError(tableName, RlsErrorDetailsType.unauthorized),
      );
    });

    test('Select X', () async {
      final result = await supabaseClient
          .from(tableName)
          .select()
          .eq('post_id', otherUserPostId);
      expect(result, isEmpty);
    });

    test('Update X', () async {
      final result = await supabaseClient
          .from(tableName)
          .update({
            'url': 'https://example.com/image.jpg',
          })
          .eq('post_id', otherUserPostId)
          .select();
      expect(result, isEmpty);
    });

    test('Delete X', () async {
      final result = await supabaseClient
          .from(tableName)
          .delete()
          .eq('post_id', otherUserPostId)
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
        'post_id': anonymousUserPostId,
        'display_order': 1,
        'type': 'image',
        'url': 'https://example.com/image.jpg',
      });
      await supabaseClientAdmin.from(tableName).insert({
        'post_id': otherUserPostId,
        'display_order': 1,
        'type': 'image',
        'url': 'https://example.com/image.jpg',
      });
    });

    tearDownAll(() async {
      await supabaseClient.auth.signOut();
    });

    group('Own data', () {
      test('Insert X (403 Forbidden)', () async {
        await expectLater(
          () => supabaseClient.from(tableName).insert({
            'post_id': anonymousUserPostId,
            'display_order': 2,
            'type': 'image',
            'url': 'https://example.com/image.jpg',
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
            .eq('post_id', anonymousUserPostId);
        expect(result, isNotEmpty);
      });

      test('Update X', () async {
        final result = await supabaseClient
            .from(tableName)
            .update({
              'url': 'https://example.com/image.jpg',
            })
            .eq('post_id', anonymousUserPostId)
            .select();
        expect(result, isEmpty);
      });

      test('Delete X', () async {
        final result = await supabaseClient
            .from(tableName)
            .delete()
            .eq('post_id', anonymousUserPostId)
            .select();
        expect(result, isEmpty);
      });
    });

    group('Others data', () {
      test('Insert X (403 Forbidden)', () async {
        await expectLater(
          () => supabaseClient.from(tableName).insert({
            'post_id': otherUserPostId,
            'display_order': 2,
            'type': 'image',
            'url': 'https://example.com/image.jpg',
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
            .eq('post_id', otherUserPostId);
        expect(result, isNotEmpty);
      });

      test('Update X', () async {
        final result = await supabaseClient
            .from(tableName)
            .update({
              'url': 'https://example.com/image.jpg',
            })
            .eq('post_id', otherUserPostId)
            .select();
        expect(result, isEmpty);
      });

      test('Delete X', () async {
        final result = await supabaseClient
            .from(tableName)
            .delete()
            .eq('post_id', otherUserPostId)
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
          'post_id': postId,
          'display_order': 1,
          'type': 'image',
          'url': 'https://example.com/image.jpg',
        }).select();
        expect(result, isNotEmpty);
      });

      test('Select O', () async {
        final result =
            await supabaseClient.from(tableName).select().eq('post_id', postId);
        expect(result, isNotEmpty);
      });

      test('Update O', () async {
        final result = await supabaseClient
            .from(tableName)
            .update({
              'url': 'https://example.com/image.jpg',
            })
            .eq('post_id', postId)
            .select();
        expect(result, isNotEmpty);
      });

      test('Delete O', () async {
        final result = await supabaseClient
            .from(tableName)
            .delete()
            .eq('post_id', postId)
            .select();
        expect(result, isNotEmpty);
      });
    });

    group('Others data', () {
      test('Insert X (403 Forbidden)', () {
        expect(
          () => supabaseClient.from(tableName).insert({
            'post_id': otherUserPostId,
            'display_order': 1,
            'type': 'image',
            'url': 'https://example.com/image.jpg',
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
            .eq('post_id', otherUserPostId);
        expect(result, isNotEmpty);
      });

      test('Update X', () async {
        final result = await supabaseClient
            .from(tableName)
            .update({
              'url': 'https://example.com/image.jpg',
            })
            .eq('post_id', otherUserPostId)
            .select();
        expect(result, isEmpty);
      });

      test('Delete X', () async {
        final result = await supabaseClient
            .from(tableName)
            .delete()
            .eq('post_id', otherUserPostId)
            .select();
        expect(result, isEmpty);
      });
    });
  });
}

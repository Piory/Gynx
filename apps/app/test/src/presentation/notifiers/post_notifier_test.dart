import 'dart:async';

import 'package:app/src/domain/entities/v_post.dart';
import 'package:app/src/domain/models/suite_user.dart';
import 'package:app/src/domain/usecases/favorite_post_usecase.dart';
import 'package:app/src/presentation/notifiers/post_map_notifier.dart';
import 'package:app/src/presentation/notifiers/post_notifier.dart';
import 'package:app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';
import 'post_notifier_test.mocks.dart';
import 'util.dart';

class FakePostMapNotifier extends PostMapNotifier {
  FakePostMapNotifier(this._vPostMap);

  final Map<int, VPost> _vPostMap;

  @override
  Map<int, VPost> build() => _vPostMap;
}

class FakeSuiteUserNotifier extends SuiteUserNotifier {
  FakeSuiteUserNotifier({
    required ValueSetter<VPost> addFavoritePostCallback,
    required ValueSetter<int> removeFavoritePostByPostIdCallback,
  })  : _addFavoritePostCallback = addFavoritePostCallback,
        _removeFavoritePostByPostIdCallback = removeFavoritePostByPostIdCallback;

  final ValueSetter<VPost> _addFavoritePostCallback;
  final ValueSetter<int> _removeFavoritePostByPostIdCallback;

  @override
  FutureOr<SuiteUser> build() => generateDummySuiteUser();

  @override
  void addFavoritePost(VPost vPost) => _addFavoritePostCallback(vPost);

  @override
  void removeFavoritePostByPostId(int postId) => _removeFavoritePostByPostIdCallback(postId);
}

@GenerateNiceMocks([
  MockSpec<FavoritePostUseCase>(),
])
void main() {
  final postId = faker.randomGenerator.integer(100000);
  final vPost = generateDummyVPost(
    postId: postId,
  );
  final mockFavoritePostUseCase = MockFavoritePostUseCase();

  setUpAll(() {
    GetIt.I.registerSingleton<FavoritePostUseCase>(mockFavoritePostUseCase);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockFavoritePostUseCase);
    reset(mockFavoritePostUseCase);
  });

  group('#toggleFavorite', () {
    group('正常系', () {
      test('渡された postId が FavoritePostUseCase#execute に渡され、isDeleted が false の場合は、SuiteUserNotifier#addFavoritePost が呼ばれること', () async {
        final afterVPost = vPost.copyWith(
          isFavorited: !vPost.isFavorited,
          favoriteCount: vPost.favoriteCount + 1,
        );
        when(mockFavoritePostUseCase.execute(postId: postId)).thenAnswer((_) async => (
              vPost: afterVPost,
              isDeleted: false,
            ));
        var addFavoritePostCallCount = 0;
        final fakeSuiteUserNotifier = FakeSuiteUserNotifier(
          addFavoritePostCallback: (vPost) {
            addFavoritePostCallCount++;
            expect(vPost, afterVPost);
          },
          removeFavoritePostByPostIdCallback: (_) => fail('removeFavoritePostByPostIdCallback should not be called'),
        );
        final container = createContainer(
          overrides: [
            suiteUserNotifierProvider.overrideWith(() => fakeSuiteUserNotifier),
            postMapNotifierProvider.overrideWith(() => FakePostMapNotifier({postId: vPost}))
          ],
        );
        expect(container.read(postNotifierProvider(postId)), vPost);
        verifyNever(mockFavoritePostUseCase.execute(postId: postId));
        expect(addFavoritePostCallCount, 0);
        await container.read(postNotifierProvider(postId).notifier).toggleFavorite();
        verify(mockFavoritePostUseCase.execute(postId: postId));
        expect(addFavoritePostCallCount, 1);
        expect(container.read(postMapNotifierProvider), {postId: afterVPost});
      });

      test('渡された postId が FavoritePostUseCase#execute に渡され、isDeleted が true の場合は、SuiteUserNotifier#removeFavoritePostByPostId が呼ばれること', () async {
        final afterVPost = vPost.copyWith(
          isFavorited: !vPost.isFavorited,
          favoriteCount: vPost.favoriteCount - 1,
        );
        when(mockFavoritePostUseCase.execute(postId: postId)).thenAnswer((_) async => (
              vPost: afterVPost,
              isDeleted: true,
            ));
        var removeFavoritePostByPostIdCallCount = 0;
        final fakeSuiteUserNotifier = FakeSuiteUserNotifier(
          addFavoritePostCallback: (_) => fail('addFavoritePostCallback should not be called'),
          removeFavoritePostByPostIdCallback: (postId) {
            removeFavoritePostByPostIdCallCount++;
            expect(postId, afterVPost.postId);
          },
        );
        final container = createContainer(
          overrides: [
            suiteUserNotifierProvider.overrideWith(() => fakeSuiteUserNotifier),
            postMapNotifierProvider.overrideWith(() => FakePostMapNotifier({postId: vPost}))
          ],
        );
        expect(container.read(postNotifierProvider(postId)), vPost);
        verifyNever(mockFavoritePostUseCase.execute(postId: postId));
        expect(removeFavoritePostByPostIdCallCount, 0);
        await container.read(postNotifierProvider(postId).notifier).toggleFavorite();
        verify(mockFavoritePostUseCase.execute(postId: postId));
        expect(removeFavoritePostByPostIdCallCount, 1);
        expect(container.read(postMapNotifierProvider), {postId: afterVPost});
      });
    });

    group('異常系', () {
      test('FavoritePostUseCase#execute で例外が発生した場合は、postMapNotifierProvider の値は更新されないこと', () async {
        when(mockFavoritePostUseCase.execute(postId: postId)).thenThrow(Exception('test error'));
        final container = createContainer(
          overrides: [
            postMapNotifierProvider.overrideWith(() => FakePostMapNotifier({postId: vPost}))
          ],
        );
        expect(container.read(postNotifierProvider(postId)), vPost);
        verifyNever(mockFavoritePostUseCase.execute(postId: postId));
        await container.read(postNotifierProvider(postId).notifier).toggleFavorite();
        verify(mockFavoritePostUseCase.execute(postId: postId));
        expect(container.read(postMapNotifierProvider), {postId: vPost});
      });
    });
  });
}

import 'package:faker/faker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/models/t_user_post_favorite_list.dart';
import 'package:gynx_app/src/domain/models/v_post_list.dart';
import 'package:gynx_app/src/domain/models/v_post_with_favorite_list.dart';
import 'package:gynx_app/src/domain/usecases/fetch_user_post_favorite_usecase.dart';
import 'package:gynx_app/src/domain/usecases/fetch_user_post_usecase.dart';
import 'package:gynx_app/src/domain/usecases/find_user_detail_usecase.dart';
import 'package:gynx_app/src/domain/usecases/find_user_usecase.dart';
import 'package:gynx_app/src/domain/usecases/suite_user_usecase.dart';
import 'package:gynx_app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';
import 'suite_user_notifier_test.mocks.dart';
import 'util.dart';

@GenerateNiceMocks([
  MockSpec<SuiteUserUseCase>(),
  MockSpec<FindUserUseCase>(),
  MockSpec<FindUserDetailUseCase>(),
  MockSpec<FetchUserPostUseCase>(),
  MockSpec<FetchUserPostFavoriteUseCase>(),
])
void main() {
  final suiteUser = generateDummySuiteUser();
  final vUser = generateDummyVUser();
  final vUserDetail = generateDummyVUserDetail();
  final mockSuiteUserUseCase = MockSuiteUserUseCase();
  final mockFindUserUseCase = MockFindUserUseCase();
  final mockFindUserDetailUseCase = MockFindUserDetailUseCase();
  final mockFetchUserPostUseCase = MockFetchUserPostUseCase();
  final mockFetchUserPostFavoriteUseCase = MockFetchUserPostFavoriteUseCase();

  setUpAll(() {
    GetIt.I.registerSingleton<SuiteUserUseCase>(mockSuiteUserUseCase);
    GetIt.I.registerSingleton<FindUserUseCase>(mockFindUserUseCase);
    GetIt.I.registerSingleton<FindUserDetailUseCase>(mockFindUserDetailUseCase);
    GetIt.I.registerSingleton<FetchUserPostUseCase>(mockFetchUserPostUseCase);
    GetIt.I.registerSingleton<FetchUserPostFavoriteUseCase>(
      mockFetchUserPostFavoriteUseCase,
    );
  });

  tearDown(() {
    verifyNoMoreInteractions(mockSuiteUserUseCase);
    verifyNoMoreInteractions(mockFindUserUseCase);
    verifyNoMoreInteractions(mockFindUserDetailUseCase);
    verifyNoMoreInteractions(mockFetchUserPostUseCase);
    verifyNoMoreInteractions(mockFetchUserPostFavoriteUseCase);
    reset(mockSuiteUserUseCase);
    reset(mockFindUserUseCase);
    reset(mockFindUserDetailUseCase);
    reset(mockFetchUserPostUseCase);
    reset(mockFetchUserPostFavoriteUseCase);
  });

  group('正常系', () {
    test('SuiteUserUseCase#execute が呼ばれること', () async {
      when(mockSuiteUserUseCase.execute()).thenAnswer((_) async => suiteUser);
      when(mockFindUserUseCase.execute(suiteUser.vUserDetail.userId)).thenAnswer((_) async => vUser);
      when(mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId)).thenAnswer((_) async => vUserDetail);
      final result = await createContainer().read(suiteUserNotifierProvider.future);
      expect(result, suiteUser);
      verifyInOrder([
        mockSuiteUserUseCase.execute(),
        mockFindUserUseCase.execute(suiteUser.vUserDetail.userId),
        mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId),
      ]);
    });
  });

  group('#addPost', () {
    group('正常系', () {
      test('SuiteUser.VUserDetail.latestPosts に、渡した VPost が追加されていること', () async {
        when(mockSuiteUserUseCase.execute()).thenAnswer((_) async => suiteUser);
        when(mockFindUserUseCase.execute(suiteUser.vUserDetail.userId)).thenAnswer((_) async => vUser);
        when(mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId)).thenAnswer((_) async => vUserDetail);
        final vPost = generateDummyVPost(
          postId: faker.randomGenerator.integer(100),
        );
        final container = createContainer();
        verifyNever(mockSuiteUserUseCase.execute());
        verifyNever(
          mockFindUserUseCase.execute(suiteUser.vUserDetail.userId),
        );
        verifyNever(
          mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId),
        );
        await container.read(suiteUserNotifierProvider.future);
        verifyInOrder([
          mockSuiteUserUseCase.execute(),
          mockFindUserUseCase.execute(suiteUser.vUserDetail.userId),
          mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId),
        ]);
        final result = await container.read(suiteUserNotifierProvider.future);
        expect(result.vUserDetail.latestPostList, isEmpty);
        container.read(suiteUserNotifierProvider.notifier).addPost(vPost);
        final addedResult = await container.read(suiteUserNotifierProvider.future);
        expect(
          addedResult.vUserDetail.latestPostList.vPosts,
          contains(vPost),
        );
      });
    });
  });

  group('#addFavoritePost', () {
    group('正常系', () {
      test('SuiteUser.VUserDetail.favoritePosts に、渡した VPost が追加されていること', () async {
        when(mockSuiteUserUseCase.execute()).thenAnswer((_) async => suiteUser);
        when(mockFindUserUseCase.execute(suiteUser.vUserDetail.userId)).thenAnswer((_) async => vUser);
        when(mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId)).thenAnswer((_) async => vUserDetail);
        final vPost = generateDummyVPost(
          postId: faker.randomGenerator.integer(100),
        );
        final container = createContainer();
        verifyNever(mockSuiteUserUseCase.execute());
        verifyNever(
          mockFindUserUseCase.execute(suiteUser.vUserDetail.userId),
        );
        verifyNever(
          mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId),
        );
        await container.read(suiteUserNotifierProvider.future);
        verifyInOrder([
          mockSuiteUserUseCase.execute(),
          mockFindUserUseCase.execute(suiteUser.vUserDetail.userId),
          mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId),
        ]);
        final result = await container.read(suiteUserNotifierProvider.future);
        expect(result.vUserDetail.favoritePostList, isEmpty);
        container.read(suiteUserNotifierProvider.notifier).addFavoritePost(vPost);
        final addedResult = await container.read(suiteUserNotifierProvider.future);
        expect(
          addedResult.vUserDetail.favoritePostList.vPosts,
          contains(vPost),
        );
      });
    });
  });

  group('#removeFavoritePostByPostId', () {
    group('正常系', () {
      test('SuiteUser.VUserDetail.favoritePosts から、指定した postId の VPost が削除されていること', () async {
        when(mockSuiteUserUseCase.execute()).thenAnswer((_) async => suiteUser);
        when(mockFindUserUseCase.execute(suiteUser.vUserDetail.userId)).thenAnswer((_) async => vUser);
        when(mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId)).thenAnswer((_) async => vUserDetail);
        final vPost = generateDummyVPost(
          postId: faker.randomGenerator.integer(100),
        );
        final container = createContainer();
        verifyNever(mockSuiteUserUseCase.execute());
        verifyNever(
          mockFindUserUseCase.execute(suiteUser.vUserDetail.userId),
        );
        verifyNever(
          mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId),
        );
        await container.read(suiteUserNotifierProvider.future);
        verifyInOrder([
          mockSuiteUserUseCase.execute(),
          mockFindUserUseCase.execute(suiteUser.vUserDetail.userId),
          mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId),
        ]);
        final result = await container.read(suiteUserNotifierProvider.future);
        expect(result.vUserDetail.favoritePostList, isEmpty);
        container.read(suiteUserNotifierProvider.notifier).addFavoritePost(vPost);
        final addedResult = await container.read(suiteUserNotifierProvider.future);
        expect(
          addedResult.vUserDetail.favoritePostList.vPosts,
          contains(vPost),
        );
        container.read(suiteUserNotifierProvider.notifier).removeFavoritePostByPostId(vPost.postId);
        final removedResult = await container.read(suiteUserNotifierProvider.future);
        expect(
          removedResult.vUserDetail.favoritePostList.vPosts,
          isNot(contains(vPost)),
        );
      });
    });
  });

  group('#fetchNextForLatestPosts', () {
    late ProviderContainer container;

    setUp(() async {
      when(mockSuiteUserUseCase.execute()).thenAnswer((_) async => suiteUser);
      when(mockFindUserUseCase.execute(suiteUser.vUserDetail.userId)).thenAnswer((_) async => vUser);
      when(mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId)).thenAnswer((_) async => vUserDetail);
      container = createContainer();
      final result = await container.read(suiteUserNotifierProvider.future);
      expect(result, suiteUser);
      verifyInOrder([
        mockSuiteUserUseCase.execute(),
        mockFindUserUseCase.execute(suiteUser.vUserDetail.userId),
        mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId),
      ]);
    });

    group('正常系', () {
      test('SuiteUser.VUserDetail.latestPosts に、新しい VPost が追加されていること', () async {
        final vPost1 = generateDummyVPost(postId: 1);
        final vPost2 = generateDummyVPost(postId: 2);
        final vPost3 = generateDummyVPost(postId: 3);
        final vPostList = VPostList([vPost1, vPost2, vPost3]);
        when(
          mockFetchUserPostUseCase.execute(
            userId: suiteUser.vUserDetail.userId,
            sincePostId: suiteUser.vUserDetail.latestPostList.maxPostId,
          ),
        ).thenAnswer((_) async => vPostList);
        expect(
          container.read(suiteUserNotifierProvider).requireValue.vUserDetail.latestPostList,
          isEmpty,
        );
        verifyNever(
          mockFetchUserPostUseCase.execute(
            userId: suiteUser.vUserDetail.userId,
            sincePostId: suiteUser.vUserDetail.latestPostList.maxPostId,
          ),
        );
        await container.read(suiteUserNotifierProvider.notifier).fetchNextForLatestPosts();
        verify(
          mockFetchUserPostUseCase.execute(
            userId: suiteUser.vUserDetail.userId,
            sincePostId: suiteUser.vUserDetail.latestPostList.maxPostId,
          ),
        );
        expect(
          container.read(suiteUserNotifierProvider).requireValue.vUserDetail.latestPostList,
          vPostList,
        );
      });
    });
  });

  group('#fetchPreviousForLatestPosts', () {
    late ProviderContainer container;

    setUp(() async {
      when(mockSuiteUserUseCase.execute()).thenAnswer((_) async => suiteUser);
      when(mockFindUserUseCase.execute(suiteUser.vUserDetail.userId)).thenAnswer((_) async => vUser);
      when(mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId)).thenAnswer((_) async => vUserDetail);
      container = createContainer();
      final result = await container.read(suiteUserNotifierProvider.future);
      expect(result, suiteUser);
      verifyInOrder([
        mockSuiteUserUseCase.execute(),
        mockFindUserUseCase.execute(suiteUser.vUserDetail.userId),
        mockFindUserDetailUseCase.execute(suiteUser.vUserDetail.userId),
      ]);
    });

    group('正常系', () {
      test('SuiteUser.VUserDetail.latestPosts に、新しい VPost が追加されていること', () async {
        final vPost1 = generateDummyVPost(postId: 1);
        final vPost2 = generateDummyVPost(postId: 2);
        final vPost3 = generateDummyVPost(postId: 3);
        final vPostList = VPostList([vPost1, vPost2, vPost3]);
        when(
          mockFetchUserPostUseCase.execute(
            userId: suiteUser.vUserDetail.userId,
            maxPostId: suiteUser.vUserDetail.latestPostList.minPostId,
          ),
        ).thenAnswer((_) async => vPostList);
        expect(
          container.read(suiteUserNotifierProvider).requireValue.vUserDetail.latestPostList,
          isEmpty,
        );
        verifyNever(
          mockFetchUserPostUseCase.execute(
            userId: suiteUser.vUserDetail.userId,
            maxPostId: suiteUser.vUserDetail.latestPostList.minPostId,
          ),
        );
        await container.read(suiteUserNotifierProvider.notifier).fetchNextForLatestPosts();
        verify(
          mockFetchUserPostUseCase.execute(
            userId: suiteUser.vUserDetail.userId,
            maxPostId: suiteUser.vUserDetail.latestPostList.minPostId,
          ),
        );
        expect(
          container.read(suiteUserNotifierProvider).requireValue.vUserDetail.latestPostList,
          vPostList,
        );
      });
    });
  });

  group('#fetchLatestForFavoritePosts', () {
    late ProviderContainer container;
    final vPost = generateDummyVPost(
      postId: faker.randomGenerator.integer(100),
    );

    setUp(() async {
      final su = suiteUser.copyWith(
        vUserDetail: suiteUser.vUserDetail.copyWith(
          favoritePosts: [
            vPost,
          ],
        ),
      );
      when(mockSuiteUserUseCase.execute()).thenAnswer((_) async => su);
      when(mockFindUserUseCase.execute(su.vUserDetail.userId)).thenAnswer((_) async => vUser);
      when(mockFindUserDetailUseCase.execute(su.vUserDetail.userId)).thenAnswer((_) async => vUserDetail);
      container = createContainer();
      final result = await container.read(suiteUserNotifierProvider.future);
      expect(result, su);
      verifyInOrder([
        mockSuiteUserUseCase.execute(),
        mockFindUserUseCase.execute(su.vUserDetail.userId),
        mockFindUserDetailUseCase.execute(su.vUserDetail.userId),
      ]);
    });

    group('正常系', () {
      test('SuiteUser.VUserDetail.latestPosts に、新しい VPost が追加されていること', () async {
        final vPost1 = generateDummyVPost(postId: 1);
        final vPost2 = generateDummyVPost(postId: 2);
        final vPost3 = generateDummyVPost(postId: 3);
        final vPostList = VPostList([vPost1, vPost2, vPost3]);
        final tUserPostFavoriteList = TUserPostFavoriteList(
          [
            generateDummyTUserPostFavorite().copyWith(
              postId: 1,
            ),
            generateDummyTUserPostFavorite().copyWith(
              postId: 2,
            ),
            generateDummyTUserPostFavorite().copyWith(
              postId: 3,
            ),
          ],
        );
        final vPostWithFavoriteList = VPostWithFavoriteList.by(
          vPostList,
          tUserPostFavoriteList,
        );
        when(
          mockFetchUserPostFavoriteUseCase.execute(
            userId: suiteUser.vUserDetail.userId,
            latestAt: vPost.createdAt,
          ),
        ).thenAnswer((_) async => vPostWithFavoriteList);
        expect(
          container.read(suiteUserNotifierProvider).requireValue.vUserDetail.favoritePostList,
          VPostList([vPost]),
        );
        verifyNever(
          mockFetchUserPostFavoriteUseCase.execute(
            userId: suiteUser.vUserDetail.userId,
            latestAt: vPost.createdAt,
          ),
        );
        await container.read(suiteUserNotifierProvider.notifier).fetchNextForFavoritePosts();
        verify(
          mockFetchUserPostFavoriteUseCase.execute(
            userId: suiteUser.vUserDetail.userId,
            latestAt: vPost.createdAt,
          ),
        );
        expect(
          container.read(suiteUserNotifierProvider).requireValue.vUserDetail.favoritePostList,
          VPostList([
            vPost,
            ...vPostList.vPosts,
          ]),
        );
      });
    });
  });

  group('#fetchPreviousForFavoritePosts', () {
    late ProviderContainer container;
    final vPost = generateDummyVPost(
      postId: faker.randomGenerator.integer(100),
    );

    setUp(() async {
      final su = suiteUser.copyWith(
        vUserDetail: suiteUser.vUserDetail.copyWith(
          favoritePosts: [
            vPost,
          ],
        ),
      );
      when(mockSuiteUserUseCase.execute()).thenAnswer((_) async => su);
      when(mockFindUserUseCase.execute(su.vUserDetail.userId)).thenAnswer((_) async => vUser);
      when(mockFindUserDetailUseCase.execute(su.vUserDetail.userId)).thenAnswer((_) async => vUserDetail);
      container = createContainer();
      final result = await container.read(suiteUserNotifierProvider.future);
      expect(result, su);
      verifyInOrder([
        mockSuiteUserUseCase.execute(),
        mockFindUserUseCase.execute(su.vUserDetail.userId),
        mockFindUserDetailUseCase.execute(su.vUserDetail.userId),
      ]);
    });

    group('正常系', () {
      test('SuiteUser.VUserDetail.latestPosts に、新しい VPost が追加されていること', () async {
        final vPost1 = generateDummyVPost(postId: 1);
        final vPost2 = generateDummyVPost(postId: 2);
        final vPost3 = generateDummyVPost(postId: 3);
        final vPostList = VPostList([vPost1, vPost2, vPost3]);
        final tUserPostFavoriteList = TUserPostFavoriteList(
          [
            generateDummyTUserPostFavorite().copyWith(
              postId: 1,
            ),
            generateDummyTUserPostFavorite().copyWith(
              postId: 2,
            ),
            generateDummyTUserPostFavorite().copyWith(
              postId: 3,
            ),
          ],
        );
        final vPostWithFavoriteList = VPostWithFavoriteList.by(
          vPostList,
          tUserPostFavoriteList,
        );
        when(
          mockFetchUserPostFavoriteUseCase.execute(
            userId: suiteUser.vUserDetail.userId,
            oldestAt: vPost.createdAt,
          ),
        ).thenAnswer((_) async => vPostWithFavoriteList);
        expect(
          container.read(suiteUserNotifierProvider).requireValue.vUserDetail.favoritePostList,
          VPostList([vPost]),
        );
        verifyNever(
          mockFetchUserPostFavoriteUseCase.execute(
            userId: suiteUser.vUserDetail.userId,
            oldestAt: vPost.createdAt,
          ),
        );
        await container.read(suiteUserNotifierProvider.notifier).fetchPreviousForFavoritePosts();
        verify(
          mockFetchUserPostFavoriteUseCase.execute(
            userId: suiteUser.vUserDetail.userId,
            oldestAt: vPost.createdAt,
          ),
        );
        expect(
          container.read(suiteUserNotifierProvider).requireValue.vUserDetail.favoritePostList,
          VPostList([
            vPost,
            ...vPostList.vPosts,
          ]),
        );
      });
    });
  });
}

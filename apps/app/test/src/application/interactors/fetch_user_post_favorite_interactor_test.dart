// ignore_for_file: lines_longer_than_80_chars
import 'package:app/src/application/interactors/fetch_user_post_favorite_interactor.dart';
import 'package:app/src/domain/models/post_id_list.dart';
import 'package:app/src/domain/models/t_user_post_favorite_list.dart';
import 'package:app/src/domain/models/v_post_list.dart';
import 'package:app/src/domain/models/v_post_with_favorite_list.dart';
import 'package:app/src/domain/repositories/t_user_post_favorite_repository.dart';
import 'package:app/src/domain/repositories/v_post_repository.dart';
import 'package:faker/faker.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';
import 'fetch_user_post_favorite_interactor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<TUserPostFavoriteRepository>(),
  MockSpec<VPostRepository>(),
])
void main() {
  final userId = faker.guid.guid();
  final mockTUserPostFavoriteRepository = MockTUserPostFavoriteRepository();
  final mockVPostRepository = MockVPostRepository();
  final interactor = FetchUserPostFavoriteInteractor(
    mockTUserPostFavoriteRepository,
    mockVPostRepository,
  );
  final vPost1 = generateDummyVPost(postId: 1).copyWith(userId: userId);
  final vPost2 = generateDummyVPost(postId: 2).copyWith(userId: userId);
  final vPostList = VPostList([vPost1, vPost2]);
  final tUserPostFavoriteList = TUserPostFavoriteList([
    generateDummyTUserPostFavorite().copyWith(
      userId: userId,
      postId: vPost1.postId,
    ),
    generateDummyTUserPostFavorite().copyWith(
      userId: userId,
      postId: vPost2.postId,
    ),
  ]);

  tearDown(() {
    verifyNoMoreInteractions(mockTUserPostFavoriteRepository);
    verifyNoMoreInteractions(mockVPostRepository);
    reset(mockTUserPostFavoriteRepository);
    reset(mockVPostRepository);
  });

  group('正常系', () {
    test(
      '引数を何も指定しないと、TUserPostFavoriteRepository#findByUserIdAndLatest と VPostRepository#findByPostIdList が呼ばれること',
      () async {
        when(
          mockTUserPostFavoriteRepository.findByUserIdAndLatest(
            userId,
            Constant.fetchPostCount,
          ),
        ).thenAnswer((_) async => tUserPostFavoriteList);
        when(
          mockVPostRepository.findByPostIdList(
            PostIdList([vPost1.postId, vPost2.postId]),
          ),
        ).thenAnswer((_) async => vPostList);
        expect(
          await interactor.execute(userId: userId),
          VPostWithFavoriteList.by(vPostList, tUserPostFavoriteList),
        );
        verifyInOrder([
          mockTUserPostFavoriteRepository.findByUserIdAndLatest(
            userId,
            Constant.fetchPostCount,
          ),
          mockVPostRepository.findByPostIdList(
            PostIdList([vPost1.postId, vPost2.postId]),
          ),
        ]);
      },
    );

    test(
      'latestAt が指定された場合、TUserPostFavoriteRepository#findByUserIdAndLatestAt と VPostRepository#findByPostIdList が呼ばれること',
      () async {
        final latestAt = faker.date.dateTime();
        when(
          mockTUserPostFavoriteRepository.findByUserIdAndLatestAt(
            userId,
            latestAt,
            Constant.fetchPostCount,
          ),
        ).thenAnswer((_) async => tUserPostFavoriteList);
        when(
          mockVPostRepository.findByPostIdList(
            PostIdList([vPost1.postId, vPost2.postId]),
          ),
        ).thenAnswer((_) async => vPostList);
        expect(
          await interactor.execute(
            userId: userId,
            latestAt: latestAt,
          ),
          VPostWithFavoriteList.by(vPostList, tUserPostFavoriteList),
        );
        verifyInOrder([
          mockTUserPostFavoriteRepository.findByUserIdAndLatestAt(
            userId,
            latestAt,
            Constant.fetchPostCount,
          ),
          mockVPostRepository.findByPostIdList(
            PostIdList([vPost1.postId, vPost2.postId]),
          ),
        ]);
      },
    );

    test(
      'oldestAt が指定された場合、TUserPostFavoriteRepository#findByUserIdAndOldestAt と VPostRepository#findByPostIdList が呼ばれること',
      () async {
        final oldestAt = faker.date.dateTime();
        when(
          mockTUserPostFavoriteRepository.findByUserIdAndOldestAt(
            userId,
            oldestAt,
            Constant.fetchPostCount,
          ),
        ).thenAnswer((_) async => tUserPostFavoriteList);
        when(
          mockVPostRepository.findByPostIdList(
            PostIdList([vPost1.postId, vPost2.postId]),
          ),
        ).thenAnswer((_) async => vPostList);
        expect(
          await interactor.execute(
            userId: userId,
            oldestAt: oldestAt,
          ),
          VPostWithFavoriteList.by(vPostList, tUserPostFavoriteList),
        );
        verifyInOrder([
          mockTUserPostFavoriteRepository.findByUserIdAndOldestAt(
            userId,
            oldestAt,
            Constant.fetchPostCount,
          ),
          mockVPostRepository.findByPostIdList(
            PostIdList([vPost1.postId, vPost2.postId]),
          ),
        ]);
      },
    );
  });
}

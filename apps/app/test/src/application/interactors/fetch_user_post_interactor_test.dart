import 'package:app/src/application/interactors/fetch_user_post_interactor.dart';
import 'package:app/src/domain/models/v_post_list.dart';
import 'package:app/src/domain/repositories/v_post_repository.dart';
import 'package:config/config.dart';
import 'package:faker/faker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';
import 'fetch_user_post_interactor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<VPostRepository>(),
])
void main() {
  final userId = faker.guid.guid();
  final mockVPostRepository = MockVPostRepository();
  final interactor = FetchUserPostInteractor(mockVPostRepository);
  final vPostList = VPostList([
    generateDummyVPost(postId: 1).copyWith(userId: userId),
    generateDummyVPost(postId: 2).copyWith(userId: userId),
  ]);

  tearDown(() {
    verifyNoMoreInteractions(mockVPostRepository);
    reset(mockVPostRepository);
  });

  group('正常系', () {
    test(
      '引数を何も指定しないと、VPostRepository#findByUserIdAndLatest が呼ばれること',
      () async {
        when(
          mockVPostRepository.findByUserIdAndLatest(
            userId,
            Constant.fetchPostCount,
          ),
        ).thenAnswer((_) async => vPostList);
        expect(await interactor.execute(userId: userId), vPostList);
        verify(
          mockVPostRepository.findByUserIdAndLatest(
            userId,
            Constant.fetchPostCount,
          ),
        );
      },
    );

    test(
      'sincePostId が指定された場合、VPostRepository#findByUserIdAndSincePostId が呼ばれること',
      () async {
        final sincePostId = faker.randomGenerator.integer(100);
        when(
          mockVPostRepository.findByUserIdAndSincePostId(
            userId,
            sincePostId,
            Constant.fetchPostCount,
          ),
        ).thenAnswer((_) async => vPostList);
        expect(
          await interactor.execute(
            userId: userId,
            sincePostId: sincePostId,
          ),
          vPostList,
        );
        verify(
          mockVPostRepository.findByUserIdAndSincePostId(
            userId,
            sincePostId,
            Constant.fetchPostCount,
          ),
        );
      },
    );

    test(
      'maxPostId が指定された場合、VPostRepository#findByMaxPostId が呼ばれること',
      () async {
        final maxPostId = faker.randomGenerator.integer(100);
        when(
          mockVPostRepository.findByUserIdAndMaxPostId(
            userId,
            maxPostId,
            Constant.fetchPostCount,
          ),
        ).thenAnswer((_) async => vPostList);
        expect(
            await interactor.execute(
              userId: userId,
              maxPostId: maxPostId,
            ),
            vPostList);
        verify(
          mockVPostRepository.findByUserIdAndMaxPostId(
            userId,
            maxPostId,
            Constant.fetchPostCount,
          ),
        );
      },
    );
  });
}

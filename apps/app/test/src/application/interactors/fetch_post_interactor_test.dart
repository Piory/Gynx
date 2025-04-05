import 'package:app/src/application/interactors/fetch_post_interactor.dart';
import 'package:app/src/domain/models/v_post_list.dart';
import 'package:app/src/domain/repositories/v_post_repository.dart';
import 'package:config/config.dart';
import 'package:faker/faker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';
import 'fetch_post_interactor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<VPostRepository>(),
])
void main() {
  final mockVPostRepository = MockVPostRepository();
  final interactor = FetchPostInteractor(mockVPostRepository);
  final vPostList = VPostList([
    generateDummyVPost(postId: 1),
    generateDummyVPost(postId: 2),
  ]);

  tearDown(() {
    verifyNoMoreInteractions(mockVPostRepository);
    reset(mockVPostRepository);
  });

  group('正常系', () {
    test(
      '引数を何も指定しないと、VPostRepository#findByLatest が呼ばれること',
      () async {
        when(mockVPostRepository.findByLatest(Constant.fetchPostCount)).thenAnswer((_) async => vPostList);
        expect(await interactor.execute(), vPostList);
        verify(mockVPostRepository.findByLatest(Constant.fetchPostCount));
      },
    );

    test(
      'sincePostId が指定された場合、VPostRepository#findBySincePostId が呼ばれること',
      () async {
        final sincePostId = faker.randomGenerator.integer(100);
        when(
          mockVPostRepository.findBySincePostId(
            sincePostId,
            Constant.fetchPostCount,
          ),
        ).thenAnswer((_) async => vPostList);
        expect(await interactor.execute(sincePostId: sincePostId), vPostList);
        verify(
          mockVPostRepository.findBySincePostId(
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
          mockVPostRepository.findByMaxPostId(
            maxPostId,
            Constant.fetchPostCount,
          ),
        ).thenAnswer((_) async => vPostList);
        expect(await interactor.execute(maxPostId: maxPostId), vPostList);
        verify(
          mockVPostRepository.findByMaxPostId(
            maxPostId,
            Constant.fetchPostCount,
          ),
        );
      },
    );
  });
}

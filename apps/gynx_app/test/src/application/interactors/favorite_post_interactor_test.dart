import 'package:faker/faker.dart';
import 'package:gynx_app/src/application/interactors/favorite_post_interactor.dart';
import 'package:gynx_app/src/domain/exceptions/user_not_signed_in_exception.dart';
import 'package:gynx_app/src/domain/repositories/auth_repository.dart';
import 'package:gynx_app/src/domain/repositories/t_user_post_favorite_repository.dart';
import 'package:gynx_app/src/domain/repositories/v_post_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';
import 'favorite_post_interactor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthRepository>(),
  MockSpec<TUserPostFavoriteRepository>(),
  MockSpec<VPostRepository>(),
])
void main() {
  final postId = faker.randomGenerator.integer(100);
  final user = generateDummyUser();
  final vPost = generateDummyVPost(postId: postId).copyWith(userId: user.id);
  final mockAuthRepository = MockAuthRepository();
  final mockTUserPostFavoriteRepository = MockTUserPostFavoriteRepository();
  final mockVPostRepository = MockVPostRepository();
  final interactor = FavoritePostInteractor(
    mockAuthRepository,
    mockTUserPostFavoriteRepository,
    mockVPostRepository,
  );

  tearDown(() {
    verifyNoMoreInteractions(mockTUserPostFavoriteRepository);
    verifyNoMoreInteractions(mockVPostRepository);
    reset(mockTUserPostFavoriteRepository);
    reset(mockVPostRepository);
  });

  group('正常系', () {
    setUp(() {
      when(mockAuthRepository.currentUser).thenReturn(user);
    });

    test('TUserPostFavoriteRepository#findByUniqueKey で null が返ってきた場合は、TUserPostFavoriteRepository#create が呼ばれること', () async {
      when(mockTUserPostFavoriteRepository.findByUniqueKey(user.id, postId)).thenAnswer((_) async => null);
      when(mockTUserPostFavoriteRepository.create(
        userId: user.id,
        postId: postId,
      )).thenAnswer((_) async => {});
      when(mockVPostRepository.findByPostId(postId)).thenAnswer((_) async => vPost);
      final result = await interactor.execute(
        postId: postId,
      );
      expect(result, (vPost: vPost, isDeleted: false));
      verifyInOrder([
        mockAuthRepository.currentUser,
        mockTUserPostFavoriteRepository.findByUniqueKey(user.id, postId),
        mockTUserPostFavoriteRepository.create(
          userId: user.id,
          postId: postId,
        ),
        mockVPostRepository.findByPostId(postId),
      ]);
    });

    test('TUserPostFavoriteRepository#findByUniqueKey で null 以外が返ってきた場合は、TUserPostFavoriteRepository#delete が呼ばれること', () async {
      final tUserPostFavorite = generateDummyTUserPostFavorite().copyWith(
        userId: user.id,
        postId: postId,
      );
      when(mockTUserPostFavoriteRepository.findByUniqueKey(user.id, postId)).thenAnswer((_) async => tUserPostFavorite);
      when(mockTUserPostFavoriteRepository.deleteByUniqueKey(user.id, postId)).thenAnswer((_) async => {});
      when(mockVPostRepository.findByPostId(postId)).thenAnswer((_) async => vPost);
      final result = await interactor.execute(
        postId: postId,
      );
      expect(result, (vPost: vPost, isDeleted: true));
      verifyInOrder([
        mockAuthRepository.currentUser,
        mockTUserPostFavoriteRepository.findByUniqueKey(user.id, postId),
        mockTUserPostFavoriteRepository.deleteByUniqueKey(user.id, postId),
        mockVPostRepository.findByPostId(postId),
      ]);
    });
  });

  group('準正常系', () {
    test('AuthRepository#currentUser が null の場合は、UserNotSignedInException を投げること', () {
      when(mockAuthRepository.currentUser).thenReturn(null);
      expect(
        () => interactor.execute(
          postId: postId,
        ),
        throwsA(isA<UserNotSignedInException>()),
      );
    });
  });
}

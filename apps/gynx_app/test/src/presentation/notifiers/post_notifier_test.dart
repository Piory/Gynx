import 'package:faker/faker.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/domain/usecases/favorite_post_usecase.dart';
import 'package:gynx_app/src/presentation/notifiers/post_map_notifier.dart';
import 'package:gynx_app/src/presentation/notifiers/post_notifier.dart';
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
      test('渡された postId が FavoritePostUseCase#execute に渡されていること', () async {
        final afterVPost = vPost.copyWith(
          isFavorited: !vPost.isFavorited,
          favoriteCount: vPost.favoriteCount + 1,
        );
        when(mockFavoritePostUseCase.execute(postId: postId)).thenAnswer((_) async => afterVPost);
        final container = createContainer(
          overrides: [
            postMapNotifierProvider.overrideWith(
              () => FakePostMapNotifier({
                postId: vPost,
              }),
            ),
          ],
        );
        expect(container.read(postNotifierProvider(postId)), vPost);
        verifyNever(mockFavoritePostUseCase.execute(postId: postId));
        await container.read(postNotifierProvider(postId).notifier).toggleFavorite();
        verify(mockFavoritePostUseCase.execute(postId: postId));
        expect(
          container.read(postMapNotifierProvider),
          {
            postId: afterVPost,
          },
        );
        verifyNoMoreInteractions(mockFavoritePostUseCase);
      });
    });

    group('異常系', () {
      test('FavoritePostUseCase#execute で例外が発生した場合は、postMapNotifierProvider の値は更新されないこと', () async {
        when(mockFavoritePostUseCase.execute(postId: postId)).thenThrow(Exception('test error'));
        final container = createContainer(
          overrides: [
            postMapNotifierProvider.overrideWith(
              () => FakePostMapNotifier({
                postId: vPost,
              }),
            ),
          ],
        );
        expect(container.read(postNotifierProvider(postId)), vPost);
        verifyNever(mockFavoritePostUseCase.execute(postId: postId));
        await container.read(postNotifierProvider(postId).notifier).toggleFavorite();
        verify(mockFavoritePostUseCase.execute(postId: postId));
        expect(
          container.read(postMapNotifierProvider),
          {
            postId: vPost,
          },
        );
        verifyNoMoreInteractions(mockFavoritePostUseCase);
      });
    });
  });
}

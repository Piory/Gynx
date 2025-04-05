import 'package:app/src/domain/models/t_user_post_favorite_list.dart';
import 'package:app/src/domain/models/v_post_list.dart';
import 'package:app/src/domain/models/v_post_with_favorite_list.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';

void main() {
  final vPostList = VPostList(
    [
      generateDummyVPost(postId: 1),
      generateDummyVPost(postId: 3),
      generateDummyVPost(postId: 2),
    ],
  );
  final tUserPostFavoriteList = TUserPostFavoriteList(
    [
      generateDummyTUserPostFavorite().copyWith(
        postId: 1,
      ),
      generateDummyTUserPostFavorite().copyWith(
        postId: 3,
      ),
      generateDummyTUserPostFavorite().copyWith(
        postId: 2,
      ),
    ],
  );
  final vPostListWithFavoriteList = VPostWithFavoriteList.by(
    vPostList,
    tUserPostFavoriteList,
  );

  group('#isEmpty', () {
    group('正常系', () {
      test('VPostWithFavoriteList が空の場合、true が返ってくること', () {
        expect(VPostWithFavoriteList.empty.isEmpty, isTrue);
      });

      test('VPostWithFavoriteList が空でない場合、false が返ってくること', () {
        expect(vPostListWithFavoriteList.isEmpty, isFalse);
      });
    });
  });

  group('#vPostList', () {
    group('正常系', () {
      test('VPostWithFavoriteList から VPostList が取得できること', () {
        expect(vPostListWithFavoriteList.vPostList, vPostList);
      });
    });
  });
}

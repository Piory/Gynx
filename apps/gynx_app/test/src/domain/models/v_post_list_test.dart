import 'package:gynx_app/src/domain/models/v_post_list.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';

void main() {
  group('#isEmpty', () {
    test('VPostList が空の場合、true を返す', () {
      expect(VPostList.empty.isEmpty, isTrue);
    });

    test('VPostList が空でない場合、false を返す', () {
      expect(VPostList([generateDummyVPost(postId: 1)]).isEmpty, isFalse);
    });
  });

  group('#length', () {
    test('VPostList が空の場合、0 を返す', () {
      expect(VPostList.empty.length, 0);
    });

    test('VPostList が空でない場合、要素数を返す', () {
      expect(VPostList([generateDummyVPost(postId: 1)]).length, 1);
    });
  });

  group('#getByIndex', () {
    test('VPostList が空でない場合、指定したインデックスの要素を返す', () {
      final vPost = generateDummyVPost(postId: 1);
      final list = VPostList([vPost]);
      expect(list.getByIndex(0), vPost);
    });
  });

  group('#getByPostId', () {
    test('VPostList が空でない場合、指定した postId の要素を返す', () {
      final vPost = generateDummyVPost(postId: 1);
      final list = VPostList([vPost]);
      expect(list.getByPostId(1), vPost);
    });
  });

  group('#add', () {
    test('VPostList に値が追加されていること', () {
      final vPost = generateDummyVPost(postId: 1);
      final list = VPostList.empty.add(vPost);
      expect(list, VPostList([vPost]));
    });
  });

  group('#addAll', () {
    test('VPostList に値が追加されていること', () {
      final vPost = generateDummyVPost(postId: 1);
      final list = VPostList.empty.addAll(VPostList([vPost]));
      expect(list, VPostList([vPost]));
    });
  });

  group('#sortPostId', () {
    test('postId の昇順でソートされること', () {
      final vPost1 = generateDummyVPost(postId: 1);
      final vPost2 = generateDummyVPost(postId: 3);
      final vPost3 = generateDummyVPost(postId: 2);
      final list = VPostList([vPost1, vPost2, vPost3]).sortPostId();
      expect(list, VPostList([vPost1, vPost3, vPost2]));
    });

    test('postId の降順でソートされること', () {
      final vPost1 = generateDummyVPost(postId: 1);
      final vPost2 = generateDummyVPost(postId: 3);
      final vPost3 = generateDummyVPost(postId: 2);
      final list = VPostList([vPost1, vPost2, vPost3]).sortPostId(
        descending: true,
      );
      expect(list, VPostList([vPost2, vPost3, vPost1]));
    });
  });
}

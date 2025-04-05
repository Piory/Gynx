import 'package:app/src/domain/models/post_id_list.dart';
import 'package:test/test.dart';

void main() {
  group('#maxPostId', () {
    test('PostIdList が空の場合、null を返す', () {
      expect(PostIdList.empty.maxPostId, isNull);
    });

    test('PostIdList が空でない場合、最大の postId を返す', () {
      const list = PostIdList([1, 3, 2]);
      expect(list.maxPostId, 3);
    });
  });

  group('#minPostId', () {
    test('PostIdList が空の場合、null を返す', () {
      expect(PostIdList.empty.minPostId, isNull);
    });

    test('PostIdList が空でない場合、最小の postId を返す', () {
      const list = PostIdList([2, 1, 3]);
      expect(list.minPostId, 1);
    });
  });

  group('#isEmpty', () {
    test('PostIdList が空の場合、true を返す', () {
      expect(PostIdList.empty.isEmpty, isTrue);
    });

    test('PostIdList が空でない場合、false を返す', () {
      expect(const PostIdList([1]).isEmpty, isFalse);
    });
  });

  group('#length', () {
    test('PostIdList が空の場合、0 を返す', () {
      expect(PostIdList.empty.length, 0);
    });

    test('PostIdList が空でない場合、要素数を返す', () {
      expect(const PostIdList([1]).length, 1);
    });
  });

  group('#getByIndex', () {
    test('PostIdList が空でない場合、指定したインデックスの要素を返す', () {
      const list = PostIdList([1]);
      expect(list.getByIndex(0), 1);
    });
  });

  group('#add', () {
    test('PostIdList に値が追加されていること', () {
      final list = PostIdList.empty.add(1);
      expect(list, const PostIdList([1]));
    });
  });

  group('#addAll', () {
    test('PostIdList に値が追加されていること', () {
      final list = PostIdList.empty.addAll(const PostIdList([1]));
      expect(list, const PostIdList([1]));
    });
  });

  group('#sort', () {
    test('postId の昇順でソートされること', () {
      final list = const PostIdList([1, 3, 2]).sort();
      expect(list, const PostIdList([1, 2, 3]));
    });

    test('postId の降順でソートされること', () {
      final list = const PostIdList([1, 3, 2]).sort(
        descending: true,
      );
      expect(list, const PostIdList([3, 2, 1]));
    });
  });
}

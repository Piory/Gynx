import 'package:gynx_app/src/domain/enums/media_type.dart';
import 'package:gynx_app/src/domain/models/media.dart';
import 'package:gynx_app/src/domain/models/media_list.dart';
import 'package:test/test.dart';

void main() {
  group('#isEmpty', () {
    test('MediaList が空の場合、true を返す', () {
      expect(MediaList.empty.isEmpty, isTrue);
    });

    test('MediaList が空でない場合、false を返す', () {
      const list = MediaList(
        [
          Media(
            type: MediaType.image,
            url: 'https://example.com/1.jpg',
          ),
        ],
      );
      expect(list.isEmpty, isFalse);
    });
  });

  group('#isNotEmpty', () {
    test('MediaList が空の場合、false を返す', () {
      expect(MediaList.empty.isNotEmpty, isFalse);
    });

    test('MediaList が空でない場合、true を返す', () {
      const list = MediaList(
        [
          Media(
            type: MediaType.image,
            url: 'https://example.com/1.jpg',
          ),
        ],
      );
      expect(list.isEmpty, isFalse);
    });
  });

  group('#map', () {
    test('MediaList が空でない場合、各要素に関数を適用した MediaList を返す', () {
      const list = MediaList(
        [
          Media(
            type: MediaType.image,
            url: 'https://example.com/1.jpg',
          ),
        ],
      );
      final mappedList =
          list.map((media) => media.copyWith(url: 'https://example.com/2.jpg'));
      expect(
        mappedList,
        [
          const Media(
            type: MediaType.image,
            url: 'https://example.com/2.jpg',
          ),
        ],
      );
    });
  });
}

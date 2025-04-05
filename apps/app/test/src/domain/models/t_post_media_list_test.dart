import 'package:app/src/domain/models/t_post_media_list.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';

void main() {
  group('#isEmpty', () {
    test('TPostMediaList が空の場合、true を返す', () {
      expect(TPostMediaList.empty.isEmpty, isTrue);
    });

    test('TPostMediaList が空でない場合、false を返す', () {
      expect(TPostMediaList([generateDummyTPostMedia()]).isEmpty, isFalse);
    });
  });

  group('#isNotEmpty', () {
    test('TPostMediaList が空の場合、false を返す', () {
      expect(TPostMediaList.empty.isNotEmpty, isFalse);
    });

    test('TPostMediaList が空でない場合、true を返す', () {
      expect(TPostMediaList([generateDummyTPostMedia()]).isNotEmpty, isTrue);
    });
  });

  group('#length', () {
    test('TPostMediaList が空の場合、0 を返す', () {
      expect(TPostMediaList.empty.length, 0);
    });

    test('TPostMediaList が空でない場合、要素数を返す', () {
      expect(TPostMediaList([generateDummyTPostMedia()]).length, 1);
    });
  });

  group('#getByIndex', () {
    test('TPostMediaList が空でない場合、指定したインデックスの要素を返す', () {
      final tPostMedia = generateDummyTPostMedia();
      final list = TPostMediaList([tPostMedia]);
      expect(list.getByIndex(0), tPostMedia);
    });
  });

  group('#getByUrl', () {
    test('TPostMediaList に指定した url が存在する場合、その要素を返す', () {
      final tPostMedia = generateDummyTPostMedia();
      final list = TPostMediaList([tPostMedia]);
      expect(list.getByUrl(tPostMedia.url), tPostMedia);
    });
  });

  group('#indexOfId', () {
    test('TPostMediaList が空の場合、-1 を返す', () {
      expect(TPostMediaList.empty.indexOfId('1'), -1);
    });

    test('TPostMediaList に指定した id が存在する場合、そのインデックスを返す', () {
      final tPostMedia = generateDummyTPostMedia();
      final list = TPostMediaList([tPostMedia]);
      expect(list.indexOfId(tPostMedia.id), 0);
    });

    test('TPostMediaList に指定した id が存在しない場合、-1 を返す', () {
      final tPostMedia = generateDummyTPostMedia();
      final list = TPostMediaList([tPostMedia]);
      expect(list.indexOfId('2'), -1);
    });
  });

  group('#urls', () {
    test('TPostMediaList が空の場合、空リストを返す', () {
      expect(TPostMediaList.empty.urls, <String>[]);
    });

    test('TPostMediaList が空でない場合、各要素の url を返す', () {
      final tPostMedia = generateDummyTPostMedia();
      final list = TPostMediaList([tPostMedia]);
      expect(list.urls, [tPostMedia.url]);
    });
  });

  group('#map', () {
    test('TPostMediaList が空でない場合、各要素に関数を適用した MediaList を返す', () {
      final tPostMedia = generateDummyTPostMedia();
      final list = TPostMediaList([tPostMedia]);
      final mappedList = list.map((media) => media.copyWith(url: 'https://example.com/2.jpg'));
      expect(
        mappedList,
        [
          tPostMedia.copyWith(url: 'https://example.com/2.jpg'),
        ],
      );
    });
  });
}

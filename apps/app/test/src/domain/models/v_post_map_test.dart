import 'package:app/src/domain/models/v_post_list.dart';
import 'package:app/src/domain/models/v_post_map.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';

void main() {
  final vPostMap = VPostMap.byVPostList(
    VPostList(
      [
        generateDummyVPost(postId: 1),
        generateDummyVPost(postId: 3),
        generateDummyVPost(postId: 2),
      ],
    ),
  );

  group('#containsKey', () {
    group('正常系', () {
      test('存在するキーが指定された場合は、true が返ってくること', () {
        expect(vPostMap.containsKey(1), isTrue);
        expect(vPostMap.containsKey(2), isTrue);
        expect(vPostMap.containsKey(3), isTrue);
      });

      test('存在しないキーが指定された場合は、false が返ってくること', () {
        expect(vPostMap.containsKey(4), isFalse);
      });
    });
  });

  group('#getRequired', () {
    group('正常系', () {
      test('存在するキーが指定された場合は、VPost が返ってくること', () {
        expect(vPostMap.getRequired(1).postId, 1);
        expect(vPostMap.getRequired(2).postId, 2);
        expect(vPostMap.getRequired(3).postId, 3);
      });
    });

    group('異常系', () {
      test('存在しないキーが指定された場合は、例外が発生すること', () {
        expect(() => vPostMap.getRequired(4), throwsArgumentError);
      });
    });
  });
}

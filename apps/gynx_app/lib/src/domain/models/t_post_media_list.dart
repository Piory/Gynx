import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/t_post_media.dart';

part '../../generated/src/domain/models/t_post_media_list.freezed.dart';

@freezed
class TPostMediaList with _$TPostMediaList {
  const factory TPostMediaList(List<TPostMedia> tPostMedias) = _TPostMediaList;

  factory TPostMediaList.fromIterator(
    Iterator<Map<String, dynamic>> iterator,
  ) {
    final list = <TPostMedia>[];
    while (iterator.moveNext()) {
      list.add(TPostMedia.fromJson(iterator.current));
    }
    return TPostMediaList(list);
  }

  const TPostMediaList._();

  static const empty = TPostMediaList([]);
}

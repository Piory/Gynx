import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/t_post_media.dart';

part '../../generated/src/domain/models/t_post_media_list.freezed.dart';
part '../../generated/src/domain/models/t_post_media_list.g.dart';

@freezed
class TPostMediaList with _$TPostMediaList {
  const factory TPostMediaList(List<TPostMedia> tPostMedias) = _TPostMediaList;

  const TPostMediaList._();

  factory TPostMediaList.fromJson(List<Map<String, dynamic>> json) =>
      _$TPostMediaListFromJson({'tPostMedias': json});

  static const empty = TPostMediaList([]);
}

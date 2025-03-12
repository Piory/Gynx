import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/t_post_media.dart';

part '../../generated/src/domain/models/t_post_media_list.freezed.dart';
part '../../generated/src/domain/models/t_post_media_list.g.dart';

@freezed
@JsonSerializable()
class TPostMediaList with _$TPostMediaList {
  const TPostMediaList(this.tPostMedias);

  factory TPostMediaList.fromJson(List<Map<String, dynamic>> json) =>
      _$TPostMediaListFromJson({'tPostMedias': json});

  static const empty = TPostMediaList([]);

  @override
  final List<TPostMedia> tPostMedias;

  bool get isEmpty => tPostMedias.isEmpty;

  bool get isNotEmpty => tPostMedias.isNotEmpty;

  int get length => tPostMedias.length;

  TPostMedia getByIndex(int index) {
    return tPostMedias[index];
  }

  TPostMedia getByUrl(String url) {
    return tPostMedias.firstWhere((media) => media.url == url);
  }

  int indexOfId(String id) {
    return tPostMedias.indexWhere((media) => media.id == id);
  }

  List<String> get urls => map((e) => e.url);

  List<T> map<T>(T Function(TPostMedia tPostMedia) f) {
    return tPostMedias.map(f).toList();
  }
}

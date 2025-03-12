import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/models/media.dart';

part '../../generated/src/domain/models/media_list.freezed.dart';

@freezed
class MediaList with _$MediaList {
  const MediaList(this.medias);

  static const empty = MediaList([]);

  @override
  final List<Media> medias;

  bool get isEmpty => medias.isEmpty;

  bool get isNotEmpty => medias.isNotEmpty;

  List<T> map<T>(T Function(Media media) f) {
    return medias.map(f).toList();
  }
}

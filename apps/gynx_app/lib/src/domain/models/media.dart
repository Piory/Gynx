import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/enums/media_type.dart';

part '../../generated/src/domain/models/media.freezed.dart';

@freezed
class Media with _$Media {
  const factory Media({
    required MediaType type,
    required String url,
  }) = _Media;

  const Media._();
}

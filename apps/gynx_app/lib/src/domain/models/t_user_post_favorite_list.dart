import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/t_user_post_favorite.dart';

part '../../generated/src/domain/models/t_user_post_favorite_list.freezed.dart';

@freezed
class TUserPostFavoriteList with _$TUserPostFavoriteList {
  const factory TUserPostFavoriteList(List<TUserPostFavorite> tPostFavorites) =
      _TUserPostFavoriteList;

  factory TUserPostFavoriteList.fromIterator(
    Iterator<Map<String, dynamic>> iterator,
  ) {
    final list = <TUserPostFavorite>[];
    while (iterator.moveNext()) {
      list.add(TUserPostFavorite.fromJson(iterator.current));
    }
    return TUserPostFavoriteList(list);
  }

  const TUserPostFavoriteList._();

  static const empty = TUserPostFavoriteList([]);
}

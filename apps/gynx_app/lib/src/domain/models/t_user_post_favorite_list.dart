import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/t_user_post_favorite.dart';

part '../../generated/src/domain/models/t_user_post_favorite_list.freezed.dart';
part '../../generated/src/domain/models/t_user_post_favorite_list.g.dart';

@freezed
class TUserPostFavoriteList with _$TUserPostFavoriteList {
  const factory TUserPostFavoriteList(
    List<TUserPostFavorite> tUserPostFavorites,
  ) = _TUserPostFavoriteList;

  const TUserPostFavoriteList._();

  factory TUserPostFavoriteList.fromJson(List<Map<String, dynamic>> json) =>
      _$TUserPostFavoriteListFromJson({'tUserPostFavorites': json});

  static const empty = TUserPostFavoriteList([]);
}

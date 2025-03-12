import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/models/t_user_post_favorite_list.dart';
import 'package:gynx_app/src/domain/models/v_post_list.dart';
import 'package:gynx_app/src/domain/models/v_post_map.dart';
import 'package:gynx_app/src/domain/models/v_post_with_favorite.dart';

part '../../generated/src/domain/models/v_post_with_favorite_list.freezed.dart';

@freezed
class VPostWithFavoriteList with _$VPostWithFavoriteList {
  const factory VPostWithFavoriteList(
    List<VPostWithFavorite> vPostWithFavorites,
  ) = _VPostWithFavoriteList;

  const VPostWithFavoriteList._();

  factory VPostWithFavoriteList.by(
    VPostList vPostList,
    TUserPostFavoriteList tUserPostFavoriteList,
  ) {
    final vPostMap = VPostMap.byVPostList(vPostList);
    return VPostWithFavoriteList(
      tUserPostFavoriteList.values
          .where(
            (e) => vPostMap.containsKey(e.postId),
          )
          .map(
            (e) => VPostWithFavorite(
              vPost: vPostMap.getRequired(e.postId),
              tUserPostFavorite: e,
            ),
          )
          .toList(),
    );
  }

  static const empty = VPostWithFavoriteList([]);

  bool get isEmpty => vPostWithFavorites.isEmpty;

  VPostList get vPostList =>
      VPostList(vPostWithFavorites.map((e) => e.vPost).toList());
}

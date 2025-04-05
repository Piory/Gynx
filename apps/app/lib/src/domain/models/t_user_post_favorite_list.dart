import 'package:app/src/domain/entities/t_user_post_favorite.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/models/t_user_post_favorite_list.freezed.dart';
part '../../generated/src/domain/models/t_user_post_favorite_list.g.dart';

@freezed
@JsonSerializable()
class TUserPostFavoriteList with _$TUserPostFavoriteList {
  const TUserPostFavoriteList(
    this.tUserPostFavorites,
  );

  factory TUserPostFavoriteList.fromJson(List<Map<String, dynamic>> json) => _$TUserPostFavoriteListFromJson({'tUserPostFavorites': json});

  static const empty = TUserPostFavoriteList([]);

  @override
  final List<TUserPostFavorite> tUserPostFavorites;

  List<TUserPostFavorite> get values => tUserPostFavorites;

  TUserPostFavoriteList toList(Iterable<TUserPostFavorite> list) => TUserPostFavoriteList(list.toList());
}

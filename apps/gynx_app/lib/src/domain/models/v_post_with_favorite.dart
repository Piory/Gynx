import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/t_user_post_favorite.dart';
import 'package:gynx_app/src/domain/entities/v_post.dart';

part '../../generated/src/domain/models/v_post_with_favorite.freezed.dart';

@freezed
class VPostWithFavorite with _$VPostWithFavorite {
  const VPostWithFavorite({
    required this.vPost,
    required this.tUserPostFavorite,
  });

  @override
  final VPost vPost;
  @override
  final TUserPostFavorite tUserPostFavorite;
}

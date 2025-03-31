import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:gynx_app/src/my_app.dart';
import 'package:gynx_app/src/presentation/components/elements/texts/number_counter.dart';
import 'package:gynx_app/src/presentation/notifiers/post_notifier.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:iconly/iconly.dart';

class PostFavoriteButton extends ConsumerWidget {
  const PostFavoriteButton({
    super.key,
    required this.postId,
  });

  final int postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final provider = postNotifierProvider(postId);
    final notifier = ref.read(provider.notifier);
    final isFavorited = ref.watch(provider.select((value) => value.isFavorited));
    final color = isFavorited ? ColorPalette.favoriteColor : theme.colorScheme.onSurfaceVariant;
    return InkWell(
      onTap: () async {
        unawaited(HapticFeedback.lightImpact());
        await notifier.toggleFavorite();
      },
      child: Row(
        children: [
          Icon(
            isFavorited ? IconlyBold.star : IconlyLight.star,
            size: 20,
            color: color,
          ),
          const Gap(SpaceSize.s4),
          NumberCounter(
            value: ref.watch(provider.select((value) => value.favoriteCount)),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

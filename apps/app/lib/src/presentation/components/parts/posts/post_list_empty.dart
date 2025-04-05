import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:iconly/iconly.dart';

class PostListEmpty extends StatelessWidget {
  const PostListEmpty({
    super.key,
    this.icon,
    this.message,
  });

  final Icon? icon;
  final String? message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon == null)
          const Icon(
            IconlyLight.paper_negative,
            size: 48,
          )
        else
          icon!,
        const Gap(SpaceSize.s8),
        Text(
          message ?? context.l10n.postListEmpty,
          style: theme.textTheme.bodyMedium!.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const Gap(SpaceSize.s64),
      ],
    );
  }
}

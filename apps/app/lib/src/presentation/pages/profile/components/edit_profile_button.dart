import 'package:app/src/presentation/navigation/page_navigator.dart';
import 'package:app/src/presentation/navigation/page_type.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:iconly/iconly.dart';

class EditProfileButton extends ConsumerWidget {
  const EditProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      onPressed: () {
        GetIt.I<PageNavigator>().push(
          context,
          PageType.editProfile,
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            IconlyBold.edit,
            color: theme.colorScheme.onSurface,
            size: 16,
          ),
          const Gap(SpaceSize.s4),
          Text(
            context.l10n.edit,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const Gap(SpaceSize.s16),
        ],
      ),
    );
  }
}

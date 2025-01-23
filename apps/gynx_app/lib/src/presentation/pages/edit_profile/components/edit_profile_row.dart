import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gynx_app/src/presentation/components/elements/shimmers/shimmer.dart';
import 'package:gynx_constants/gynx_constants.dart';

class EditProfileRow extends StatelessWidget {
  const EditProfileRow({
    super.key,
    required this.name,
    required this.text,
    required this.onTap,
  }) : isLoading = false;

  const EditProfileRow.loading({
    super.key,
    required this.name,
  })  : isLoading = true,
        text = null,
        onTap = null;

  final bool isLoading;
  final String name;
  final String? text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return InkWell(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 96,
              child: Text(
                name,
                style: textTheme.bodyMedium!.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Gap(SpaceSize.s4),
            if (isLoading)
              const Shimmer.rectangular(
                width: double.infinity,
                height: 16,
              )
            else
              Text(
                text!,
                style: textTheme.bodyLarge!.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
          ],
        ),
      ),
      onTap: () {
        if (isLoading) {
          return;
        }
        onTap?.call();
      },
    );
  }
}

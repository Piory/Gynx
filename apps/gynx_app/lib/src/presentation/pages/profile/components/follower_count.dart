import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gynx_app/src/presentation/components/elements/shimmers/shimmer.dart';
import 'package:gynx_app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:gynx_l10n/gynx_l10n.dart';

class FollowerCount extends ConsumerWidget {
  const FollowerCount({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final followerCount = ref.watch(
      suiteUserNotifierProvider.select(
        (state) => state.value?.vUserDetail.followerCount,
      ),
    );
    if (followerCount == null) {
      final isLoading = ref.watch(
        suiteUserNotifierProvider.select(
          (state) => state.isLoading,
        ),
      );
      if (isLoading) {
        return const Shimmer.rectangular(
          width: 128,
          height: 16,
        );
      }
    }
    return Text(
      context.l10n.follow(followerCount ?? 0),
      style: theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }
}

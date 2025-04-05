import 'package:app/src/presentation/components/elements/shimmers/shimmer.dart';
import 'package:app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locales/locales.dart';

class FollowCount extends ConsumerWidget {
  const FollowCount({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final followCount = ref.watch(
      suiteUserNotifierProvider.select(
        (state) => state.value?.vUserDetail.followCount,
      ),
    );
    if (followCount == null) {
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
      context.l10n.follow(followCount ?? 0),
      style: theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }
}

import 'package:app/src/presentation/components/elements/shimmers/shimmer.dart';
import 'package:app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DisplayName extends ConsumerWidget {
  const DisplayName({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final displayName = ref.watch(suiteUserNotifierProvider.select((state) => state.value?.vUserDetail.displayName));
    if (displayName == null) {
      final isLoading = ref.watch(
        suiteUserNotifierProvider.select(
          (state) => state.isLoading,
        ),
      );
      if (isLoading) {
        return const Shimmer.rectangular(
          width: 128,
          height: 20,
        );
      }
    }
    return Text(
      displayName ?? '',
      style: theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}

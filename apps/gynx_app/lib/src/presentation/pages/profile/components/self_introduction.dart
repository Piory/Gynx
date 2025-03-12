import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:gynx_app/src/presentation/components/elements/shimmers/shimmer.dart';
import 'package:gynx_app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:gynx_constants/gynx_constants.dart';

class SelfIntroduction extends ConsumerWidget {
  const SelfIntroduction({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selfIntroduction = ref.watch(
      suiteUserNotifierProvider.select(
        (state) => state.value?.vUserDetail.selfIntroduction,
      ),
    );
    if (selfIntroduction == null) {
      final isLoading = ref.watch(
        suiteUserNotifierProvider.select(
          (state) => state.isLoading,
        ),
      );
      if (isLoading) {
        return const Column(
          children: [
            Shimmer.rectangular(
              width: double.infinity,
              height: 16,
            ),
            Gap(SpaceSize.s8),
            Shimmer.rectangular(
              width: double.infinity,
              height: 16,
            ),
            Gap(SpaceSize.s8),
            Shimmer.rectangular(
              width: double.infinity,
              height: 16,
            ),
          ],
        );
      }
    }
    if (selfIntroduction == null || selfIntroduction.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        const Gap(SpaceSize.s16),
        Text(
          selfIntroduction,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

import 'package:app/src/presentation/components/elements/avatars/user_avatar.dart';
import 'package:app/src/presentation/components/elements/shimmers/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gynx_constants/gynx_constants.dart';

class PostLoading extends StatelessWidget {
  const PostLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SpaceSize.s8,
        vertical: SpaceSize.s16,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserAvatar.loading(
                radius: 20,
              ),
              const Gap(SpaceSize.s8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Shimmer.rectangular(
                      width: 128,
                      height: 16,
                    ),
                    const Gap(SpaceSize.s16),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.rectangular(
                              width: constraints.maxWidth,
                              height: 16,
                            ),
                            const Gap(SpaceSize.s8),
                            Shimmer.rectangular(
                              width: constraints.maxWidth,
                              height: 16,
                            ),
                            const Gap(SpaceSize.s8),
                            Shimmer.rectangular(
                              width: constraints.maxWidth,
                              height: 16,
                            ),
                          ],
                        );
                      },
                    ),
                    const Gap(SpaceSize.s16),
                    const Row(
                      children: [
                        Shimmer.rectangular(
                          width: 48,
                          height: 16,
                        ),
                        Gap(SpaceSize.s24),
                        Shimmer.rectangular(
                          width: 48,
                          height: 16,
                        ),
                        Gap(SpaceSize.s24),
                        Shimmer.rectangular(
                          width: 48,
                          height: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

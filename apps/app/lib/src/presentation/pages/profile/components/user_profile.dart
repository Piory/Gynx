import 'package:app/src/presentation/components/elements/avatars/gynx_id.dart';
import 'package:app/src/presentation/components/elements/shimmers/shimmer.dart';
import 'package:app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:app/src/presentation/pages/profile/components/edit_profile_button.dart';
import 'package:app/src/presentation/pages/profile/components/follow_count.dart';
import 'package:app/src/presentation/pages/profile/components/follower_count.dart';
import 'package:app/src/presentation/pages/profile/components/self_introduction.dart';
import 'package:app/src/presentation/pages/profile/components/user_avatar_with_hero.dart';
import 'package:app/src/presentation/pages/profile/components/username.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:icons_plus/icons_plus.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SpaceSize.s16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                const UserAvatarWithHero(),
                const Gap(SpaceSize.s16),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Username(),
                      _createGynxIdWidget(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SelfIntroduction(),
          const Gap(SpaceSize.s16),
          const Row(
            children: [
              FollowCount(),
              Gap(SpaceSize.s16),
              FollowerCount(),
            ],
          ),
          const Gap(SpaceSize.s16),
          SizedBox(
            width: double.infinity,
            height: 32,
            child: Row(
              children: [
                const Expanded(
                  child: EditProfileButton(),
                ),
                const Gap(SpaceSize.s16),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          EvaIcons.share,
                          color: theme.colorScheme.onSurface,
                          size: 16,
                        ),
                        const Gap(SpaceSize.s4),
                        Text(
                          context.l10n.share,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const Gap(SpaceSize.s16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createGynxIdWidget(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final gynxId = ref.watch(
          suiteUserNotifierProvider.select(
            (state) => state.value?.vUserDetail.gynxId,
          ),
        );
        if (gynxId == null) {
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
        return GynxId(
          id: gynxId,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gynx_app/src/application/usecase/results/suite_user_result.dart';
import 'package:gynx_components/gynx_components.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:iconly/iconly.dart';
import 'package:icons_plus/icons_plus.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
    required this.isLoading,
    required this.suiteUser,
  });

  final bool isLoading;
  final SuiteUserResult? suiteUser;

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
          Row(
            children: [
              UserAvatar(
                isLoading: isLoading,
                avatarUrl: suiteUser?.tUserProfile.avatarUrl,
                radius: 25,
              ),
              const Gap(SpaceSize.s16),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _createUsernameWidget(context),
                    _createGynxIdWidget(context),
                  ],
                ),
              ),
            ],
          ),
          const Gap(SpaceSize.s16),
          _createSelfIntroductionWidget(context),
          const Gap(SpaceSize.s16),
          Row(
            children: [
              _createFollowCountWidget(context),
              const Gap(SpaceSize.s16),
              _createFollowerCountWidget(context),
            ],
          ),
          const Gap(SpaceSize.s16),
          SizedBox(
            width: double.infinity,
            height: 32,
            child: Row(
              children: [
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
                  ),
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

  Widget _createUsernameWidget(BuildContext context) {
    if (isLoading) {
      return const Shimmer.rectangular(
        width: 128,
        height: 20,
      );
    }
    final theme = Theme.of(context);
    return Text(
      suiteUser?.tUserProfile.username ?? '',
      style: theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget _createGynxIdWidget(BuildContext context) {
    if (isLoading) {
      return const Shimmer.rectangular(
        width: 128,
        height: 16,
      );
    }
    final gynxId = suiteUser?.tUser.gynxId;
    final theme = Theme.of(context);
    return Text(
      gynxId == null ? '' : '@$gynxId',
      style: theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }

  Widget _createSelfIntroductionWidget(BuildContext context) {
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
    // final selfIntroduction = suiteUser?.tUserProfile.selfIntroduction;
    final theme = Theme.of(context);
    return Text(
      '自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介自己紹介',
      style: theme.textTheme.bodyMedium,
    );
  }

  Widget _createFollowCountWidget(BuildContext context) {
    if (isLoading) {
      return const Shimmer.rectangular(
        width: 128,
        height: 16,
      );
    }
    // final followCount = null;
    final theme = Theme.of(context);
    return Text(
      context.l10n.follow(598490),
      style: theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }

  Widget _createFollowerCountWidget(BuildContext context) {
    if (isLoading) {
      return const Shimmer.rectangular(
        width: 128,
        height: 16,
      );
    }
    // final followerCount = null;
    final theme = Theme.of(context);
    return Text(
      context.l10n.follower(12345),
      style: theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }
}

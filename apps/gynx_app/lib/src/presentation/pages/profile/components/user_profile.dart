import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/models/suite_user.dart';
import 'package:gynx_app/src/presentation/components/elements/avatars/gynx_id.dart';
import 'package:gynx_app/src/presentation/components/elements/avatars/user_avatar.dart';
import 'package:gynx_app/src/presentation/components/elements/shimmers/shimmer.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/navigation/page_type.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:iconly/iconly.dart';
import 'package:icons_plus/icons_plus.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
    required this.suiteUser,
  }) : isLoading = false;

  const UserProfile.loading({
    super.key,
  })  : isLoading = true,
        suiteUser = null;

  final bool isLoading;
  final SuiteUser? suiteUser;

  @override
  Widget build(BuildContext context) {
    final pageNavigator = GetIt.I<PageNavigator>();
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
                InkWell(
                  child: _createUserAvatar(suiteUser),
                  onTap: () {
                    if (suiteUser?.vUserDetail.avatarUrl == null) {
                      return;
                    }
                    pageNavigator.push(
                      context,
                      PageType.profileAvatar,
                    );
                  },
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
          ),
          if (isLoading ||
              !StringUtils.isNullOrEmpty(
                suiteUser?.vUserDetail.selfIntroduction,
              ))
            const Gap(SpaceSize.s16),
          if (isLoading ||
              !StringUtils.isNullOrEmpty(
                suiteUser?.vUserDetail.selfIntroduction,
              ))
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
                    onPressed: () {
                      if (suiteUser == null) {
                        return;
                      }
                      pageNavigator.push(
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

  Widget _createUserAvatar(SuiteUser? suiteUser) {
    final userAvatar = UserAvatar(
      isLoading: isLoading,
      avatarUrl: suiteUser?.vUserDetail.avatarUrl,
      radius: 25,
    );
    if (suiteUser == null) {
      return userAvatar;
    }
    return Hero(
      tag: suiteUser.vUserDetail.userId,
      child: userAvatar,
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
      suiteUser?.vUserDetail.username ?? '',
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
    return GynxId(
      id: suiteUser?.vUserDetail.gynxId,
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
    final selfIntroduction = suiteUser?.vUserDetail.selfIntroduction;
    final theme = Theme.of(context);
    return Text(
      selfIntroduction!,
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
      context.l10n.follow(suiteUser?.vUserDetail.followCount ?? 0),
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
      context.l10n.follower(suiteUser?.vUserDetail.followerCount ?? 0),
      style: theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/presentation/components/elements/avatars/user_avatar.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/navigation/page_type.dart';
import 'package:gynx_app/src/presentation/notifiers/suite_user_notifier.dart';

class UserAvatarWithHero extends ConsumerWidget {
  const UserAvatarWithHero({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarUrl = ref.watch(
      suiteUserNotifierProvider.select(
        (state) => state.value?.vUserDetail.avatarUrl,
      ),
    );
    final userId = ref.watch(
      suiteUserNotifierProvider.select(
        (state) => state.value?.vUserDetail.userId,
      ),
    );
    return InkWell(
      onTap: () {
        if (avatarUrl == null) {
          return;
        }
        GetIt.I<PageNavigator>().push(
          context,
          PageType.profileAvatar,
        );
      },
      child: _buildUserAvatar(avatarUrl, userId),
    );
  }

  static Widget _buildUserAvatar(String? avatarUrl, String? userId) {
    final userAvatar = UserAvatar(
      isLoading: avatarUrl == null,
      avatarUrl: avatarUrl,
      radius: 25,
    );
    if (userId == null) {
      return userAvatar;
    }
    return Hero(
      tag: userId,
      child: userAvatar,
    );
  }
}

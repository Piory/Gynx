import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/infrastructure/router/go_router.dart';
import 'package:gynx_app/src/presentation/components/elements/avatars/user_avatar.dart';
import 'package:gynx_app/src/presentation/components/elements/medias/media_list.dart';
import 'package:gynx_app/src/presentation/notifiers/user_notifier.dart';
import 'package:gynx_components/gynx_components.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:timeago_flutter/timeago_flutter.dart';

class Post extends ConsumerWidget {
  const Post({
    super.key,
    required this.vPost,
  });

  final VPost vPost;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final username = ref.watch(
      userNotifierProvider(vPost.userId).select(
        (vUser) => vUser.value?.username ?? '',
      ),
    );
    final gynxId = ref.watch(
      userNotifierProvider(vPost.userId).select(
        (vUser) => vUser.value?.gynxId ?? '',
      ),
    );
    final avatarUrl = ref.watch(
      userNotifierProvider(vPost.userId).select(
        (vUser) => vUser.value?.avatarUrl,
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(SpaceSize.s8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAvatar(
                isLoading: avatarUrl == null,
                avatarUrl: avatarUrl ?? '',
                radius: 20,
              ),
              const Gap(SpaceSize.s8),
              Flexible(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              username,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(SpaceSize.s4),
                            Text(
                              '@$gynxId',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Timeago(
                              builder: (_, value) => Text(
                                value,
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                              date: vPost.createdAt,
                              locale: context.l10n.localeName,
                            ),
                            const Gap(SpaceSize.s4),
                            InkWell(
                              child: Icon(
                                EvaIcons.more_horizontal,
                                size: 20,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(SpaceSize.s4),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        vPost.text ?? '',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    if (vPost.tPostMediaList.isNotEmpty)
                      Column(
                        children: [
                          const Gap(SpaceSize.s8),
                          MediaList(
                            urls: vPost.tPostMediaList.urls,
                            onTap: (url) {
                              PostMediaListViewPageRoute(
                                postId: vPost.postId,
                                index: vPost.tPostMediaList.urls.indexOf(url),
                              ).push<void>(
                                context,
                              );
                            },
                          ),
                          const Gap(SpaceSize.s4),
                        ],
                      ),
                    const Gap(SpaceSize.s8),
                    Row(
                      children: [
                        InkWell(
                          child: Icon(
                            EvaIcons.message_circle_outline,
                            size: 20,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          onTap: () {},
                        ),
                        const Gap(SpaceSize.s4),
                        Text(
                          '0',
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const Gap(SpaceSize.s24),
                        InkWell(
                          child: Icon(
                            EvaIcons.repeat,
                            size: 20,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          onTap: () {},
                        ),
                        const Gap(SpaceSize.s4),
                        Text(
                          '${vPost.repostCount}',
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const Gap(SpaceSize.s24),
                        InkWell(
                          child: Icon(
                            EvaIcons.star_outline,
                            size: 20,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          onTap: () {},
                        ),
                        const Gap(SpaceSize.s4),
                        Text(
                          '${vPost.favoriteCount}',
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const Gap(SpaceSize.s8),
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

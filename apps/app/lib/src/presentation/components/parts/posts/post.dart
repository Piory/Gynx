import 'package:app/src/domain/entities/v_post.dart';
import 'package:app/src/presentation/components/elements/avatars/gynx_id.dart';
import 'package:app/src/presentation/components/elements/avatars/user_avatar.dart';
import 'package:app/src/presentation/components/elements/medias/media_list.dart';
import 'package:app/src/presentation/components/parts/posts/post_favorite_button.dart';
import 'package:app/src/presentation/navigation/page_navigator.dart';
import 'package:app/src/presentation/navigation/page_type.dart';
import 'package:app/src/presentation/notifiers/post_notifier.dart';
import 'package:app/src/presentation/notifiers/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:iconly/iconly.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:timeago_flutter/timeago_flutter.dart';

class Post extends ConsumerWidget {
  const Post({
    super.key,
    required this.from,
    required this.postId,
  });

  final String from;
  final int postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vPost = ref.watch(postNotifierProvider(postId));
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
                            GynxId(
                              id: gynxId,
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
                        vPost.displayText ?? '',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    if (vPost.displayTPostMediaList.isNotEmpty)
                      Column(
                        children: [
                          const Gap(SpaceSize.s8),
                          MediaList(
                            urls: vPost.displayTPostMediaList.urls,
                            heroTagGenerator: (url) => _heroTagGenerator(
                              vPost,
                              url,
                            ),
                            onTap: (url) {
                              GetIt.I<PageNavigator>().push(
                                context,
                                PageType.postMedia,
                                pathParams: {
                                  'postId': vPost.postId,
                                  'postMediaId': vPost.displayTPostMediaList.getByUrl(url).id,
                                },
                                queryParams: {
                                  'f': from,
                                },
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
                            IconlyLight.chat,
                            size: 20,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          onTap: () {},
                        ),
                        const Gap(SpaceSize.s4),
                        Text(
                          Formatter.fromNumber(
                            context.l10n,
                            0,
                          ),
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
                          Formatter.fromNumber(
                            context.l10n,
                            vPost.repostCount,
                          ),
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const Gap(SpaceSize.s24),
                        PostFavoriteButton(
                          postId: postId,
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

  String _heroTagGenerator(VPost vPost, String url) {
    final tPostMediaId = vPost.displayTPostMediaList.getByUrl(url).id;
    return '$from-$tPostMediaId';
  }
}

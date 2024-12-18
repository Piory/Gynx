import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gynx_components/gynx_components.dart';
import 'package:icons_plus/icons_plus.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(SpaceSize.s8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserAvatar(
                isLoading: false,
                avatarUrl: null,
                radius: 20,
              ),
              Gap(SpaceSize.s8),
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
                              'Piory',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Gap(SpaceSize.s4),
                            Text(
                              '@Piory',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '1時間前',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            Gap(SpaceSize.s4),
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
                    Gap(2),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, fermentum nunc nec, ultricies nunc. Nulla facilisi. Nullam nec nunc nec nunc.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    // Image.network(
                    //   'https://picsum.photos/200/300',
                    // ),
                    Gap(SpaceSize.s8),
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
                        Gap(SpaceSize.s32),
                        InkWell(
                          child: Icon(
                            EvaIcons.repeat,
                            size: 20,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          onTap: () {},
                        ),
                        Gap(SpaceSize.s32),
                        InkWell(
                          child: Icon(
                            EvaIcons.star_outline,
                            size: 20,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    Gap(SpaceSize.s8),
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

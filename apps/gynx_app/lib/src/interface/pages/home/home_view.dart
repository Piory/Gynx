import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gynx_app/src/constants/space_size.dart';
import 'package:gynx_app/src/generated/assets/assets.gen.dart';
import 'package:gynx_app/src/infrastructure/router/go_router.dart';
import 'package:gynx_components/gynx_components.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 76,
        ),
        child: FloatingActionButton(
          backgroundColor: theme.colorScheme.primary,
          onPressed: () => const RootPageRoute().push<void>(context),
          child: const Icon(
            EvaIcons.edit,
            color: Colors.white,
          ),
        ),
      ),
      body: GradientBox.containerColor(
        child: VisibleDetectScrollControllerNotifier(
          visibleDetectorKey: const Key('home'),
          child: CustomScrollView(
            primary: true,
            slivers: [
              GlassSliverAppBar(
                title: Assets.svgs.logos.gynxLogo.svg(
                  width: 40,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                  top: SpaceSize.s4,
                ),
              ),
              SliverList.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(SpaceSize.s8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: theme.colorScheme.primary,
                              minRadius: 20,
                              maxRadius: 20,
                            ),
                            Gap(SpaceSize.s8),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Piory',
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '@Piory',
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                          color: theme
                                              .colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '1時間前',
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                          color: theme
                                              .colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                      // Gap(SpaceSize.s8),
                                      // SizedBox(
                                      //   height: 32,
                                      //   child: ElevatedButton(
                                      //     onPressed: () {},
                                      //     child: const Text('フォロー'),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Gap(SpaceSize.s8),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, fermentum nunc nec, ultricies nunc. Nulla facilisi. Nullam nec nunc nec nunc.',
                            // '日本語のテキストの投稿テストです。日本語のテキストの投稿テストです。日本語のテキストの投稿テストです。日本語のテキストの投稿テストです。日本語のテキストの投稿テストです。日本語のテキストの投稿テストです。',
                            // 'あああああああ',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Image.network(
                        //       'https://picsum.photos/200/300',
                        //     ),
                        //   ],
                        // ),
                        Gap(SpaceSize.s8),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SpaceSize.s16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon:
                                    const Icon(EvaIcons.message_circle_outline),
                                onPressed: () {},
                              ),
                              Gap(SpaceSize.s16),
                              IconButton(
                                icon: const Icon(EvaIcons.repeat),
                                onPressed: () {},
                              ),
                              Gap(SpaceSize.s16),
                              IconButton(
                                icon: const Icon(EvaIcons.star_outline),
                                onPressed: () {},
                              ),
                              Gap(SpaceSize.s16),
                              IconButton(
                                icon: const Icon(EvaIcons.more_horizontal),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

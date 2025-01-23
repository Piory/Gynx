import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gynx_app/src/domain/enums/timeline_type.dart';
import 'package:gynx_app/src/generated/assets/assets.gen.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post.dart';
import 'package:gynx_app/src/presentation/notifiers/timeline_notifier.dart';
import 'package:gynx_app/src/presentation/pages/home/components/create_post_form.dart';
import 'package:gynx_components/gynx_components.dart' hide Post;
import 'package:iconly/iconly.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 76,
        ),
        child: FloatingActionButton(
          onPressed: () {
            CupertinoScaffold.showCupertinoModalBottomSheet<void>(
              context: context,
              useRootNavigator: true,
              builder: (context) => const CreatePostForm(),
            );
          },
          child: const Icon(
            IconlyBold.edit,
          ),
        ),
      ),
      body: VisibleDetectScrollControllerNotifier(
        visibleDetectorKey: const Key('home'),
        child: CustomScrollView(
          primary: true,
          slivers: [
            GlassSliverAppBar(
              title: Assets.svgs.logos.gynxLogo.svg(
                width: 40,
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(
                top: SpaceSize.s4,
              ),
            ),
            ref.watch(timelineNotifierProvider(TimelineType.follow)).when(
              data: (vPostList) {
                if (vPostList.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text('No posts'),
                    ),
                  );
                }
                return SliverList.separated(
                  itemCount: vPostList.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 0,
                      color:
                          theme.colorScheme.onSurfaceVariant.withOpacity(0.15),
                    );
                  },
                  itemBuilder: (context, index) {
                    return Post(
                      vPost: vPostList.getByIndex(index),
                    );
                  },
                );
              },
              loading: () {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
              error: (error, _) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text(
                      error.toString(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

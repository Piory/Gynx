import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gynx_app/src/domain/enums/timeline_type.dart';
import 'package:gynx_app/src/generated/assets/assets.gen.dart';
import 'package:gynx_app/src/presentation/components/elements/notifier/visible_detect_scroll_controller_notifier.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/sliver_post_list.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/sliver_post_list_loading.dart';
import 'package:gynx_app/src/presentation/layouts/glass_sliver_app_bar.dart';
import 'package:gynx_app/src/presentation/notifiers/timeline_notifier.dart';
import 'package:gynx_app/src/presentation/pages/home/components/create_post_form.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAppBarPinned = ref.watch(
      timelineNotifierProvider(TimelineType.follow).select((state) {
        if (state.isLoading) {
          return true;
        }
        if (state.value?.isEmpty ?? true) {
          return true;
        }
        return false;
      }),
    );
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
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            GlassSliverAppBar(
              pinned: isAppBarPinned,
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
                  data: (vPostList) => SliverPostList(
                    from: 'home',
                    vPostList: vPostList,
                  ),
                  loading: () => const SliverPostListLoading(),
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/enums/timeline_type.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/notifiers/timeline_notifier.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PostMediaListViewPage extends ConsumerWidget {
  const PostMediaListViewPage({
    super.key,
    required this.postId,
    required this.postMediaId,
    required this.from,
  });

  final int postId;
  final String postMediaId;
  final String from;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final tPostMediaList = ref.read(
      timelineNotifierProvider(TimelineType.follow).select(
        (value) => value.value?.getByPostId(postId).tPostMediaList,
      ),
    );
    if (tPostMediaList == null) {
      return const SizedBox();
    }
    return Stack(
      children: [
        DismissiblePage(
          backgroundColor: colorScheme.surface,
          onDismissed: () => GetIt.I<PageNavigator>().pop(context),
          direction: DismissiblePageDismissDirection.multi,
          child: PhotoViewGallery.builder(
            pageController: PageController(
              initialPage: tPostMediaList.indexOfId(postMediaId),
            ),
            itemCount: tPostMediaList.length,
            backgroundDecoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                heroAttributes: PhotoViewHeroAttributes(
                  tag: '$from-$postMediaId',
                  transitionOnUserGestures: true,
                ),
                imageProvider: CachedNetworkImageProvider(
                  tPostMediaList.getByIndex(index).url,
                ),
                initialScale: PhotoViewComputedScale.contained,
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 1.5,
              );
            },
            scrollPhysics: const BouncingScrollPhysics(),
          ),
        ),
        const Positioned(
          left: SpaceSize.s8,
          child: SafeArea(
            child: CloseButton(),
          ),
        ),
      ],
    );
  }
}

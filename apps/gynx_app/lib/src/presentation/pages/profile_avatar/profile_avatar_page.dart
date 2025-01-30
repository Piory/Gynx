import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart' hide Dialog;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/presentation/components/elements/avatars/user_avatar.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:photo_view/photo_view.dart';

class ProfileAvatarPage extends ConsumerWidget {
  const ProfileAvatarPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final suiteUser = ref.read(
      suiteUserNotifierProvider.select((value) => value.value),
    );
    final userId = suiteUser?.vUserDetail.userId ?? '';
    final avatarUrl = suiteUser!.vUserDetail.avatarUrl!;
    return Stack(
      children: [
        DismissiblePage(
          backgroundColor: colorScheme.surface,
          onDismissed: () => GetIt.I<PageNavigator>().pop(context),
          direction: DismissiblePageDismissDirection.multi,
          child: PhotoView.customChild(
            backgroundDecoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            scaleStateCycle: _scaleStateCycle,
            maxScale: 1.5,
            minScale: PhotoViewComputedScale.contained,
            initialScale: PhotoViewComputedScale.contained,
            heroAttributes: PhotoViewHeroAttributes(
              tag: userId,
              transitionOnUserGestures: true,
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: UserAvatar(
                  avatarUrl: avatarUrl,
                  radius: (size.width / 2) - SpaceSize.s16,
                ),
              ),
            ),
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

  PhotoViewScaleState _scaleStateCycle(PhotoViewScaleState actual) {
    switch (actual) {
      case PhotoViewScaleState.initial:
        return PhotoViewScaleState.covering;
      case PhotoViewScaleState.covering:
      case PhotoViewScaleState.originalSize:
      case PhotoViewScaleState.zoomedIn:
      case PhotoViewScaleState.zoomedOut:
        return PhotoViewScaleState.initial;
    }
  }
}

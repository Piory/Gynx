import 'package:flutter/material.dart';
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
          backgroundColor: Colors.transparent,
          onPressed: () => const RootPageRoute().push<void>(context),
          child: const GradientBox(
            shape: BoxShape.circle,
            child: SizedBox(
              width: 56,
              height: 56,
              child: Icon(
                EvaIcons.edit,
                color: Colors.white,
              ),
            ),
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
            SliverPadding(
              padding: EdgeInsets.only(
                top: SpaceSize.s4,
              ),
            ),
            SliverList.separated(
              itemCount: 100,
              separatorBuilder: (context, index) {
                return Divider(
                  height: 0,
                  color: theme.colorScheme.onSurfaceVariant.withOpacity(0.15),
                );
              },
              itemBuilder: (context, index) {
                return Post();
              },
            ),
          ],
        ),
      ),
    );
  }
}

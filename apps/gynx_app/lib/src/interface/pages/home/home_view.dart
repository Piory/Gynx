import 'package:flutter/material.dart';
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
              const GlassSliverAppBar(
                title: Text('Home'),
              ),
              SliverList.separated(
                itemCount: 100,
                itemBuilder: (context, index) => ListTile(
                  title: Text('Item $index'),
                  onTap: () => print('Item $index'),
                ),
                separatorBuilder: (context, index) => const Divider(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

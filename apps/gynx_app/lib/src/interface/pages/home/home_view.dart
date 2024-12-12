import 'package:flutter/material.dart';
import 'package:gynx_app/src/infrastructure/router/go_router.dart';
import 'package:gynx_components/gynx_components.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black.withAlpha(200),
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () => (),
            icon: Icon(
              Icons.settings,
              color: theme.colorScheme.secondary,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.colorScheme.primary,
        onPressed: () => const RootPageRoute().push<void>(context),
        child: Icon(
          Icons.edit_rounded,
          color: Colors.white,
        ),
      ),
      body: GradientBox.containerColor(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Home Page'),
              OutlinedButton(
                onPressed: () =>
                    const HomeSample1PageRoute().push<void>(context),
                child: const Text('Sample1'),
              ),
              ElevatedButton(
                onPressed: () => const RootPageRoute().push<void>(context),
                child: const Text('SignIn'),
              ),
              ElevatedButton(
                onPressed: () async =>
                    CupertinoScaffold.showCupertinoModalBottomSheet(
                  context: context,
                  useRootNavigator: true,
                  builder: (context) => const Scaffold(
                    body: Center(
                      child: Text('Modal'),
                    ),
                  ),
                ),
                child: const Text('Open Modal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

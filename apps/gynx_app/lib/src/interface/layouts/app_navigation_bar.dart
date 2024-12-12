import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:gynx_app/src/interface/router/page_router.dart';
import 'package:gynx_app/src/interface/router/page_type.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    GetIt.I<SupabaseClient>().auth.onAuthStateChange.listen((data) {
      if (data.session == null && context.mounted) {
        GetIt.I<PageRouter>().pushReplacement(context, PageType.root);
      }
    });
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        backgroundColor: Colors.transparent,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // NavigationDestination(
          //   icon: Icon(Icons.search),
          //   label: 'Search',
          // ),
          // NavigationDestination(
          //   icon: Icon(Icons.notifications),
          //   label: 'Notifications',
          // ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}

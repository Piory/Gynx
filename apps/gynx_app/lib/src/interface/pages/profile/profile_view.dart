import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/interface/pages/profile/profile_controller.dart';
import 'package:gynx_components/gynx_components.dart';
import 'package:gynx_l10n/gynx_l10n.dart';

class ProfileView extends CleanView {
  const ProfileView({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends CleanViewState<ProfileView, ProfileController> {
  _ProfileViewState()
      : super(
          GetIt.I<ProfileController>(),
        );

  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      extendBody: true,
      body: GradientBox.containerColor(
        child: ControlledWidgetBuilder<ProfileController>(
          builder: (context, controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: VisibleDetectScrollControllerNotifier(
                visibleDetectorKey: const Key('profile'),
                child: CustomScrollView(
                  primary: true,
                  slivers: [
                    const GlassSliverAppBar(
                      title: Text('Profile'),
                    ),
                    SliverList.separated(
                      itemCount: 100,
                      itemBuilder: (context, index) => SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          key: const Key('sign_out_button'),
                          onPressed: controller.signOut,
                          child: Text(context.l10n.signOut),
                        ),
                      ),
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart' hide Dialog;
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/presentation/pages/setting/setting_controller.dart';
import 'package:gynx_l10n/gynx_l10n.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textScaler = MediaQuery.textScalerOf(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          context.l10n.setting,
          textScaler: textScaler.clamp(
            maxScaleFactor: 1,
          ),
        ),
        leading: CloseButton(
          color: colorScheme.primary,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => GetIt.I<SettingController>().signOut(
                  context.l10n,
                ),
                child: Text(context.l10n.signOut),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ScreenName extends StatelessWidget {
  const ScreenName({
    super.key,
    required this.screenName,
  });

  final String? screenName;

  @override
  Widget build(BuildContext context) {
    if (screenName == null || screenName!.isEmpty) {
      return const SizedBox.shrink();
    }
    final theme = Theme.of(context);
    return Text(
      '@$screenName',
      style: theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }
}

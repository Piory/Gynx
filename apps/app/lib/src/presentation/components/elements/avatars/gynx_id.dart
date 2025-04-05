import 'package:flutter/material.dart';

class GynxId extends StatelessWidget {
  const GynxId({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  Widget build(BuildContext context) {
    if (id == null || id!.isEmpty) {
      return const SizedBox.shrink();
    }
    final theme = Theme.of(context);
    return Text(
      '@$id',
      style: theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }
}

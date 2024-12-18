import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gynx_components/gynx_components.dart';
import 'package:iconly/iconly.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.isLoading,
    required this.avatarUrl,
    required this.radius,
  });

  const UserAvatar.loading({
    super.key,
    required this.radius,
  })  : avatarUrl = null,
        isLoading = true;

  final bool isLoading;
  final String? avatarUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (isLoading) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: Colors.transparent,
        child: Shimmer.circular(
          radius: radius,
        ),
      );
    }
    return CircleAvatar(
      radius: radius,
      backgroundColor: theme.colorScheme.onSurface,
      foregroundImage:
          avatarUrl == null ? null : CachedNetworkImageProvider(avatarUrl!),
      child: Icon(
        IconlyBold.profile,
        size: radius * 1.25,
        color: theme.colorScheme.surface.withOpacity(0.5),
      ),
    );
  }
}

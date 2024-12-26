import 'dart:async';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:gynx_app/src/presentation/pages/edit_profile/components/edit_avatar_menu.dart';
import 'package:gynx_components/gynx_components.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class EditAvatar extends StatelessWidget {
  const EditAvatar({
    super.key,
    required this.avatarUrl,
    required this.onChanged,
  }) : isLoading = false;

  const EditAvatar.loading({
    super.key,
  })  : isLoading = true,
        avatarUrl = null,
        onChanged = null;

  final bool isLoading;
  final String? avatarUrl;
  final ValueChanged<XFile?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: Stack(
            children: [
              UserAvatar(
                isLoading: isLoading,
                avatarUrl: avatarUrl,
                radius: 40,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Blur(
                  blur: 10,
                  blurColor: colorScheme.primary,
                  borderRadius: BorderRadius.circular(16),
                  overlay: const Padding(
                    padding: EdgeInsets.all(SpaceSize.s4),
                    child: Icon(
                      IconlyBold.image,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                  child: const SizedBox(
                    width: 28,
                    height: 28,
                  ),
                ),
              ),
            ],
          ),
          onTap: () async {
            if (isLoading) {
              return;
            }
            unawaited(
              showBarModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return Material(
                    child: EditAvatarMenu(
                      onChanged: onChanged,
                      visibleDelete: avatarUrl != null,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

import 'package:app/src/presentation/dialogs/loading_dialog.dart';
import 'package:app/src/presentation/navigation/page_navigator.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';

class EditAvatarMenu extends StatelessWidget {
  const EditAvatarMenu({
    super.key,
    required this.visibleDelete,
    required this.onChanged,
  });

  final bool visibleDelete;
  final ValueChanged<XFile?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final imagePicker = GetIt.I<ImagePicker>();
    final loadingDialog = GetIt.I<LoadingDialog>();
    final pageNavigator = GetIt.I<PageNavigator>();
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(SpaceSize.s16),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: SpaceSize.s16,
            ),
            leading: Icon(
              IconlyBold.camera,
              color: colorScheme.onSurface,
            ),
            title: Text(context.l10n.takePhoto),
            onTap: () async {
              loadingDialog.show();
              final image = await imagePicker.pickImage(
                source: ImageSource.camera,
              );
              if (image != null) {
                onChanged?.call(image);
                if (context.mounted) {
                  pageNavigator.pop(context);
                }
              }
              loadingDialog.hide();
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: SpaceSize.s16,
            ),
            leading: Icon(
              IconlyBold.image,
              color: colorScheme.onSurface,
            ),
            title: Text(context.l10n.selectFromLibrary),
            onTap: () async {
              loadingDialog.show();
              final image = await imagePicker.pickImage(
                source: ImageSource.gallery,
              );
              if (image != null) {
                onChanged?.call(image);
                if (context.mounted) {
                  pageNavigator.pop(context);
                }
              }
              loadingDialog.hide();
            },
          ),
          if (visibleDelete)
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: SpaceSize.s16,
              ),
              leading: Icon(
                IconlyBold.delete,
                color: colorScheme.error,
              ),
              title: Text(
                context.l10n.deleteImage,
                style: textTheme.bodyLarge!.copyWith(
                  color: colorScheme.error,
                ),
              ),
              onTap: () {
                onChanged?.call(null);
                if (context.mounted) {
                  pageNavigator.pop(context);
                }
              },
            ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: SpaceSize.s16,
                vertical: SpaceSize.s8,
              ),
              child: Center(
                child: Text(
                  context.l10n.cancel,
                  style: textTheme.bodyLarge!.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            onTap: () => pageNavigator.pop(context),
          ),
        ],
      ),
    );
  }
}

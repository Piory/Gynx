import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:gynx_app/src/presentation/pages/edit_profile/components/edit_avatar.dart';
import 'package:gynx_app/src/presentation/pages/edit_profile/components/edit_gynx_id.dart';
import 'package:gynx_app/src/presentation/pages/edit_profile/components/edit_profile_row.dart';
import 'package:gynx_app/src/presentation/pages/edit_profile/components/edit_self_introduction.dart';
import 'package:gynx_app/src/presentation/pages/edit_profile/components/edit_username.dart';
import 'package:gynx_app/src/presentation/pages/edit_profile/edit_profile_controller.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({
    super.key,
  });

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  XFile? _afterAvatarPath;
  var _isDeleteAvatar = false;
  String? _afterUsername;
  String? _afterGynxId;
  String? _afterSelfIntroduction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final textScaler = MediaQuery.textScalerOf(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          context.l10n.editProfile,
          textScaler: textScaler.clamp(
            maxScaleFactor: 1,
          ),
        ),
        leading: CloseButton(
          color: colorScheme.primary,
        ),
        actions: [
          Flexible(
            child: TextButton(
              child: Text(
                context.l10n.done,
                style: textTheme.bodyLarge!.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
                textScaler: textScaler.clamp(
                  maxScaleFactor: 1,
                ),
              ),
              onPressed: () =>
                  GetIt.I<EditProfileController>().updateUserProfile(
                context: context,
                l10n: context.l10n,
                ref: ref,
                gynxId: _afterGynxId,
                username: _afterUsername,
                avatarFile: _afterAvatarPath,
                isDeleteAvatar: _isDeleteAvatar,
                selfIntroduction: _afterSelfIntroduction,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SpaceSize.s16),
          child: Column(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  return ref.watch(suiteUserNotifierProvider).when(
                        data: (suiteUser) {
                          final avatarUrl = suiteUser.vUserDetail.avatarUrl;
                          return EditAvatar(
                            avatarUrl: _isDeleteAvatar
                                ? null
                                : _afterAvatarPath?.path ?? avatarUrl,
                            onChanged: (value) {
                              setState(() {
                                _afterAvatarPath = value;
                                _isDeleteAvatar = value == null;
                              });
                            },
                          );
                        },
                        error: (_, __) => const EditAvatar.loading(),
                        loading: () => const EditAvatar.loading(),
                      );
                },
              ),
              const Gap(SpaceSize.s24),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: SpaceSize.s8,
                  horizontal: SpaceSize.s16,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        return ref.watch(suiteUserNotifierProvider).when(
                              data: (suiteUser) {
                                final username = suiteUser.vUserDetail.username;
                                return EditProfileRow(
                                  name: context.l10n.username,
                                  text: _afterUsername ?? username,
                                  onTap: () {
                                    unawaited(
                                      showCupertinoModalBottomSheet(
                                        context: context,
                                        builder: (_) => EditUsername(
                                          onSaved: (value) {
                                            setState(() {
                                              _afterUsername = value;
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              error: (_, __) => EditProfileRow.loading(
                                name: context.l10n.username,
                              ),
                              loading: () => EditProfileRow.loading(
                                name: context.l10n.username,
                              ),
                            );
                      },
                    ),
                    Divider(
                      color: theme.colorScheme.onSurfaceVariant
                          .withValues(alpha: 0.3),
                    ),
                    Consumer(
                      builder: (context, ref, _) {
                        return ref.watch(suiteUserNotifierProvider).when(
                              data: (suiteUser) {
                                final gynxId = suiteUser.vUserDetail.gynxId;
                                return EditProfileRow(
                                  name: context.l10n.gynxId,
                                  text: _afterGynxId ?? gynxId,
                                  onTap: () {
                                    unawaited(
                                      showCupertinoModalBottomSheet(
                                        context: context,
                                        builder: (_) {
                                          return EditGynxId(
                                            onSaved: (value) {
                                              setState(() {
                                                _afterGynxId = value;
                                              });
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              error: (_, __) => EditProfileRow.loading(
                                name: context.l10n.username,
                              ),
                              loading: () => EditProfileRow.loading(
                                name: context.l10n.username,
                              ),
                            );
                      },
                    ),
                    Divider(
                      color: theme.colorScheme.onSurfaceVariant
                          .withValues(alpha: 0.3),
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        return ref.watch(suiteUserNotifierProvider).when(
                              data: (suiteUser) {
                                final selfIntroduction =
                                    suiteUser.vUserDetail.selfIntroduction;
                                return EditProfileRow(
                                  name: context.l10n.selfIntroduction,
                                  text: _afterSelfIntroduction ??
                                      selfIntroduction,
                                  onTap: () {
                                    unawaited(
                                      showCupertinoModalBottomSheet(
                                        context: context,
                                        builder: (_) => EditSelfIntroduction(
                                          onSaved: (value) {
                                            setState(() {
                                              _afterSelfIntroduction = value;
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              error: (_, __) => EditProfileRow.loading(
                                name: context.l10n.selfIntroduction,
                              ),
                              loading: () => EditProfileRow.loading(
                                name: context.l10n.selfIntroduction,
                              ),
                            );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

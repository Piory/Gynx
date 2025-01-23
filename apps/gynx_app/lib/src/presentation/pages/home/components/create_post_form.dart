import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/enums/timeline_type.dart';
import 'package:gynx_app/src/presentation/components/elements/avatars/user_avatar.dart';
import 'package:gynx_app/src/presentation/components/elements/medias/media_list.dart';
import 'package:gynx_app/src/presentation/dialogs/loading_dialog.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:gynx_app/src/presentation/notifiers/timeline_notifier.dart';
import 'package:gynx_app/src/presentation/pages/home/components/form_builder_image_picker.dart';
import 'package:gynx_app/src/presentation/pages/home/home_controller.dart';
import 'package:gynx_components/gynx_components.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostForm extends ConsumerStatefulWidget {
  const CreatePostForm({
    super.key,
  });

  @override
  ConsumerState<CreatePostForm> createState() => _CreatePostFormState();
}

class _CreatePostFormState extends ConsumerState<CreatePostForm> {
  late final FocusNode _focusNode;
  List<XFile> _medias = const [];

  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textScaler = MediaQuery.textScalerOf(context);
    final colorScheme = theme.colorScheme;
    final formKey = GlobalObjectKey<FormBuilderState>(context);
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.1),
          child: Divider(
            height: 0,
            color: colorScheme.onSurfaceVariant.withOpacity(0.15),
          ),
        ),
        leading: CloseButton(
          color: colorScheme.primary,
        ),
      ),
      body: SafeArea(
        child: FormBuilder(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      SpaceSize.s16,
                    ),
                    child: Consumer(
                      builder: (context, ref, _) {
                        final suiteUser = ref.watch(
                          suiteUserNotifierProvider
                              .select((value) => value.value),
                        );
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UserAvatar(
                              isLoading: suiteUser == null,
                              avatarUrl: suiteUser?.vUserDetail.avatarUrl,
                              radius: 20,
                            ),
                            const Gap(SpaceSize.s8),
                            Flexible(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            suiteUser?.vUserDetail.username ??
                                                '',
                                            style: theme.textTheme.bodyMedium!
                                                .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Gap(SpaceSize.s4),
                                          Text(
                                            suiteUser == null
                                                ? ''
                                                : '@${suiteUser.vUserDetail.gynxId}',
                                            style: theme.textTheme.bodyMedium!
                                                .copyWith(
                                              color: theme
                                                  .colorScheme.onSurfaceVariant,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Gap(SpaceSize.s4),
                                  FormBuilderTextField(
                                    focusNode: _focusNode,
                                    name: 'text',
                                    autofocus: true,
                                    maxLength: Constant.postTextMaxLength,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                        errorText:
                                            context.l10n.postRequiredError,
                                      ),
                                      FormBuilderValidators.maxLength(
                                        Constant.postTextMaxLength,
                                      ),
                                    ]),
                                    decoration: InputDecoration(
                                      isCollapsed: true,
                                      contentPadding: EdgeInsets.zero,
                                      hintText: context.l10n.postHintText,
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                  ),
                                  if (_medias.isNotEmpty)
                                    Column(
                                      children: [
                                        const Gap(SpaceSize.s8),
                                        MediaList(
                                          urls: _medias
                                              .map((m) => m.path)
                                              .toList(),
                                          onClosed: (url) {
                                            final medias = _medias
                                                .where((m) => m.path != url)
                                                .toList();
                                            formKey
                                                .currentState?.fields['medias']
                                                ?.didChange(medias);
                                            setState(() {
                                              _medias = medias;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FormBuilderImagePicker(
                    textFieldFocusNode: _focusNode,
                    onChanged: (medias) {
                      setState(() {
                        _medias = medias;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SpaceSize.s8,
                      vertical: SpaceSize.s4,
                    ),
                    child: GradientOutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: const EdgeInsets.symmetric(
                          horizontal: SpaceSize.s16,
                          vertical: SpaceSize.s8,
                        ),
                      ),
                      onPressed: () => _createPost(
                        context: context,
                        formKey: formKey,
                      ),
                      child: Text(
                        context.l10n.post,
                        style: theme.textTheme.bodyMedium,
                        textScaler: textScaler.clamp(
                          maxScaleFactor: 1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createPost({
    required BuildContext context,
    required GlobalKey<FormBuilderState> formKey,
  }) async {
    final loadingDialog = GetIt.I<LoadingDialog>()..show();
    try {
      final currentState = formKey.currentState;
      if (!currentState!.validate()) {
        return;
      }
      currentState.save();
      await GetIt.I<HomeController>().createPost(
        timelineNotifier: ref.read(
          timelineNotifierProvider(TimelineType.follow).notifier,
        ),
        text: currentState.fields['text']!.value as String,
        mediaPaths: (currentState.fields['medias']!.value as List<XFile>)
            .map((m) => m.path)
            .toList(),
      );
      if (context.mounted) {
        GetIt.I<PageNavigator>().pop(context);
      }
    } finally {
      loadingDialog.hide();
    }
  }
}

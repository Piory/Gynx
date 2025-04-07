import 'package:app/src/domain/usecases/check_screen_name_existence_usecase.dart';
import 'package:app/src/presentation/dialogs/loading_dialog.dart';
import 'package:app/src/presentation/navigation/page_navigator.dart';
import 'package:app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:locales/locales.dart';

class EditScreenName extends ConsumerWidget {
  const EditScreenName({
    super.key,
    required this.onSaved,
  });

  final FormFieldSetter<String> onSaved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final textScaler = MediaQuery.textScalerOf(context);
    final formKey = GlobalObjectKey<FormBuilderState>(context);
    final initialScreenName = ref.watch(
      suiteUserNotifierProvider.select(
        (value) => value.value?.vUserDetail.screenName,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.editScreenName,
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
              ),
              onPressed: () => _onDone(
                context: context,
                ref: ref,
                formKey: formKey,
                initialScreenName: initialScreenName,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(SpaceSize.s16),
        child: FormBuilder(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormBuilderTextField(
                name: 'screen_name',
                initialValue: initialScreenName,
                autofocus: true,
                maxLength: Constant.screenNameMaxLength,
                keyboardType: TextInputType.text,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.minLength(
                    Constant.screenNameMinLength,
                  ),
                  FormBuilderValidators.maxLength(
                    Constant.screenNameMaxLength,
                  ),
                  FormBuilderValidators.match(
                    RegExp(r'^[a-zA-Z0-9_]+$'),
                    errorText: context.l10n.editScreenNameRegexpError,
                  ),
                ]),
                decoration: InputDecoration(
                  prefixText: '@',
                  prefixStyle: textTheme.bodyMedium,
                  labelText: context.l10n.screenName,
                ),
                onSaved: (value) => onSaved(value?.trim()),
              ),
              const Gap(SpaceSize.s16),
              Text(
                context.l10n.editScreenNameLength(
                  Constant.screenNameMinLength,
                  Constant.screenNameMaxLength,
                ),
                style: textTheme.bodySmall!.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const Gap(SpaceSize.s4),
              Text(
                context.l10n.editScreenNameRegexp,
                style: textTheme.bodySmall!.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onDone({
    required BuildContext context,
    required WidgetRef ref,
    required GlobalKey<FormBuilderState> formKey,
    required String? initialScreenName,
  }) async {
    if (initialScreenName == null) {
      return;
    }
    final loadingDialog = GetIt.I<LoadingDialog>();
    final pageNavigator = GetIt.I<PageNavigator>();
    final checkScreenNameExistenceUseCase = GetIt.I<CheckScreenNameExistenceUseCase>();
    loadingDialog.show();
    try {
      final currentState = formKey.currentState;
      if (!currentState!.validate()) {
        return;
      }
      final screenNameField = currentState.fields['screen_name']!;
      final inputtedScreenName = screenNameField.value as String;
      if (inputtedScreenName == initialScreenName) {
        if (context.mounted) {
          pageNavigator.pop(context);
        }
        return;
      }
      if (await checkScreenNameExistenceUseCase.execute(inputtedScreenName)) {
        if (context.mounted) {
          screenNameField.invalidate(
            context.l10n.editScreenNameExistenceError,
          );
        }
        return;
      }
      currentState.save();
      if (context.mounted) {
        pageNavigator.pop(context);
      }
    } finally {
      loadingDialog.hide();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/usecases/check_gynx_id_existence_usecase.dart';
import 'package:gynx_app/src/presentation/dialogs/loading_dialog.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/notifiers/user_notifier.dart';
import 'package:gynx_components/gynx_components.dart';
import 'package:gynx_l10n/gynx_l10n.dart';

class EditGynxId extends ConsumerWidget {
  const EditGynxId({
    super.key,
    required this.onSaved,
  });

  static const _minLength = 4;
  static const _maxLengthLength = 16;

  final FormFieldSetter<String> onSaved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final textScaler = MediaQuery.textScalerOf(context);
    final formKey = GlobalObjectKey<FormBuilderState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.editGynxId,
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
              Consumer(
                builder: (context, ref, child) {
                  return FormBuilderTextField(
                    name: 'gynx_id',
                    initialValue: ref.watch(
                      userNotifierProvider.select(
                        (value) => value.value?.tUser.gynxId,
                      ),
                    ),
                    autofocus: true,
                    maxLength: _maxLengthLength,
                    keyboardType: TextInputType.text,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.minLength(_minLength),
                      FormBuilderValidators.maxLength(_maxLengthLength),
                      FormBuilderValidators.match(
                        RegExp(r'^[a-zA-Z0-9_]+$'),
                        errorText: context.l10n.editGynxIdRegexpError,
                      ),
                    ]),
                    decoration: InputDecoration(
                      prefixText: '@',
                      prefixStyle: textTheme.bodyMedium,
                      labelText: context.l10n.gynxId,
                    ),
                    onSaved: (value) => onSaved(value?.trim()),
                  );
                },
              ),
              const Gap(SpaceSize.s16),
              Text(
                context.l10n.editGynxIdLength(
                  _minLength,
                  _maxLengthLength,
                ),
                style: textTheme.bodySmall!.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const Gap(SpaceSize.s4),
              Text(
                context.l10n.editGynxIdRegexp,
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
  }) async {
    final loadingDialog = GetIt.I<LoadingDialog>();
    final pageNavigator = GetIt.I<PageNavigator>();
    final checkGynxIdExistenceUseCase = GetIt.I<CheckGynxIdExistenceUsecase>();
    loadingDialog.show();
    try {
      final currentState = formKey.currentState;
      if (!currentState!.validate()) {
        return;
      }
      final gynxIdField = currentState.fields['gynx_id']!;
      final inputtedGynxId = gynxIdField.value as String;
      final gynxId = ref.read(
        userNotifierProvider.select(
          (value) => value.value?.tUser.gynxId,
        ),
      );
      if (inputtedGynxId == gynxId) {
        if (context.mounted) {
          pageNavigator.pop(context);
        }
        return;
      }
      if (await checkGynxIdExistenceUseCase.execute(inputtedGynxId)) {
        if (context.mounted) {
          gynxIdField.invalidate(
            context.l10n.editGynxIdExistenceError,
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

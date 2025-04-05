import 'package:app/src/presentation/navigation/page_navigator.dart';
import 'package:app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:locales/locales.dart';

class EditSelfIntroduction extends StatelessWidget {
  const EditSelfIntroduction({
    super.key,
    required this.onSaved,
  });

  final FormFieldSetter<String> onSaved;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final textScaler = MediaQuery.textScalerOf(context);
    final formKey = GlobalObjectKey<FormBuilderState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.editUsername,
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
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  GetIt.I<PageNavigator>().pop(context);
                }
              },
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
                builder: (context, ref, _) {
                  return FormBuilderTextField(
                    name: 'self_introduction',
                    initialValue: ref.watch(
                      suiteUserNotifierProvider.select(
                        (value) => value.value?.vUserDetail.selfIntroduction,
                      ),
                    ),
                    autofocus: true,
                    minLines: 1,
                    maxLines: Constant.selfIntroductionMaxLines,
                    maxLength: Constant.selfIntroductionMaxLength,
                    keyboardType: TextInputType.multiline,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.maxLength(
                        Constant.selfIntroductionMaxLength,
                        checkNullOrEmpty: false,
                      ),
                    ]),
                    inputFormatters: [
                      TextInputFormatter.withFunction(
                        (oldValue, newValue) {
                          final numLines = '\n'.allMatches(newValue.text).length;
                          if (numLines > Constant.selfIntroductionMaxLines - 1) {
                            return oldValue;
                          }
                          return newValue;
                        },
                      ),
                    ],
                    decoration: InputDecoration(
                      labelText: context.l10n.selfIntroduction,
                    ),
                    onSaved: (value) => onSaved(value?.trim()),
                  );
                },
              ),
              const Gap(SpaceSize.s16),
              Text(
                context.l10n.editSelfIntroductionLength(
                  Constant.selfIntroductionMaxLength,
                ),
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
}

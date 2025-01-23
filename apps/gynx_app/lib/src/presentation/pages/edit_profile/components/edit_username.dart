import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/presentation/navigation/page_navigator.dart';
import 'package:gynx_app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:gynx_components/gynx_components.dart';
import 'package:gynx_l10n/gynx_l10n.dart';

class EditUsername extends StatelessWidget {
  const EditUsername({
    super.key,
    required this.onSaved,
  });

  static const _minLength = 3;
  static const _maxLength = 20;

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
                    name: 'username',
                    initialValue: ref.watch(
                      suiteUserNotifierProvider.select(
                        (value) => value.value?.vUserDetail.username,
                      ),
                    ),
                    autofocus: true,
                    maxLength: _maxLength,
                    keyboardType: TextInputType.text,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.minLength(_minLength),
                      FormBuilderValidators.maxLength(_maxLength),
                    ]),
                    decoration: InputDecoration(
                      labelText: context.l10n.username,
                    ),
                    onSaved: (value) => onSaved(value?.trim()),
                  );
                },
              ),
              const Gap(SpaceSize.s16),
              Text(
                context.l10n.editUsernameLength(
                  _minLength,
                  _maxLength,
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

import 'package:flutter/material.dart';
import 'package:locales/src/l10n.dart';

extension L10nExtension on BuildContext {
  L10n get l10n => L10n.of(this);
}

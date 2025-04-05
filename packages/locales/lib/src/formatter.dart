import 'package:intl/intl.dart' as intl;
import 'package:locales/src/l10n.dart';

class Formatter {
  static String fromNumber(L10n l10n, int number) {
    return intl.NumberFormat.compact(
      locale: l10n.localeName,
    ).format(number);
  }
}

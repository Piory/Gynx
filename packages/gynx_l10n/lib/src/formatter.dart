import 'package:gynx_l10n/src/l10n.dart';
import 'package:intl/intl.dart' as intl;

class Formatter {
  static String fromNumber(L10n l10n, int number) {
    return intl.NumberFormat.compact(
      locale: l10n.localeName,
    ).format(number);
  }
}

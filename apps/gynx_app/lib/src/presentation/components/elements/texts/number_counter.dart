import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:intl/intl.dart';

class NumberCounter extends StatelessWidget {
  const NumberCounter({
    super.key,
    required this.value,
    this.style,
  });

  final int value;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    if (value < 1000) {
      return AnimatedFlipCounter(
        value: value,
        textStyle: style,
      );
    } else {
      return Text(
        NumberFormat.compact(
          locale: context.l10n.localeName,
        ).format(value),
        style: style,
      );
    }
  }
}

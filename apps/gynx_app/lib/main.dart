import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gynx_core/gynx_core.dart';
import 'package:gynx_l10n/gynx_l10n.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

final class ColorPalette {
  static const primary = Color(0xFF9C5DFF);
  static const surface = Color(0xFF1A1221);
  static const onSurface = Color(0xFFAD94C7);
  static const surfaceContainerHighest = Color(0xFF362447);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = const ColorScheme.highContrastDark(
      primary: ColorPalette.primary,
    ).copyWith(
      // 背景色
      surface: ColorPalette.surface,
      // AppBar のテキスト色
      onSurface: ColorPalette.onSurface,
      // ElevatedButton のボタンの背景色
      surfaceContainerLow: ColorPalette.primary,
      // TextField の背景色
      surfaceContainerHighest: ColorPalette.surfaceContainerHighest,
      // TextField, OutlinedButton の枠線の色
      outline: ColorPalette.primary.withOpacity(0.6),
    );
    final textTheme = GoogleFonts.notoSansJpTextTheme(
      ThemeData.dark().textTheme,
    );
    return MaterialApp(
      title: 'Gynx',
      localizationsDelegates: const [
        ...L10n.localizationsDelegates,
        // FormBuilderLocalizations.delegate,
      ],
      supportedLocales: L10n.supportedLocales,
      theme: ThemeData(
        colorScheme: colorScheme,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        textTheme: textTheme,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          filled: true,
          labelStyle: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurface,
          ),
          floatingLabelStyle: textTheme.bodyMedium!.copyWith(
            color: colorScheme.primary,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: const SignInView(),
    );
  }
}

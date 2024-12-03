import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gynx_core/src/infrastructure/router/go_router.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class ColorPalette {
  // Purple
  static const primary = Color(0xFF9C5DFF);
  static const surface = Color(0xFF1A1221);
  static const onSurface = Color(0xFFAD94C7);
  static const surfaceContainerHighest = Color(0xFF362447);
// Green
// static const primary = Color(0xFF348E47);
// static const surface = Color(0xFF090909);
// static const onSurface = Color(0xFF689E64);
// static const surfaceContainerHighest = Color(0xFF112C12);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
      if (data.session == null) {
        await Supabase.instance.client.auth.signInAnonymously();
      }
    });
    final colorScheme = const ColorScheme.dark(
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
    return MaterialApp.router(
      title: 'Gynx',
      localizationsDelegates: const [
        ...L10n.localizationsDelegates,
        // FormBuilderLocalizations.delegate,
      ],
      supportedLocales: L10n.supportedLocales,
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      theme: ThemeData(
        colorScheme: colorScheme,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        textTheme: textTheme,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          outlineBorder: BorderSide(
            color: colorScheme.outline,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colorScheme.outline.withOpacity(0.3),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colorScheme.outline,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          filled: true,
          labelStyle: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurface,
          ),
          floatingLabelStyle: textTheme.bodyMedium!.copyWith(
            color: colorScheme.primary,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          shape: CircleBorder(),
          elevation: 0,
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
            overlayColor: Colors.transparent,
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
            shadowColor: Colors.transparent,
            overlayColor: Colors.transparent,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            overlayColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}

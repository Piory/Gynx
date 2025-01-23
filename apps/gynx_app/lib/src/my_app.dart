import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gynx_app/src/infrastructure/router/go_router.dart';
import 'package:gynx_app/src/presentation/navigation/page_type.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// ignore: avoid_classes_with_only_static_members
final class ColorPalette {
  static const gradientStart = Color(0xFF9C5DFF);
  static const gradientStartContainer = Color(0xFF0A001E);
  static const gradientEnd = Color(0xFFE934A6);
  static const gradientEndContainer = Color(0xFF200014);

  // Purple
  static const primary = Color(0xFFBD4CD8);
  static const primaryContainer = Color(0xFF0A001E);
  static const secondary = Color(0xFFE934A6);
  static const secondaryContainer = Color(0xFF200014);
  static const surface = Color(0xFF160919);
  static const onSurface = Color(0xFFFFFFFF);
  static const onSurfaceVariant = Color(0xFF737373);
  static const surfaceContainerHighest = Color(0xFF362447);

// Green
// static const primary = Color(0xFF348E47);
// static const surface = Color(0xFF090909);
// static const onSurface = Color(0xFF689E64);
// static const surfaceContainerHighest = Color(0xFF112C12);
  static const error = Color(0xFFEA3333);
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  ConsumerState<MyApp> createState() => _MyApp();
}

class _MyApp extends ConsumerState<MyApp> {
  @override
  void initState() {
    GetIt.I<SupabaseClient>().auth.onAuthStateChange.listen((data) {
      if (data.session == null) {
        goRouter.go(PageType.root.path);
      } else {
        goRouter.go(PageType.home.path);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = const ColorScheme.dark(
      primary: ColorPalette.primary,
      primaryContainer: ColorPalette.primaryContainer,
      secondary: ColorPalette.secondary,
      secondaryContainer: ColorPalette.secondaryContainer,
      error: ColorPalette.error,
    ).copyWith(
      // 背景色
      surface: ColorPalette.surface,
      // AppBar のテキスト色
      onSurface: ColorPalette.onSurface,
      onSurfaceVariant: ColorPalette.onSurfaceVariant,
      // ElevatedButton のボタンの背景色
      surfaceContainerLow: ColorPalette.primary,
      // TextField の背景色
      surfaceContainerHighest: ColorPalette.surfaceContainerHighest,
      // TextField, OutlinedButton の枠線の色
      outline: ColorPalette.onSurfaceVariant,
    );
    final textTheme = GoogleFonts.notoSansJpTextTheme(
      ThemeData.dark().textTheme,
    );
    FlutterNativeSplash.remove();
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: MaterialApp.router(
        title: 'Gynx',
        localizationsDelegates: const [
          ...L10n.localizationsDelegates,
          ...FormBuilderLocalizations.localizationsDelegates,
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
          iconTheme: IconThemeData(
            color: colorScheme.primary,
          ),
          dividerColor: colorScheme.onSurfaceVariant.withOpacity(0.6),
          dividerTheme: DividerThemeData(
            color: colorScheme.onSurfaceVariant.withOpacity(0.6),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: colorScheme.surface,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            iconTheme: IconThemeData(
              color: colorScheme.onSurface,
            ),
            titleTextStyle: textTheme.bodyLarge!.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          tabBarTheme: TabBarTheme(
            dividerHeight: 1,
            dividerColor: colorScheme.onSurfaceVariant.withOpacity(0.15),
          ),
          navigationBarTheme: NavigationBarThemeData(
            height: 56,
            backgroundColor: colorScheme.surface,
            indicatorColor: colorScheme.primary,
            labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  color: colorScheme.primary,
                );
              }
              return textTheme.bodySmall!.copyWith(
                fontSize: 12,
                color: colorScheme.primary,
              );
            }),
            iconTheme: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(
                  color: Colors.white,
                );
              }
              return IconThemeData(
                color: colorScheme.primary,
              );
            }),
          ),
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
                color: colorScheme.outline.withOpacity(0.6),
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
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorScheme.error,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            labelStyle: textTheme.bodyMedium!.copyWith(
              color: colorScheme.outline,
              fontSize: 14,
            ),
            floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return textTheme.bodyMedium!.copyWith(
                  color: colorScheme.onSurfaceVariant.withOpacity(0.38),
                  fontWeight: FontWeight.bold,
                );
              }
              if (states.contains(WidgetState.error)) {
                return textTheme.bodyMedium!.copyWith(
                  color: colorScheme.error,
                  fontWeight: FontWeight.bold,
                );
              }
              if (states.contains(WidgetState.focused)) {
                return textTheme.bodyMedium!.copyWith(
                  color: colorScheme.outline,
                  fontWeight: FontWeight.bold,
                );
              }
              return textTheme.bodyMedium!.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              );
            }),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: colorScheme.onSurface,
            backgroundColor: colorScheme.primary,
            shape: const CircleBorder(),
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
              // shadowColor: colorScheme.primary,
              // elevation: 4,
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: colorScheme.outline,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              textStyle: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
              overlayColor: Colors.transparent,
              elevation: 0,
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              overlayColor: Colors.transparent,
            ),
          ),
        ),
        builder: FlutterSmartDialog.init(
          loadingBuilder: (_) => const SizedBox(
            width: 64,
            height: 64,
          ).blurred(
            blur: 10,
            blurColor: const Color(0xFF606060),
            borderRadius: BorderRadius.circular(16),
            overlay: Padding(
              padding: const EdgeInsets.all(SpaceSize.s16),
              child: LoadingAnimationWidget.flickr(
                leftDotColor: colorScheme.primary,
                rightDotColor: colorScheme.secondary,
                size: 28,
              ),
            ),
          ),
          notifyStyle: FlutterSmartNotifyStyle(
            errorBuilder: (message) {
              return const SizedBox(
                width: 128,
                height: 128,
              ).blurred(
                blur: 10,
                blurColor: const Color(0xFF606060),
                borderRadius: BorderRadius.circular(16),
                overlay: Padding(
                  padding: const EdgeInsets.all(SpaceSize.s16),
                  child: Column(
                    children: [
                      Icon(
                        EvaIcons.alert_circle_outline,
                        color: colorScheme.error,
                        size: 32,
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            message,
                            style: textTheme.bodyMedium!.copyWith(
                              color: colorScheme.error,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

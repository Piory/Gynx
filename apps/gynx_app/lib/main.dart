import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gynx_app/src/infrastructure/di/injector.dart';
import 'package:gynx_app/src/infrastructure/supabase/supabase_initializer.dart';
import 'package:gynx_app/src/my_app.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await supabaseInitializer();
  configureDependencies();
  FlutterError.onError = (details) {
    print('FlutterError.onError: $details');
  };
  PlatformDispatcher.instance.onError = (error, stacktrace) {
    print('PlatformDispatcher.instance.onError: $error');
    debugPrintStack(stackTrace: stacktrace);
    return true;
  };
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

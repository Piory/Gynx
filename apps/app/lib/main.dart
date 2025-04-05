import 'dart:ui';

import 'package:app/src/infrastructure/di/injector.dart';
import 'package:app/src/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago_flutter/timeago_flutter.dart' as timeago;

void main() async {
  timeago.setLocaleMessages('ja', timeago.JaMessages());
  timeago.setLocaleMessages('en', timeago.EnMessages());
  timeago.setDefaultLocale('en');
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await configureDependencies();
  FlutterError.onError = (details) {
    debugPrint('FlutterError.onError');
    debugPrint(details.toString());
  };
  PlatformDispatcher.instance.onError = (error, stacktrace) {
    debugPrint('PlatformDispatcher.instance.onError');
    debugPrint(error.toString());
    debugPrintStack(stackTrace: stacktrace);
    return true;
  };
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

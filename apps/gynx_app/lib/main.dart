import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gynx_app/src/infrastructure/di/injector.dart';
import 'package:gynx_app/src/infrastructure/supabase/supabase_initializer.dart';
import 'package:gynx_app/src/my_app.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(
    fileName: 'assets/.env',
  );
  await supabaseInitializer(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_ANON_KEY'),
  );
  configureDependencies();
  runApp(
    const MyApp(),
  );
}

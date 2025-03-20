import 'package:gynx_app/src/constants/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> supabaseInitializer() async {
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
  );
}

import 'package:gynx_constants/gynx_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> supabaseInitializer() async {
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
  );
}

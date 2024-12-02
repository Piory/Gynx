import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> supabaseInitializer({
  required String url,
  required String anonKey,
}) async {
  await Supabase.initialize(
    url: url,
    anonKey: anonKey,
  );
}

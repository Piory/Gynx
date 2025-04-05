// ignore_for_file: avoid_classes_with_only_static_members
import 'package:envied/envied.dart';

part '../generated/src/environments/env.g.dart';

@Envied(path: '.env', obfuscate: true, useConstantCase: true)
abstract class Env {
  @EnviedField(varName: 'SUPABASE_URL')
  static final String supabaseUrl = _Env.supabaseUrl;

  @EnviedField(varName: 'SUPABASE_ANON_KEY')
  static final String supabaseAnonKey = _Env.supabaseAnonKey;

  @EnviedField(varName: 'SUPABASE_SERVICE_ROLE_KEY', optional: true)
  static final String? supabaseServiceRoleKey = _Env.supabaseServiceRoleKey;

  @EnviedField(
    varName: 'GOOGLE_CLIENT_ID',
  )
  static final String googleClientId = _Env.googleClientId;
}

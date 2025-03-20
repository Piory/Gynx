// ignore_for_file: avoid_classes_with_only_static_members
import 'package:envied/envied.dart';

part '../generated/src/constants/env.g.dart';

@Envied(path: '.env', obfuscate: true, useConstantCase: true)
abstract class Env {
  @EnviedField()
  static final String supabaseUrl = _Env.supabaseUrl;

  @EnviedField()
  static final String supabaseAnonKey = _Env.supabaseAnonKey;

  @EnviedField()
  static final String googleClientId = _Env.googleClientId;
}

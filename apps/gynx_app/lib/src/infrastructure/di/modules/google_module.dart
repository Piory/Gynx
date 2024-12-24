import 'package:google_sign_in/google_sign_in.dart';
import 'package:gynx_app/src/constants/env.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GoogleModule {
  @singleton
  GoogleSignIn get googleSignIn => GoogleSignIn(
        clientId: Env.googleClientId,
      );
}

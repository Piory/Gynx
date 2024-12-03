import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Gynx';

  @override
  String get required => 'Required';

  @override
  String get signIn => 'SignIn';

  @override
  String get signUp => 'SignUp';

  @override
  String get signOut => 'SignOut';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get forgotYourPassword => 'Forgot your password?';

  @override
  String get dontHaveAnAccount => 'Don\'t have an account?';

  @override
  String get alreadyHaveAnAccount => 'Already have an account?';
}

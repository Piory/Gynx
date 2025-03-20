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
  String get or => 'or';

  @override
  String get signUpOrSignIn => 'Sign up or Sign in';

  @override
  String get signInTitle => 'Sign in to make the most of Gynx!';

  @override
  String get signInDescription => 'To continue, please log in using one of the services below.';

  @override
  String get continueWithApple => 'Continue with Apple';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get continueWithX => 'Continue with X';

  @override
  String get continueWithTwitch => 'Continue with Twitch';

  @override
  String get continueWithDiscord => 'Continue with Discord';

  @override
  String get continueAsGuest => 'Continue as guest';

  @override
  String get continueAsGuestWarning => 'By continuing as a guest, some features may be limited.';

  @override
  String get continueIsApproveTermsOfServiceAndPrivacyPolicy => 'By continuing, you agree to Gynx’s Terms of Service and Privacy Policy.';

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

import 'package:intl/intl.dart' as intl;

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
  String get confirm => 'Confirm';

  @override
  String get takePhoto => 'Take a photo';

  @override
  String get selectFromLibrary => 'Select from library';

  @override
  String get deleteImage => 'Delete Image';

  @override
  String get edit => 'Edit';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get editUsername => 'Edit Username';

  @override
  String editUsernameLength(int min, int max) {
    return 'Username must be between $min and $max characters.';
  }

  @override
  String get editGynxId => 'Edit Gynx ID';

  @override
  String get editGynxIdRegexp => 'Gynx ID can only contain alphanumeric characters and underscores (_).';

  @override
  String get editGynxIdRegexpError => 'Invalid characters are included.';

  @override
  String editGynxIdLength(int min, int max) {
    return 'Gynx ID must be between $min and $max characters.';
  }

  @override
  String get editGynxIdExistenceError => 'This Gynx ID is already in use.';

  @override
  String get editSelfIntroduction => 'Edit Self Introduction';

  @override
  String editSelfIntroductionLength(int max) {
    return 'Self Introduction must be up to $max characters.';
  }

  @override
  String get updateUserProfileError => 'Failed to update user profile.';

  @override
  String get share => 'Share';

  @override
  String get post => 'Post';

  @override
  String get posts => 'Posts';

  @override
  String get username => 'Username';

  @override
  String get gynxId => 'Gynx ID';

  @override
  String get selfIntroduction => 'Self Introduction';

  @override
  String get favorite => 'Favorite';

  @override
  String get favorites => 'Favorites';

  @override
  String get cancel => 'Cancel';

  @override
  String get done => 'Done';

  @override
  String get save => 'Save';

  @override
  String get ok => 'OK';

  @override
  String get doContinue => 'Continue';

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
  String get continueAsGuestWarning => 'Guest users have limited access to features, but these restrictions will be lifted after linking your account.';

  @override
  String get guestSignInAlertTitle => 'Important Notes for Guest Users';

  @override
  String get guestSignInAlertMessage => 'Some features are restricted. You can remove these restrictions by linking your account from the Profile > Settings page.\nOnce you log out, you will not be able to log in again.\nGuest user accounts that remain inactive for more than 90 days will be deleted.\n\nDo you want to continue as a guest user?';

  @override
  String get continueIsApproveTermsOfServiceAndPrivacyPolicy => 'By continuing, you agree to Gynx’s Terms of Service and Privacy Policy.';

  @override
  String get signIn => 'SignIn';

  @override
  String get signInError => 'Sign in failed';

  @override
  String get signOut => 'SignOut';

  @override
  String get signOutError => 'Sign out failed';

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

  @override
  String follow(int follow) {
    final intl.NumberFormat followNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String followString = followNumberFormat.format(follow);

    return '$followString Follow';
  }

  @override
  String follower(int follower) {
    final intl.NumberFormat followerNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String followerString = followerNumberFormat.format(follower);

    return '$followerString Follower';
  }
}

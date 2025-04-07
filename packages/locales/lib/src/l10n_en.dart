// ignore: unused_import
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
  String get deleteImage => 'Delete image';

  @override
  String get edit => 'Edit';

  @override
  String get editProfile => 'Edit profile';

  @override
  String get editDisplayName => 'Edit display name';

  @override
  String editDisplayNameLength(int min, int max) {
    return 'Display name must be between $min and $max characters.';
  }

  @override
  String get editScreenName => 'Edit handle';

  @override
  String get editScreenNameRegexp => 'Handle can only contain alphanumeric characters and underscores (_).';

  @override
  String get editScreenNameRegexpError => 'Contains invalid characters.';

  @override
  String editScreenNameLength(int min, int max) {
    return 'Handle must be between $min and $max characters.';
  }

  @override
  String get editScreenNameExistenceError => 'This handle is already in use.';

  @override
  String get editSelfIntroduction => 'Edit self-introduction';

  @override
  String editSelfIntroductionLength(int max) {
    return 'Self-introduction must be within $max characters.';
  }

  @override
  String get updateUserProfileError => 'Failed to update profile.';

  @override
  String get share => 'Share';

  @override
  String get post => 'Post';

  @override
  String get posts => 'Posts';

  @override
  String get postedAt => '';

  @override
  String get postHintText => 'How have you been lately?';

  @override
  String get postRequiredError => 'Please enter the post content.';

  @override
  String get postListEmpty => 'No posts yet';

  @override
  String get favoritePostListEmpty => 'No favorite posts';

  @override
  String get displayName => 'Display name';

  @override
  String get screenName => 'Handle';

  @override
  String get selfIntroduction => 'Self-introduction';

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
  String get or => 'Or';

  @override
  String get signInTitle => 'Log in to make the most of Gynx!';

  @override
  String get signInDescription => 'Please log in with one of the following services to continue';

  @override
  String get signUpOrSignIn => 'Sign up or log in';

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
  String get continueAsGuest => 'Continue as a guest user';

  @override
  String get continueAsGuestWarning => 'Guest users have limited functionality, but restrictions will be lifted after linking an account';

  @override
  String get guestSignInAlertTitle => 'Guest User Notice';

  @override
  String get guestSignInAlertMessage => '・Some features will be limited. You can lift restrictions by linking your account from the Profile > Settings page.\n・Once you log out, you cannot log in again.\n・Accounts that have not been used for more than 90 days as a guest user will be deleted.\n\nDo you want to continue as a guest user?';

  @override
  String get continueIsApproveTermsOfServiceAndPrivacyPolicy => 'By continuing, you agree to Gynx\'s Terms of Service and Privacy Policy.';

  @override
  String get signIn => 'Log in';

  @override
  String get signInError => 'Failed to log in';

  @override
  String get signOut => 'Log out';

  @override
  String get signOutMessage => 'Are you sure you want to log out?';

  @override
  String get signOutError => 'Failed to log out';

  @override
  String get email => 'Email address';

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

    return '$followString Followers';
  }

  @override
  String follower(int follower) {
    final intl.NumberFormat followerNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String followerString = followerNumberFormat.format(follower);

    return '$followerString Followers';
  }

  @override
  String get uploadVideoTooLongErrorTitle => 'Video is too long';

  @override
  String uploadVideoTooLongErrorMessage(int max) {
    return 'Please upload the video within $max seconds.';
  }

  @override
  String get setting => 'Settings';
}

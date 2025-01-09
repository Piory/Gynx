import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'src/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n)!;
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja')
  ];

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Gynx'**
  String get title;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get takePhoto;

  /// No description provided for @selectFromLibrary.
  ///
  /// In en, this message translates to:
  /// **'Select from library'**
  String get selectFromLibrary;

  /// No description provided for @deleteImage.
  ///
  /// In en, this message translates to:
  /// **'Delete Image'**
  String get deleteImage;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @editUsername.
  ///
  /// In en, this message translates to:
  /// **'Edit Username'**
  String get editUsername;

  /// No description provided for @editUsernameLength.
  ///
  /// In en, this message translates to:
  /// **'Username must be between {min} and {max} characters.'**
  String editUsernameLength(int min, int max);

  /// No description provided for @editGynxId.
  ///
  /// In en, this message translates to:
  /// **'Edit Gynx ID'**
  String get editGynxId;

  /// No description provided for @editGynxIdRegexp.
  ///
  /// In en, this message translates to:
  /// **'Gynx ID can only contain alphanumeric characters and underscores (_).'**
  String get editGynxIdRegexp;

  /// No description provided for @editGynxIdRegexpError.
  ///
  /// In en, this message translates to:
  /// **'Invalid characters are included.'**
  String get editGynxIdRegexpError;

  /// No description provided for @editGynxIdLength.
  ///
  /// In en, this message translates to:
  /// **'Gynx ID must be between {min} and {max} characters.'**
  String editGynxIdLength(int min, int max);

  /// No description provided for @editGynxIdExistenceError.
  ///
  /// In en, this message translates to:
  /// **'This Gynx ID is already in use.'**
  String get editGynxIdExistenceError;

  /// No description provided for @editSelfIntroduction.
  ///
  /// In en, this message translates to:
  /// **'Edit Self Introduction'**
  String get editSelfIntroduction;

  /// No description provided for @editSelfIntroductionLength.
  ///
  /// In en, this message translates to:
  /// **'Self Introduction must be up to {max} characters.'**
  String editSelfIntroductionLength(int max);

  /// No description provided for @updateUserProfileError.
  ///
  /// In en, this message translates to:
  /// **'Failed to update user profile.'**
  String get updateUserProfileError;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @post.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get post;

  /// No description provided for @posts.
  ///
  /// In en, this message translates to:
  /// **'Posts'**
  String get posts;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @gynxId.
  ///
  /// In en, this message translates to:
  /// **'Gynx ID'**
  String get gynxId;

  /// No description provided for @selfIntroduction.
  ///
  /// In en, this message translates to:
  /// **'Self Introduction'**
  String get selfIntroduction;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @doContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get doContinue;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @signUpOrSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign up or Sign in'**
  String get signUpOrSignIn;

  /// No description provided for @signInTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to make the most of Gynx!'**
  String get signInTitle;

  /// No description provided for @signInDescription.
  ///
  /// In en, this message translates to:
  /// **'To continue, please log in using one of the services below.'**
  String get signInDescription;

  /// No description provided for @continueWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continueWithApple;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @continueWithX.
  ///
  /// In en, this message translates to:
  /// **'Continue with X'**
  String get continueWithX;

  /// No description provided for @continueWithTwitch.
  ///
  /// In en, this message translates to:
  /// **'Continue with Twitch'**
  String get continueWithTwitch;

  /// No description provided for @continueWithDiscord.
  ///
  /// In en, this message translates to:
  /// **'Continue with Discord'**
  String get continueWithDiscord;

  /// No description provided for @continueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get continueAsGuest;

  /// No description provided for @continueAsGuestWarning.
  ///
  /// In en, this message translates to:
  /// **'Guest users have limited access to features, but these restrictions will be lifted after linking your account.'**
  String get continueAsGuestWarning;

  /// No description provided for @guestSignInAlertTitle.
  ///
  /// In en, this message translates to:
  /// **'Important Notes for Guest Users'**
  String get guestSignInAlertTitle;

  /// No description provided for @guestSignInAlertMessage.
  ///
  /// In en, this message translates to:
  /// **'Some features are restricted. You can remove these restrictions by linking your account from the Profile > Settings page.\nOnce you log out, you will not be able to log in again.\nGuest user accounts that remain inactive for more than 90 days will be deleted.\n\nDo you want to continue as a guest user?'**
  String get guestSignInAlertMessage;

  /// No description provided for @continueIsApproveTermsOfServiceAndPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to Gynx’s Terms of Service and Privacy Policy.'**
  String get continueIsApproveTermsOfServiceAndPrivacyPolicy;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'SignIn'**
  String get signIn;

  /// No description provided for @signInError.
  ///
  /// In en, this message translates to:
  /// **'Sign in failed'**
  String get signInError;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'SignOut'**
  String get signOut;

  /// No description provided for @signOutMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out?'**
  String get signOutMessage;

  /// No description provided for @signOutError.
  ///
  /// In en, this message translates to:
  /// **'Sign out failed'**
  String get signOutError;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgotYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgotYourPassword;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAnAccount;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @follow.
  ///
  /// In en, this message translates to:
  /// **'{follow} Follow'**
  String follow(int follow);

  /// No description provided for @follower.
  ///
  /// In en, this message translates to:
  /// **'{follower} Follower'**
  String follower(int follower);

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get setting;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return L10nEn();
    case 'ja': return L10nJa();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get title => 'Gynx';

  @override
  String get required => '必須';

  @override
  String get confirm => '確認';

  @override
  String get cancel => 'キャンセル';

  @override
  String get ok => 'OK';

  @override
  String get doContinue => '続ける';

  @override
  String get or => 'または';

  @override
  String get signUpOrSignIn => '新規登録またはログイン';

  @override
  String get signInTitle => 'ログインして、Gynxを最大限に活用しよう！';

  @override
  String get signInDescription => '続行するには、以下のサービスでログインしてください';

  @override
  String get continueWithApple => 'Apple で続ける';

  @override
  String get continueWithGoogle => 'Google で続ける';

  @override
  String get continueWithX => 'X で続ける';

  @override
  String get continueWithTwitch => 'Twitch で続ける';

  @override
  String get continueWithDiscord => 'Discord で続ける';

  @override
  String get continueAsGuest => 'ゲストユーザーで続ける';

  @override
  String get continueAsGuestWarning => 'ゲストユーザーは機能が制限されますが、アカウント連携後に制限は解除されます';

  @override
  String get guestSignInAlertTitle => 'ゲストユーザーの注意事項';

  @override
  String get guestSignInAlertMessage => '・一部機能が制限されます。プロフィール > 設定ページからアカウント連携をすることで、制限を解除できます。\n・一度ログアウトすると再度ログインは行えません。\n・ゲストユーザーの状態で、90日以上使用していない状態のアカウントは削除されます。\n\nゲストユーザーで続行しますか？';

  @override
  String get continueIsApproveTermsOfServiceAndPrivacyPolicy => '続行することで、Gynx の利用規約およびプライバシーポリシーに同意するものとします。';

  @override
  String get signIn => 'ログイン';

  @override
  String get signUp => '登録';

  @override
  String get signOut => 'ログアウト';

  @override
  String get email => 'メールアドレス';

  @override
  String get password => 'パスワード';

  @override
  String get forgotYourPassword => 'パスワードをお忘れですか？';

  @override
  String get dontHaveAnAccount => 'アカウントをお持ちでないですか？';

  @override
  String get alreadyHaveAnAccount => 'すでにアカウントをお持ちですか？';
}

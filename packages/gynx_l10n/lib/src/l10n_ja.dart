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

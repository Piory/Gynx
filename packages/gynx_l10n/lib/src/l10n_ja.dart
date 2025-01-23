import 'package:intl/intl.dart' as intl;

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
  String get takePhoto => '写真を撮る';

  @override
  String get selectFromLibrary => 'ライブラリから選択';

  @override
  String get deleteImage => '画像を削除';

  @override
  String get edit => '編集';

  @override
  String get editProfile => 'プロフィールを編集';

  @override
  String get editUsername => 'ユーザー名を編集';

  @override
  String editUsernameLength(int min, int max) {
    return 'ユーザー名は、$min文字以上$max文字以内で入力してください。';
  }

  @override
  String get editGynxId => 'Gynx ID を編集';

  @override
  String get editGynxIdRegexp => 'Gynx ID には、半角英数字、アンダースコア（_）のみが利用できます。';

  @override
  String get editGynxIdRegexpError => '使用できない文字が含まれています。';

  @override
  String editGynxIdLength(int min, int max) {
    return 'Gynx ID は、$min文字以上$max文字以内で入力してください。';
  }

  @override
  String get editGynxIdExistenceError => 'この Gynx ID は既に使用されています。';

  @override
  String get editSelfIntroduction => '自己紹介を編集';

  @override
  String editSelfIntroductionLength(int max) {
    return '自己紹介は、$max文字以内で入力してください。';
  }

  @override
  String get updateUserProfileError => 'プロフィールの更新に失敗しました。';

  @override
  String get share => '共有';

  @override
  String get post => '投稿';

  @override
  String get posts => '投稿';

  @override
  String get postHintText => '最近どうしてる？';

  @override
  String get postRequiredError => '投稿内容を入力してください。';

  @override
  String get username => 'ユーザー名';

  @override
  String get gynxId => 'Gynx ID';

  @override
  String get selfIntroduction => '自己紹介';

  @override
  String get favorite => 'お気に入り';

  @override
  String get favorites => 'お気に入り';

  @override
  String get cancel => 'キャンセル';

  @override
  String get done => '完了';

  @override
  String get save => '保存';

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
  String get signInError => 'ログインに失敗しました';

  @override
  String get signOut => 'ログアウト';

  @override
  String get signOutMessage => '本当にログアウトしますか？';

  @override
  String get signOutError => 'ログアウトに失敗しました';

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

  @override
  String follow(int follow) {
    final intl.NumberFormat followNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String followString = followNumberFormat.format(follow);

    return '$followString フォロー';
  }

  @override
  String follower(int follower) {
    final intl.NumberFormat followerNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String followerString = followerNumberFormat.format(follower);

    return '$followerString フォロワー';
  }

  @override
  String get uploadVideoTooLongErrorTitle => '動画の長さが長すぎます';

  @override
  String uploadVideoTooLongErrorMessage(int max) {
    return '動画の長さは、$max秒以内でアップロードしてください。';
  }

  @override
  String get setting => '設定';
}

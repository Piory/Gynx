enum PageType {
  root('/'),
  home('/home'),
  signIn('/sign_in'),
  profile('/profile'),
  profileAvatar('/profile/avatar'),
  editProfile('/profile/edit'),
  setting('/profile/setting');

  const PageType(this.path);

  final String path;
}

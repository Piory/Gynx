enum PageType {
  root('/'),
  home('/home'),
  signIn('/sign_in'),
  profile('/profile'),
  editProfile('/profile/edit'),
  ;

  const PageType(this.path);

  final String path;
}

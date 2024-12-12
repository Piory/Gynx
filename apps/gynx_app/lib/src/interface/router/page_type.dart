enum PageType {
  root('/'),
  home('/home'),
  signIn('/sign_in'),
  profile('/profile'),
  ;

  const PageType(this.path);

  final String path;
}

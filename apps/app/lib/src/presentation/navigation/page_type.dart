enum PageType {
  root('/'),
  home('/home'),
  postMedia('/posts/:postId/medias/:postMediaId'),
  signIn('/sign_in'),
  profile('/profile'),
  profileAvatar('/profile/avatar'),
  editProfile('/profile/edit'),
  setting('/profile/setting');

  const PageType(this.path);

  final String path;

  String buildPath([
    Map<String, dynamic>? pathParams,
    Map<String, dynamic>? queryParams,
  ]) {
    var path = this.path;
    pathParams?.forEach((key, value) {
      path = path.replaceFirst(':$key', value.toString());
    });
    if (queryParams != null && queryParams.isNotEmpty) {
      path = '$path?${Uri(queryParameters: queryParams).query}';
    }
    return path;
  }
}

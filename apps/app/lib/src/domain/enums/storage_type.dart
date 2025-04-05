enum StorageType {
  users._('users'),
  posts._('posts'),
  ;

  const StorageType._(this.id);

  final String id;
}

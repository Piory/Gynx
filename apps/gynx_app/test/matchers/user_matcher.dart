import 'package:gynx_app/src/domain/entities/user.dart';
import 'package:test/test.dart';

class UserMatcher extends Matcher {
  const UserMatcher(this.user);

  final User user;

  @override
  Description describe(Description description) =>
      description.add('User: $user');

  @override
  bool matches(dynamic item, Map<dynamic, dynamic> matchState) => item == user;
}

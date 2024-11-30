import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/src/domain/entities/user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String username,
    required String email,
  }) = _User;

  const User._();
}

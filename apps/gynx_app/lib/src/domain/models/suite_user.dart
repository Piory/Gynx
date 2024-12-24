import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/t_user.dart';
import 'package:gynx_app/src/domain/entities/t_user_profile.dart';

part '../../generated/src/domain/models/suite_user.freezed.dart';

@freezed
class SuiteUser with _$SuiteUser {
  const factory SuiteUser({
    required TUser tUser,
    required TUserProfile tUserProfile,
  }) = _SuiteUser;

  const SuiteUser._();
}

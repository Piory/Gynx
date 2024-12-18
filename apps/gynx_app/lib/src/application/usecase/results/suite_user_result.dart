import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/t_user.dart';
import 'package:gynx_app/src/domain/entities/t_user_profile.dart';

part '../../../generated/src/application/usecase/results/suite_user_result.freezed.dart';

@freezed
class SuiteUserResult with _$SuiteUserResult {
  const factory SuiteUserResult({
    required TUser tUser,
    required TUserProfile tUserProfile,
  }) = _SuiteUserResult;

  const SuiteUserResult._();
}

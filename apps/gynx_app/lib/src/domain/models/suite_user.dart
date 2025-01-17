import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/t_user.dart';
import 'package:gynx_app/src/domain/entities/t_user_profile.dart';
import 'package:gynx_app/src/domain/entities/v_user_detail.dart';

part '../../generated/src/domain/models/suite_user.freezed.dart';

@freezed
class SuiteUser with _$SuiteUser {
  const factory SuiteUser({
    required VUserDetail vUserDetail,
  }) = _SuiteUser;

  const SuiteUser._();
}

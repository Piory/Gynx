import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/entities/v_user_detail.dart';

part '../../generated/src/domain/models/suite_user.freezed.dart';

@freezed
class SuiteUser with _$SuiteUser {
  const SuiteUser({
    required this.vUserDetail,
  });

  @override
  final VUserDetail vUserDetail;
}

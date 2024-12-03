import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/src/application/usecase/params/sign_up_param.freezed.dart';

@freezed
class SignUpParam with _$SignUpParam {
  const factory SignUpParam({
    required String email,
    required String password,
  }) = _SignUpParam;
}

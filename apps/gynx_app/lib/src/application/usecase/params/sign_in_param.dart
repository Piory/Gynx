import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/src/application/usecase/params/sign_in_param.freezed.dart';

@freezed
class SignInParam with _$SignInParam {
  const factory SignInParam({
    required String email,
    required String password,
  }) = _SignInParam;
}

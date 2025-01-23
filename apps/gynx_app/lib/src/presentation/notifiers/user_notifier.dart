import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/entities/v_user.dart';
import 'package:gynx_app/src/domain/usecases/find_user_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../generated/src/presentation/notifiers/user_notifier.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  FutureOr<VUser> build(String userId) async {
    return await GetIt.I<FindUserUseCase>().execute(userId);
  }
}

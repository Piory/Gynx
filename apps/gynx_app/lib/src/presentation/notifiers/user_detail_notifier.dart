import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/entities/v_user_detail.dart';
import 'package:gynx_app/src/domain/usecases/find_user_detail_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../generated/src/presentation/notifiers/user_detail_notifier.g.dart';

@riverpod
class UserDetailNotifier extends _$UserDetailNotifier {
  @override
  FutureOr<VUserDetail> build(String userId) async {
    return await GetIt.I<FindUserDetailUseCase>().execute(userId);
  }
}

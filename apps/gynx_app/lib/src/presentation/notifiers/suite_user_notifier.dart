import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/models/suite_user.dart';
import 'package:gynx_app/src/domain/usecases/suite_user_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../generated/src/presentation/notifiers/suite_user_notifier.g.dart';

@riverpod
class SuiteUserNotifier extends _$SuiteUserNotifier {
  @override
  FutureOr<SuiteUser> build() async {
    return await GetIt.I<SuiteUserUseCase>().execute();
  }
}

import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/infrastructure/di/injector.config.dart';
import 'package:injectable/injectable.dart';

final GetIt _getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => _getIt.init();

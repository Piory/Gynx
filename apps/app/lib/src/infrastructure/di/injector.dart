import 'package:app/src/infrastructure/di/injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt _getIt = GetIt.instance;

@injectableInit
Future<GetIt> configureDependencies() => _getIt.init();

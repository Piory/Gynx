import 'package:gynx_app/src/domain/generators/uuid_generator.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: UuidGenerator)
class UuidGeneratorImpl implements UuidGenerator {
  const UuidGeneratorImpl(this._uuid);

  final Uuid _uuid;

  @override
  String generate() {
    return _uuid.v4();
  }
}

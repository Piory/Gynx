import 'package:faker/faker.dart';
import 'package:gynx_app/src/domain/entities/user.dart';

final _faker = Faker();

User generateDummyUser() => User(
      id: _faker.guid.guid(),
      authUserId: _faker.guid.guid(),
      createdAt: _faker.date.dateTime(),
      updatedAt: _faker.date.dateTime(),
      deletedAt:
          _faker.randomGenerator.boolean() ? _faker.date.dateTime() : null,
    );

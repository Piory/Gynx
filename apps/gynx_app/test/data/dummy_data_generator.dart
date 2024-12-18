import 'package:faker/faker.dart';
import 'package:gynx_app/src/domain/entities/t_user.dart';
import 'package:gynx_app/src/domain/entities/t_user_profile.dart';

TUser generateDummyTUser() => TUser(
      id: faker.guid.guid(),
      gynxId: faker.guid.guid(),
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

TUserProfile generateDummyTUserProfile() => TUserProfile(
      userId: faker.guid.guid(),
      username: faker.person.name(),
      avatarUrl:
          faker.randomGenerator.boolean() ? faker.image.loremPicsum() : null,
      selfIntroduction:
          faker.randomGenerator.boolean() ? faker.lorem.sentence() : null,
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

import 'package:faker/faker.dart';
import 'package:gynx_app/src/domain/entities/t_user.dart';
import 'package:gynx_app/src/domain/entities/t_user_profile.dart';
import 'package:gynx_app/src/domain/models/suite_user.dart';

SuiteUser generateDummySuiteUser() => SuiteUser(
      tUser: generateDummyTUser(),
      tUserProfile: generateDummyTUserProfile(),
    );

TUser generateDummyTUser() => TUser(
      id: faker.guid.guid(),
      gynxId: 'gynx_id',
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

TUserProfile generateDummyTUserProfile() => TUserProfile(
      userId: faker.guid.guid(),
      username: faker.person.name(),
      avatarUrl:
          faker.randomGenerator.boolean() ? faker.image.loremPicsum() : null,
      selfIntroduction: faker.lorem.sentence(),
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

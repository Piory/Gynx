import 'package:faker/faker.dart';
import 'package:gynx_app/src/application/interactors/suite_user_interactor.dart';
import 'package:gynx_app/src/domain/entities/user.dart';
import 'package:gynx_app/src/domain/exceptions/user_not_signed_in_exception.dart';
import 'package:gynx_app/src/domain/models/suite_user.dart';
import 'package:gynx_app/src/domain/repositories/auth_repository.dart';
import 'package:gynx_app/src/domain/repositories/t_user_profile_repository.dart';
import 'package:gynx_app/src/domain/repositories/t_user_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';
import 'suite_user_interactor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthRepository>(),
  MockSpec<TUserRepository>(),
  MockSpec<TUserProfileRepository>(),
])
void main() {
  final mockAuthRepository = MockAuthRepository();
  final mockTUserRepository = MockTUserRepository();
  final mockTUserProfileRepository = MockTUserProfileRepository();
  final user = User(
    id: faker.guid.guid(),
    displayName: faker.guid.guid(),
    email: faker.guid.guid(),
    providers: [],
    isAnonymous: faker.randomGenerator.boolean(),
    createdAt: DateTime.now(),
    lastSignInAt: DateTime.now(),
  );
  final tUser = generateDummyTUser();
  final tUserProfile = generateDummyTUserProfile();
  final interactor = SuiteUserInteractor(
    mockAuthRepository,
    mockTUserRepository,
    mockTUserProfileRepository,
  );

  tearDown(() {
    verifyNoMoreInteractions(mockAuthRepository);
    verifyNoMoreInteractions(mockTUserRepository);
    verifyNoMoreInteractions(mockTUserProfileRepository);
    reset(mockAuthRepository);
    reset(mockTUserRepository);
    reset(mockTUserProfileRepository);
  });

  group('正常系', () {
    test(
      '正常に、SuiteUser が返されること',
      () async {
        when(mockAuthRepository.currentUser).thenReturn(user);
        when(mockTUserRepository.findByPrimaryKey(user.id))
            .thenAnswer((_) async => tUser);
        when(mockTUserProfileRepository.findByPrimaryKey(user.id))
            .thenAnswer((_) async => tUserProfile);
        expect(
          await interactor.execute(),
          SuiteUser(
            tUser: tUser,
            tUserProfile: tUserProfile,
          ),
        );
        verifyInOrder([
          mockAuthRepository.currentUser,
          mockTUserRepository.findByPrimaryKey(user.id),
          mockTUserProfileRepository.findByPrimaryKey(user.id),
        ]);
      },
    );
  });

  group('異常系', () {
    test(
      'AuthRepository#currentUser で、null が返された場合は、UserNotSignedInException が発生すること',
      () async {
        when(mockAuthRepository.currentUser).thenReturn(null);
        await expectLater(
          interactor.execute,
          throwsA(isA<UserNotSignedInException>()),
        );
        verify(mockAuthRepository.currentUser);
      },
    );
  });
}

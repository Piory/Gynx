import 'package:faker/faker.dart';
import 'package:gynx_app/src/application/usecase/interactors/suite_user_interactor.dart';
import 'package:gynx_app/src/application/usecase/results/suite_user_result.dart';
import 'package:gynx_app/src/domain/entities/user.dart';
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart';
import 'package:gynx_app/src/domain/repositories/t_user_profile_reposirory.dart';
import 'package:gynx_app/src/domain/repositories/t_user_reposirory.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../data/dummy_data_generator.dart';
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
    id: faker.guid.random.toString(),
    displayName: faker.guid.random.toString(),
    email: faker.guid.random.toString(),
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
      'AuthRepository#signOut が呼ばれ、onData に SuiteUserResult が渡され、onDone が呼ばれること',
      () async {
        when(mockAuthRepository.currentUser).thenReturn(user);
        when(mockTUserRepository.findById(user.id))
            .thenAnswer((_) async => tUser);
        when(mockTUserProfileRepository.findByUserId(user.id))
            .thenAnswer((_) async => tUserProfile);
        final stream = await interactor.buildUseCaseStream(null);
        var onDataCallCount = 0;
        stream.listen(
          (result) => expect(
            result,
            SuiteUserResult(
              tUser: tUser,
              tUserProfile: tUserProfile,
            ),
          ),
          onError: (_) => fail('onError should not be called'),
          onDone: () => onDataCallCount++,
        );
        verifyInOrder([
          mockAuthRepository.currentUser,
          mockTUserRepository.findById(user.id),
          mockTUserProfileRepository.findByUserId(user.id),
        ]);
      },
    );
  });

  group('異常系', () {
    test(
      'AuthRepository#currentUser で、null が返された場合は、onError が呼ばれること',
      () async {
        when(mockAuthRepository.currentUser).thenReturn(null);
        final stream = await interactor.buildUseCaseStream(null);
        stream.listen(
          (_) => fail('onData should not be called'),
          onError: (dynamic e) {
            expect(e, isA<Exception>());
            expect(e.toString(), 'Exception: User is not signed in');
          },
          onDone: () => fail('onDone should not be called'),
        );
        verify(mockAuthRepository.currentUser);
      },
    );

    test(
      'AuthRepository#currentUser で、Exception が発生した場合は、onError が呼ばれること',
      () async {
        final exception = Exception(faker.guid.guid());
        when(mockAuthRepository.currentUser).thenThrow(exception);
        final stream = await interactor.buildUseCaseStream(null);
        stream.listen(
          (_) => fail('onData should not be called'),
          onError: (dynamic e) => expect(e, exception),
          onDone: () => fail('onDone should not be called'),
        );
        verify(mockAuthRepository.currentUser);
      },
    );

    test(
      'TUserRepository#findByAuthUserId で、Exception が発生した場合は、onError が呼ばれること',
      () async {
        when(mockAuthRepository.currentUser).thenReturn(user);
        final exception = Exception(faker.guid.guid());
        when(mockTUserRepository.findById(user.id)).thenThrow(exception);
        final stream = await interactor.buildUseCaseStream(null);
        stream.listen(
          (_) => fail('onData should not be called'),
          onError: (dynamic e) => expect(e, exception),
          onDone: () => fail('onDone should not be called'),
        );
        verifyInOrder([
          mockAuthRepository.currentUser,
          mockTUserRepository.findById(user.id),
        ]);
      },
    );

    test(
      'TUserProfileRepository#findByUserId で、Exception が発生した場合は、onError が呼ばれること',
      () async {
        when(mockAuthRepository.currentUser).thenReturn(user);
        when(mockTUserRepository.findById(user.id))
            .thenAnswer((_) async => tUser);
        final exception = Exception(faker.guid.guid());
        when(mockTUserProfileRepository.findByUserId(user.id))
            .thenThrow(exception);
        final stream = await interactor.buildUseCaseStream(null);
        stream.listen(
          (_) => fail('onData should not be called'),
          onError: (dynamic e) => expect(e, exception),
          onDone: () => fail('onDone should not be called'),
        );
        verifyInOrder([
          mockAuthRepository.currentUser,
          mockTUserRepository.findById(user.id),
          mockTUserProfileRepository.findByUserId(user.id),
        ]);
      },
    );
  });
}

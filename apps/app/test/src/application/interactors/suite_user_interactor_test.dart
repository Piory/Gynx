// ignore_for_file: lines_longer_than_80_chars
import 'package:app/src/application/interactors/suite_user_interactor.dart';
import 'package:app/src/domain/entities/user.dart';
import 'package:app/src/domain/exceptions/user_not_signed_in_exception.dart';
import 'package:app/src/domain/models/suite_user.dart';
import 'package:app/src/domain/repositories/auth_repository.dart';
import 'package:app/src/domain/repositories/v_user_detail_repository.dart';
import 'package:faker/faker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';
import 'suite_user_interactor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthRepository>(),
  MockSpec<VUserDetailRepository>(),
])
void main() {
  final mockAuthRepository = MockAuthRepository();
  final mockVUserDetailRepository = MockVUserDetailRepository();
  final user = User(
    id: faker.guid.guid(),
    displayName: faker.guid.guid(),
    email: faker.guid.guid(),
    providers: [],
    isAnonymous: faker.randomGenerator.boolean(),
    createdAt: DateTime.now(),
    lastSignInAt: DateTime.now(),
  );
  final vUserDetail = generateDummyVUserDetail();
  final interactor = SuiteUserInteractor(
    mockAuthRepository,
    mockVUserDetailRepository,
  );

  tearDown(() {
    verifyNoMoreInteractions(mockAuthRepository);
    verifyNoMoreInteractions(mockVUserDetailRepository);
    reset(mockAuthRepository);
    reset(mockVUserDetailRepository);
  });

  group('正常系', () {
    test(
      '正常に、SuiteUser が返されること',
      () async {
        when(mockAuthRepository.currentUser).thenReturn(user);
        when(mockVUserDetailRepository.findByUserId(user.id)).thenAnswer((_) async => vUserDetail);
        expect(
          await interactor.execute(),
          SuiteUser(
            vUserDetail: vUserDetail,
          ),
        );
        verifyInOrder([
          mockAuthRepository.currentUser,
          mockVUserDetailRepository.findByUserId(user.id),
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

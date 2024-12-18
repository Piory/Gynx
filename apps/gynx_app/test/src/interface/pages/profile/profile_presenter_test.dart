// ignore_for_file: close_sinks, lines_longer_than_80_chars
import 'dart:async';

import 'package:faker/faker.dart';
import 'package:gynx_app/src/application/usecase/interactors/sign_out_interactor.dart';
import 'package:gynx_app/src/application/usecase/interactors/suite_user_interactor.dart';
import 'package:gynx_app/src/application/usecase/results/suite_user_result.dart';
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart';
import 'package:gynx_app/src/domain/repositories/t_user_profile_reposirory.dart';
import 'package:gynx_app/src/domain/repositories/t_user_reposirory.dart';
import 'package:gynx_app/src/interface/pages/profile/profile_presenter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../data/dummy_data_generator.dart';
import 'profile_presenter_test.mocks.dart';

class SpySuiteUserInteractor extends SuiteUserInteractor {
  SpySuiteUserInteractor(this._mockSuiteUserInteractor)
      : super(
          MockAuthRepository(),
          MockTUserRepository(),
          MockTUserProfileRepository(),
        );

  final MockSuiteUserInteractor _mockSuiteUserInteractor;

  @override
  Future<Stream<SuiteUserResult>> buildUseCaseStream(dynamic params) async {
    return _mockSuiteUserInteractor.buildUseCaseStream(params);
  }

  @override
  void dispose() {
    _mockSuiteUserInteractor.dispose();
  }
}

class SpySignOutInteractor extends SignOutInteractor {
  SpySignOutInteractor(this._mockSignOutInteractor)
      : super(MockAuthRepository());

  final MockSignOutInteractor _mockSignOutInteractor;

  @override
  Future<Stream<void>> buildUseCaseStream(dynamic params) async {
    return _mockSignOutInteractor.buildUseCaseStream(params);
  }

  @override
  void dispose() {
    _mockSignOutInteractor.dispose();
  }
}

@GenerateNiceMocks([
  MockSpec<AuthRepository>(),
  MockSpec<TUserRepository>(),
  MockSpec<TUserProfileRepository>(),
  MockSpec<SuiteUserInteractor>(),
  MockSpec<SignOutInteractor>(),
])
void main() {
  final mockSuiteUserInteractor = MockSuiteUserInteractor();
  final spySuiteUserInteractor =
      SpySuiteUserInteractor(mockSuiteUserInteractor);
  final mockSignOutInteractor = MockSignOutInteractor();
  final spySignOutInteractor = SpySignOutInteractor(mockSignOutInteractor);
  late ProfilePresenter presenter;

  setUp(() {
    presenter = ProfilePresenter(
      spySuiteUserInteractor,
      spySignOutInteractor,
    );
  });

  tearDown(() {
    verifyNoMoreInteractions(mockSuiteUserInteractor);
    verifyNoMoreInteractions(mockSignOutInteractor);
    reset(mockSuiteUserInteractor);
    reset(mockSignOutInteractor);
  });

  group('#suiteUser', () {
    group('正常系', () {
      test(
        'SuiteUserInteractor の処理が正常に完了した場合は、signInOnComplete が呼ばれること',
        () async {
          final result = SuiteUserResult(
            tUser: generateDummyTUser(),
            tUserProfile: generateDummyTUserProfile(),
          );
          when(
            mockSuiteUserInteractor.buildUseCaseStream(null),
          ).thenAnswer((_) async {
            final streamController = StreamController<SuiteUserResult>()
              ..add(result);
            unawaited(streamController.close());
            return streamController.stream;
          });
          final completer = Completer<void>();
          var suiteUserOnCompleteCallCount = 0;
          presenter
            ..suiteUserOnNext = ((r) {
              expect(r, result);
            })
            ..suiteUserOnComplete = (() {
              suiteUserOnCompleteCallCount++;
              completer.complete();
            })
            ..suiteUserOnError = ((_) => fail('unexpected call'))
            ..suiteUser();
          await completer.future;
          expect(suiteUserOnCompleteCallCount, 1);
          verify(mockSuiteUserInteractor.buildUseCaseStream(null));
        },
      );
    });

    group('異常系', () {
      test(
        'SuiteUserInteractor の処理でエラーが発生した場合は、signInOnError が呼ばれること',
        () async {
          final error = Exception(faker.guid.guid());
          when(
            mockSuiteUserInteractor.buildUseCaseStream(null),
          ).thenAnswer((_) async {
            final streamController = StreamController<SuiteUserResult>()
              ..addError(error);
            return streamController.stream;
          });
          final completer = Completer<void>();
          var suiteUserOnErrorCallCount = 0;
          presenter
            ..suiteUserOnNext = ((_) => fail('unexpected call'))
            ..suiteUserOnComplete = (() => fail('unexpected call'))
            ..suiteUserOnError = (e) {
              expect(e, error);
              suiteUserOnErrorCallCount++;
              completer.complete();
            }
            ..suiteUser();
          await completer.future;
          expect(suiteUserOnErrorCallCount, 1);
          verify(mockSuiteUserInteractor.buildUseCaseStream(null));
        },
      );
    });
  });

  group('#signOut', () {
    group('正常系', () {
      test(
        'SignOutInteractor の処理が正常に完了した場合は、signOutOnComplete が呼ばれること',
        () async {
          when(
            mockSignOutInteractor.buildUseCaseStream(null),
          ).thenAnswer((_) async {
            final streamController = StreamController<void>();
            unawaited(streamController.close());
            return streamController.stream;
          });
          final completer = Completer<void>();
          var signOutOnCompleteCallCount = 0;
          presenter
            ..signOutOnComplete = (() {
              signOutOnCompleteCallCount++;
              completer.complete();
            })
            ..signOutOnError = ((_) => fail('unexpected call'))
            ..signOut();
          await completer.future;
          expect(signOutOnCompleteCallCount, 1);
          verify(mockSignOutInteractor.buildUseCaseStream(null));
        },
      );
    });

    group('異常系', () {
      test(
        'SignOutInteractor の処理で StreamController#add が呼ばれた場合は、UnimplementedError がスローされること',
        () async {
          when(
            mockSignOutInteractor.buildUseCaseStream(null),
          ).thenAnswer((_) async {
            final streamController = StreamController<void>()..add(null);
            return streamController.stream;
          });
          runZonedGuarded(
            () => presenter
              ..signOutOnComplete = (() => fail('unexpected call'))
              ..signOutOnError = ((_) => fail('unexpected call'))
              ..signOut(),
            (e, _) {
              expect(e, isA<UnimplementedError>());
            },
          );
          verify(mockSignOutInteractor.buildUseCaseStream(null));
        },
      );

      test(
        'SignOutInteractor の処理でエラーが発生した場合は、signInOnError が呼ばれること',
        () async {
          final error = Exception(faker.guid.guid());
          when(
            mockSignOutInteractor.buildUseCaseStream(null),
          ).thenAnswer((_) async {
            final streamController = StreamController<void>()..addError(error);
            return streamController.stream;
          });
          final completer = Completer<void>();
          var signOutOnErrorCallCount = 0;
          presenter
            ..signOutOnComplete = (() => fail('unexpected call'))
            ..signOutOnError = (e) {
              expect(e, error);
              signOutOnErrorCallCount++;
              completer.complete();
            }
            ..signOut();
          await completer.future;
          expect(signOutOnErrorCallCount, 1);
          verify(mockSignOutInteractor.buildUseCaseStream(null));
        },
      );
    });
  });

  group('#dispose', () {
    group('正常系', () {
      test('SignInWithOAuthInteractor#dispose が正常に呼ばれること', () async {
        presenter.dispose();
        verify(mockSuiteUserInteractor.dispose());
        verify(mockSignOutInteractor.dispose());
      });
    });
  });
}

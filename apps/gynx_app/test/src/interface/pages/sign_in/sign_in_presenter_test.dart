// ignore_for_file: close_sinks, lines_longer_than_80_chars
import 'dart:async';

import 'package:faker/faker.dart';
import 'package:gynx_app/src/application/usecase/interactors/sign_in_interactor.dart';
import 'package:gynx_app/src/application/usecase/params/sign_in_param.dart';
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart';
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_presenter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'sign_in_presenter_test.mocks.dart';

class SpySignInInteractor extends SignInInteractor {
  SpySignInInteractor(this._mockSignInInteractor) : super(MockAuthRepository());

  final MockSignInInteractor _mockSignInInteractor;

  @override
  Future<Stream<void>> buildUseCaseStream(SignInParam? params) async {
    return _mockSignInInteractor.buildUseCaseStream(params);
  }

  @override
  void dispose() {
    _mockSignInInteractor.dispose();
  }
}

@GenerateNiceMocks([
  MockSpec<AuthRepository>(),
  MockSpec<SignInInteractor>(),
])
void main() {
  final faker = Faker();
  final mockSignInInteractor = MockSignInInteractor();
  final spySignInInteractor = SpySignInInteractor(mockSignInInteractor);
  late SignInPresenter presenter;

  setUp(() {
    presenter = SignInPresenter(spySignInInteractor);
  });

  tearDown(() {
    reset(mockSignInInteractor);
  });

  group('#signIn', () {
    group('正常系', () {
      test(
        'SignInInteractor の処理が正常に完了した場合は、signInOnComplete が呼ばれること',
        () async {
          final email = faker.internet.email();
          final password = faker.guid.guid();
          final param = SignInParam(
            email: email,
            password: password,
          );
          when(
            mockSignInInteractor.buildUseCaseStream(param),
          ).thenAnswer((_) async {
            final streamController = StreamController<void>();
            unawaited(streamController.close());
            return streamController.stream;
          });
          final completer = Completer<void>();
          var signInOnCompleteCallCount = 0;
          presenter
            ..signInOnComplete = (() {
              signInOnCompleteCallCount++;
              completer.complete();
            })
            ..signInOnError = ((_) => fail('unexpected call'))
            ..signIn(email, password);
          await completer.future;
          expect(signInOnCompleteCallCount, 1);
          verify(mockSignInInteractor.buildUseCaseStream(param));
        },
      );
    });

    group('異常系', () {
      test(
        'SignInInteractor の処理で StreamController#add が呼ばれた場合は、UnimplementedError がスローされること',
        () async {
          final email = faker.internet.email();
          final password = faker.guid.guid();
          final param = SignInParam(
            email: email,
            password: password,
          );
          when(
            mockSignInInteractor.buildUseCaseStream(param),
          ).thenAnswer((_) async {
            final streamController = StreamController<void>()..add(null);
            return streamController.stream;
          });
          runZonedGuarded(
            () => presenter
              ..signInOnComplete = (() => fail('unexpected call'))
              ..signInOnError = ((_) => fail('unexpected call'))
              ..signIn(email, password),
            (e, _) {
              expect(e, isA<UnimplementedError>());
            },
          );
          verify(
            mockSignInInteractor.buildUseCaseStream(
              SignInParam(
                email: email,
                password: password,
              ),
            ),
          );
        },
      );

      test('SignInInteractor の処理でエラーが発生した場合は、signInOnError が呼ばれること', () async {
        final email = faker.internet.email();
        final password = faker.guid.guid();
        final param = SignInParam(
          email: email,
          password: password,
        );
        final error = Exception(faker.guid.guid());
        when(
          mockSignInInteractor.buildUseCaseStream(param),
        ).thenAnswer((_) async {
          final streamController = StreamController<void>()..addError(error);
          return streamController.stream;
        });
        final completer = Completer<void>();
        var signInOnErrorCallCount = 0;
        presenter
          ..signInOnComplete = (() => fail('unexpected call'))
          ..signInOnError = (e) {
            expect(e, error);
            signInOnErrorCallCount++;
            completer.complete();
          }
          ..signIn(email, password);
        await completer.future;
        expect(signInOnErrorCallCount, 1);
        verify(
          mockSignInInteractor.buildUseCaseStream(
            SignInParam(
              email: email,
              password: password,
            ),
          ),
        );
      });
    });
  });

  group('#dispose', () {
    group('正常系', () {
      test('SignInInteractor#dispose が正常に呼ばれること', () async {
        presenter.dispose();
        verify(mockSignInInteractor.dispose());
      });
    });
  });
}

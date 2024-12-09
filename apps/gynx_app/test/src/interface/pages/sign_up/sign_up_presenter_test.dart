// ignore_for_file: close_sinks, lines_longer_than_80_chars
import 'dart:async';

import 'package:faker/faker.dart';
import 'package:gynx_app/src/application/usecase/interactors/sign_up_interactor.dart';
import 'package:gynx_app/src/application/usecase/params/sign_up_param.dart';
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart';
import 'package:gynx_app/src/interface/pages/sign_up/sign_up_presenter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'sign_up_presenter_test.mocks.dart';

class SpySignUpInteractor extends SignUpInteractor {
  SpySignUpInteractor(this._mockSignUpInteractor) : super(MockAuthRepository());

  final MockSignUpInteractor _mockSignUpInteractor;

  @override
  Future<Stream<void>> buildUseCaseStream(SignUpParam? params) async {
    return _mockSignUpInteractor.buildUseCaseStream(params);
  }

  @override
  void dispose() {
    _mockSignUpInteractor.dispose();
  }
}

@GenerateNiceMocks([
  MockSpec<AuthRepository>(),
  MockSpec<SignUpInteractor>(),
])
void main() {
  final faker = Faker();
  final mockSignUpInteractor = MockSignUpInteractor();
  final spySignUpInteractor = SpySignUpInteractor(mockSignUpInteractor);
  late SignUpPresenter presenter;

  setUp(() {
    presenter = SignUpPresenter(spySignUpInteractor);
  });

  tearDown(() {
    reset(mockSignUpInteractor);
  });

  group('#signUp', () {
    group('正常系', () {
      test(
        'SignUpInteractor の処理が正常に完了した場合は、signUpOnComplete が呼ばれること',
        () async {
          final email = faker.internet.email();
          final password = faker.guid.guid();
          final param = SignUpParam(
            email: email,
            password: password,
          );
          when(
            mockSignUpInteractor.buildUseCaseStream(param),
          ).thenAnswer((_) async {
            final streamController = StreamController<void>();
            unawaited(streamController.close());
            return streamController.stream;
          });
          final completer = Completer<void>();
          var signUpOnCompleteCallCount = 0;
          presenter
            ..signUpOnComplete = (() {
              signUpOnCompleteCallCount++;
              completer.complete();
            })
            ..signUpOnError = ((_) => fail('unexpected call'))
            ..signUp(email, password);
          await completer.future;
          expect(signUpOnCompleteCallCount, 1);
          verify(mockSignUpInteractor.buildUseCaseStream(param));
        },
      );
    });

    group('異常系', () {
      test(
        'SignUpInteractor の処理で StreamController#add が呼ばれた場合は、UnimplementedError がスローされること',
        () async {
          final email = faker.internet.email();
          final password = faker.guid.guid();
          final param = SignUpParam(
            email: email,
            password: password,
          );
          when(
            mockSignUpInteractor.buildUseCaseStream(param),
          ).thenAnswer((_) async {
            final streamController = StreamController<void>()..add(null);
            return streamController.stream;
          });
          runZonedGuarded(
            () => presenter
              ..signUpOnComplete = (() => fail('unexpected call'))
              ..signUpOnError = ((_) => fail('unexpected call'))
              ..signUp(email, password),
            (e, _) {
              expect(e, isA<UnimplementedError>());
            },
          );
          verify(
            mockSignUpInteractor.buildUseCaseStream(
              SignUpParam(
                email: email,
                password: password,
              ),
            ),
          );
        },
      );

      test('SignUpInteractor の処理でエラーが発生した場合は、signUpOnError が呼ばれること', () async {
        final email = faker.internet.email();
        final password = faker.guid.guid();
        final param = SignUpParam(
          email: email,
          password: password,
        );
        final error = Exception(faker.guid.guid());
        when(
          mockSignUpInteractor.buildUseCaseStream(param),
        ).thenAnswer((_) async {
          final streamController = StreamController<void>()..addError(error);
          return streamController.stream;
        });
        final completer = Completer<void>();
        var signUpOnErrorCallCount = 0;
        presenter
          ..signUpOnComplete = (() => fail('unexpected call'))
          ..signUpOnError = (e) {
            expect(e, error);
            signUpOnErrorCallCount++;
            completer.complete();
          }
          ..signUp(email, password);
        await completer.future;
        expect(signUpOnErrorCallCount, 1);
        verify(
          mockSignUpInteractor.buildUseCaseStream(
            SignUpParam(
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
      test('SignUpInteractor#dispose が正常に呼ばれること', () async {
        presenter.dispose();
        verify(mockSignUpInteractor.dispose());
      });
    });
  });
}

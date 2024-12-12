// ignore_for_file: close_sinks, lines_longer_than_80_chars
import 'dart:async';

import 'package:faker/faker.dart';
import 'package:gynx_app/src/application/usecase/interactors/sign_in_with_anonymous_interactor.dart';
import 'package:gynx_app/src/application/usecase/interactors/sign_in_with_oauth_interactor.dart';
import 'package:gynx_app/src/application/usecase/params/sign_in_with_oauth_param.dart';
import 'package:gynx_app/src/domain/enums/oauth_provider_type.dart';
import 'package:gynx_app/src/domain/repositories/auth_reposirory.dart';
import 'package:gynx_app/src/interface/pages/sign_in/sign_in_presenter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'sign_in_presenter_test.mocks.dart';

class SpySignInWithAnonymousInteractor extends SignInWithAnonymousInteractor {
  SpySignInWithAnonymousInteractor(this._mockSignInWithAnonymousInteractor)
      : super(MockAuthRepository());

  final MockSignInWithAnonymousInteractor _mockSignInWithAnonymousInteractor;

  @override
  Future<Stream<void>> buildUseCaseStream(dynamic params) async {
    return _mockSignInWithAnonymousInteractor.buildUseCaseStream(params);
  }

  @override
  void dispose() {
    _mockSignInWithAnonymousInteractor.dispose();
  }
}

class SpySignInWithOAuthInteractor extends SignInWithOAuthInteractor {
  SpySignInWithOAuthInteractor(this._mockSignInWithOAuthInteractor)
      : super(MockAuthRepository());

  final MockSignInWithOAuthInteractor _mockSignInWithOAuthInteractor;

  @override
  Future<Stream<void>> buildUseCaseStream(SignInWithOAuthParam? params) async {
    return _mockSignInWithOAuthInteractor.buildUseCaseStream(params);
  }

  @override
  void dispose() {
    _mockSignInWithOAuthInteractor.dispose();
  }
}

@GenerateNiceMocks([
  MockSpec<AuthRepository>(),
  MockSpec<SignInWithAnonymousInteractor>(),
  MockSpec<SignInWithOAuthInteractor>(),
])
void main() {
  final mockSignInWithAnonymousInteractor = MockSignInWithAnonymousInteractor();
  final spySignInWithAnonymousInteractor =
      SpySignInWithAnonymousInteractor(mockSignInWithAnonymousInteractor);
  final mockSignInWithOAuthInteractor = MockSignInWithOAuthInteractor();
  final spySignInWithOAuthInteractor =
      SpySignInWithOAuthInteractor(mockSignInWithOAuthInteractor);
  late SignInPresenter presenter;

  setUp(() {
    presenter = SignInPresenter(
      spySignInWithAnonymousInteractor,
      spySignInWithOAuthInteractor,
    );
  });

  tearDown(() {
    verifyNoMoreInteractions(mockSignInWithAnonymousInteractor);
    verifyNoMoreInteractions(mockSignInWithOAuthInteractor);
    reset(mockSignInWithAnonymousInteractor);
    reset(mockSignInWithOAuthInteractor);
  });

  group('#signInWithAnonymous', () {
    group('正常系', () {
      test(
        'SignInWithAnonymousInteractor の処理が正常に完了した場合は、signInOnComplete が呼ばれること',
        () async {
          when(
            mockSignInWithAnonymousInteractor.buildUseCaseStream(null),
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
            ..signInWithAnonymous();
          await completer.future;
          expect(signInOnCompleteCallCount, 1);
          verify(mockSignInWithAnonymousInteractor.buildUseCaseStream(null));
        },
      );
    });

    group('異常系', () {
      test(
        'SignInWithAnonymousInteractor の処理で StreamController#add が呼ばれた場合は、UnimplementedError がスローされること',
        () async {
          when(
            mockSignInWithAnonymousInteractor.buildUseCaseStream(null),
          ).thenAnswer((_) async {
            final streamController = StreamController<void>()..add(null);
            return streamController.stream;
          });
          runZonedGuarded(
            () => presenter
              ..signInOnComplete = (() => fail('unexpected call'))
              ..signInOnError = ((_) => fail('unexpected call'))
              ..signInWithAnonymous(),
            (e, _) {
              expect(e, isA<UnimplementedError>());
            },
          );
          verify(mockSignInWithAnonymousInteractor.buildUseCaseStream(null));
        },
      );

      test(
        'SignInWithAnonymousInteractor の処理でエラーが発生した場合は、signInOnError が呼ばれること',
        () async {
          final error = Exception(faker.guid.guid());
          when(
            mockSignInWithAnonymousInteractor.buildUseCaseStream(null),
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
            ..signInWithAnonymous();
          await completer.future;
          expect(signInOnErrorCallCount, 1);
          verify(mockSignInWithAnonymousInteractor.buildUseCaseStream(null));
        },
      );
    });
  });

  for (final oauthProviderType in OAuthProviderType.values) {
    group('#signInWithOAuth（oauthProviderType: $oauthProviderType）', () {
      group('正常系', () {
        test(
          'SignInWithOAuthInteractor の処理が正常に完了した場合は、signInOnComplete が呼ばれること',
          () async {
            final param = SignInWithOAuthParam(
              oauthProviderType: oauthProviderType,
            );
            when(
              mockSignInWithOAuthInteractor.buildUseCaseStream(param),
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
              ..signInWithOAuth(oauthProviderType);
            await completer.future;
            expect(signInOnCompleteCallCount, 1);
            verify(mockSignInWithOAuthInteractor.buildUseCaseStream(param));
          },
        );
      });

      group('異常系', () {
        test(
          'SignInWithOAuthInteractor の処理で StreamController#add が呼ばれた場合は、UnimplementedError がスローされること',
          () async {
            final param = SignInWithOAuthParam(
              oauthProviderType: oauthProviderType,
            );
            when(
              mockSignInWithOAuthInteractor.buildUseCaseStream(param),
            ).thenAnswer((_) async {
              final streamController = StreamController<void>()..add(null);
              return streamController.stream;
            });
            runZonedGuarded(
              () => presenter
                ..signInOnComplete = (() => fail('unexpected call'))
                ..signInOnError = ((_) => fail('unexpected call'))
                ..signInWithOAuth(oauthProviderType),
              (e, _) {
                expect(e, isA<UnimplementedError>());
              },
            );
            verify(
              mockSignInWithOAuthInteractor.buildUseCaseStream(
                SignInWithOAuthParam(
                  oauthProviderType: oauthProviderType,
                ),
              ),
            );
          },
        );

        test('SignInWithOAuthInteractor の処理でエラーが発生した場合は、signInOnError が呼ばれること',
            () async {
          final param = SignInWithOAuthParam(
            oauthProviderType: oauthProviderType,
          );
          final error = Exception(faker.guid.guid());
          when(
            mockSignInWithOAuthInteractor.buildUseCaseStream(param),
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
            ..signInWithOAuth(oauthProviderType);
          await completer.future;
          expect(signInOnErrorCallCount, 1);
          verify(
            mockSignInWithOAuthInteractor.buildUseCaseStream(
              SignInWithOAuthParam(
                oauthProviderType: oauthProviderType,
              ),
            ),
          );
        });
      });
    });
  }

  group('#dispose', () {
    group('正常系', () {
      test('SignInWithOAuthInteractor#dispose が正常に呼ばれること', () async {
        presenter.dispose();
        verify(mockSignInWithAnonymousInteractor.dispose());
        verify(mockSignInWithOAuthInteractor.dispose());
      });
    });
  });
}

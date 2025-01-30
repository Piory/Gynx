// ignore_for_file: lines_longer_than_80_chars
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/enums/media_type.dart';
import 'package:gynx_app/src/domain/models/media.dart';
import 'package:gynx_app/src/domain/models/media_list.dart';
import 'package:gynx_app/src/domain/usecases/create_post_usecase.dart';
import 'package:gynx_app/src/presentation/notifiers/suite_user_notifier.dart';
import 'package:gynx_app/src/presentation/notifiers/timeline_notifier.dart';
import 'package:gynx_app/src/presentation/pages/home/home_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../data/dummy_data_generator.dart';
import 'home_controller_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CreatePostUseCase>(),
  MockSpec<SuiteUserNotifier>(),
  MockSpec<TimelineNotifier>(),
])
void main() {
  final mockCreatePostUseCase = MockCreatePostUseCase();
  final mockSuiteUserNotifier = MockSuiteUserNotifier();
  final mockTimelineNotifier = MockTimelineNotifier();
  final homeController = HomeController(
    mockCreatePostUseCase,
  );

  final vPost = generateDummyVPost(postId: faker.randomGenerator.integer(100));

  setUpAll(() {
    GetIt.I.registerSingleton<CreatePostUseCase>(mockCreatePostUseCase);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockSuiteUserNotifier);
    verifyNoMoreInteractions(mockTimelineNotifier);
    verifyNoMoreInteractions(mockCreatePostUseCase);
    reset(mockSuiteUserNotifier);
    reset(mockTimelineNotifier);
    reset(mockCreatePostUseCase);
  });

  group('#createPost', () {
    group('正常系', () {
      test('CreatePostUseCase#execute が呼ばれること', () async {
        final text = faker.lorem.sentence();
        final path1 = faker.image.loremPicsum();
        final path2 = faker.image.loremPicsum();
        when(
          mockCreatePostUseCase.execute(
            text: text,
            mediaList: MediaList(
              [
                Media(
                  type: MediaType.image,
                  url: path1,
                ),
                Media(
                  type: MediaType.image,
                  url: path2,
                ),
              ],
            ),
          ),
        ).thenAnswer((_) async => vPost);
        await homeController.createPost(
          suiteUserNotifier: mockSuiteUserNotifier,
          timelineNotifier: mockTimelineNotifier,
          text: text,
          mediaPaths: [path1, path2],
        );
        verifyInOrder([
          mockCreatePostUseCase.execute(
            text: text,
            mediaList: MediaList(
              [
                Media(
                  type: MediaType.image,
                  url: path1,
                ),
                Media(
                  type: MediaType.image,
                  url: path2,
                ),
              ],
            ),
          ),
          mockTimelineNotifier.add(vPost.postId),
          mockSuiteUserNotifier.addPost(vPost),
        ]);
      });
    });
  });
}
